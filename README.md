# streamlit-to-exe-demo

This is an example of how to convert a streamlit app from Linux or Windows to an executable for Windows (.exe). To do this, we use the `pynsist` package.

Demo based on [takluyver/pynsist](https://github.com/takluyver/pynsist/tree/master/examples/streamlit).


## How to run

1. Clone this repo
2. Launch the development container or install the dependencies and `NSIS` in your environment.
3. Run `streamlit run src/app.py` to launch the app.
4. Run `pynsist installer.cfg` to build the executable (The app do not need to be running). 
5. Double-click `build\nsis\Windows_Streamlit_App_0.1.0.exe` to launch the executable in Windows.

# Pynsist

## Install NSIS

NSIS is a tool for creating Windows installers. It is used by pynsist to create the installer for the application.

### Windows

You can install NSIS by downloading the installer from the [NSIS website](http://nsis.sourceforge.net/Download).

### Linux

You can install NSIS using your package manager. For example, on Ubuntu:

```bash
sudo apt update
sudo apt install nsis
```

## Add dependencies to pynsist

You have to add the dependencies to the `installer.cfg` file in order to be included in the executable. You can do this by adding the dependencies to the `pypi_wheels` section. You can use the output of `pip freeze` and then run:

```bash
pynsist installer.cfg
```

This command will create a `build` folder with the executable. If any dependencies are not found in the `PyPI` repository, you will get an error like:

```
nsist.wheels.NoWheelError: No compatible wheels found for validators 0.20.0
```

To avoid this, you can download the wheels manually and put them in the `wheels` folder.

```bash
pip wheel --wheel-dir wheels/ validators==0.20.0
```

# References

- Demo based on [takluyver/pynsist](https://github.com/takluyver/pynsist/tree/master/examples/streamlit)
- [Pynsist](https://pynsist.readthedocs.io/en/latest/)
