import socket
import streamlit as st

st.title("Title")

local_ip = socket.gethostbyname(socket.gethostname())
st.write(f"Your local IP address is {local_ip}")
