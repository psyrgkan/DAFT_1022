import pandas as pd
import numpy as np
import streamlit as st
import matplotlib.pyplot as plt
from sklearn import datasets
import plotly.express as px


st.set_page_config(layout="wide")
st.title("Breast Cancer Stats")

breast_cancer = datasets.load_breast_cancer(as_frame=True)

breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)

breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]

def make_grid(cols,rows):
    grid = [0]*cols
    for i in range(cols):
        with st.container():
            grid[i] = st.columns(rows)
    return grid

with st.expander("Scatter plot with dropdowns here"):
    option_x = st.selectbox('X-axis', ('mean radius', 'mean texture', 'mean perimeter', 'mean area',
       'mean smoothness', 'mean compactness', 'mean concavity',
       'mean concave points', 'mean symmetry', 'mean fractal dimension',
       'radius error', 'texture error', 'perimeter error', 'area error',
       'smoothness error', 'compactness error', 'concavity error',
       'concave points error', 'symmetry error', 'fractal dimension error',
       'worst radius', 'worst texture', 'worst perimeter', 'worst area',
       'worst smoothness', 'worst compactness', 'worst concavity',
       'worst concave points', 'worst symmetry', 'worst fractal dimension',
       'target'), 1)

    option_y = st.selectbox('Y-axis', ('mean radius', 'mean texture', 'mean perimeter', 'mean area',
       'mean smoothness', 'mean compactness', 'mean concavity',
       'mean concave points', 'mean symmetry', 'mean fractal dimension',
       'radius error', 'texture error', 'perimeter error', 'area error',
       'smoothness error', 'compactness error', 'concavity error',
       'concave points error', 'symmetry error', 'fractal dimension error',
       'worst radius', 'worst texture', 'worst perimeter', 'worst area',
       'worst smoothness', 'worst compactness', 'worst concavity',
       'worst concave points', 'worst symmetry', 'worst fractal dimension',
       'target'))
    
    fig = px.scatter(breast_cancer_df, x=option_x, y=option_y)
    st.plotly_chart(fig, use_container_width=True)

with st.expander("Multi-Select for Bar Chart"):
    options = st.multiselect('Select features to see averages',
    ['mean radius', 'mean texture', 'mean perimeter', 'mean area',
       'mean smoothness', 'mean compactness', 'mean concavity',
       'mean concave points', 'mean symmetry', 'mean fractal dimension',
       'radius error', 'texture error', 'perimeter error', 'area error',
       'smoothness error', 'compactness error', 'concavity error',
       'concave points error', 'symmetry error', 'fractal dimension error',
       'worst radius', 'worst texture', 'worst perimeter', 'worst area',
       'worst smoothness', 'worst compactness', 'worst concavity',
       'worst concave points', 'worst symmetry', 'worst fractal dimension'],
    ['mean radius', 'mean texture', 'mean concave points', 'mean symmetry'])

    st.bar_chart(breast_cancer_df[options].mean())

with st.expander("Multi-Select and Radio Buttons for Histogram"):

    options = st.multiselect('Select features to see histograms',
    ['mean radius', 'mean texture', 'mean perimeter', 'mean area',
       'mean smoothness', 'mean compactness', 'mean concavity',
       'mean concave points', 'mean symmetry', 'mean fractal dimension',
       'radius error', 'texture error', 'perimeter error', 'area error',
       'smoothness error', 'compactness error', 'concavity error',
       'concave points error', 'symmetry error', 'fractal dimension error',
       'worst radius', 'worst texture', 'worst perimeter', 'worst area',
       'worst smoothness', 'worst compactness', 'worst concavity',
       'worst concave points', 'worst symmetry', 'worst fractal dimension'],
    ['mean radius', 'mean texture'], max_selections=4)

    bins = st.radio("Select number of bins",
    (10, 20, 50))

    mygrid = make_grid(2,2)

    for i in range(len(options)):
        fig = px.histogram(breast_cancer_df, x=options[i], nbins=bins)

        mygrid[i//2][i%2].plotly_chart(fig)


with st.expander("Random Hexbin"):

    hexbin_x_axis = st.selectbox("Hexbin-X-Axis", breast_cancer_df.columns.tolist(), index=0)
    hexbin_y_axis = st.selectbox("Hexbin-Y-Axis", breast_cancer_df.columns.tolist(), index=1)

    if hexbin_x_axis and hexbin_y_axis:
        hexbin_fig = plt.figure(figsize=(6,4))

        hexbin_ax = hexbin_fig.add_subplot(111)

        breast_cancer_df.plot.hexbin(x=hexbin_x_axis, y=hexbin_y_axis,
                                    reduce_C_function=np.mean,
                                    gridsize=25,
                                    #cmap="Greens",
                                    ax=hexbin_ax, title="Concentration of Measurements")

        st.pyplot(hexbin_fig)
