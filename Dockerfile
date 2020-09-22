# Docker file for Unaquired Sites pipeline
# Socorro Dominguez, July, 2020

# use python:3 as the base image
FROM python:3

# install dependencies
# install numpy, pandas & matplotlib
RUN pip3 install numpy
RUN pip3 install pandas
RUN apt-get update && \
    pip3 install matplotlib && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install scikit-learn

RUN pip3 install nltk

RUN pip3 install argparse

RUN pip3 install plotly
RUN pip3 install dash


RUN pip3 install dash_html_components
RUN pip3 install dash_core_components
RUN pip3 install dash_table
RUN pip3 install dash
RUN pip3 install dash_extensions

COPY src/modules /app
RUN ls -alp /app

#COPY output/predictions /app/input

WORKDIR /app
COPY . /app

CMD ["python3", "/app/dashboard/record_mining_dashboard.py", "--output_path=/app/output"]

#COPY output/from_dashboard /app/output

# how to build docker image
# docker build . -t my_eigth_xdd_app

# how to run image
# docker run -v /Users/seiryu8808/Desktop/UWinsc/Github/UnacquiredSites/output/predictions:/app/input -v /Users/seiryu8808/Desktop/UWinsc/Github/UnacquiredSites/output/from_dashboard:/app/output -p 8050:8050 my_eigth_xdd_app:latest
