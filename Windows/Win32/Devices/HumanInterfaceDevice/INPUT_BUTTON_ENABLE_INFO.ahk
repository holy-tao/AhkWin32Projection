#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\GPIOBUTTONS_BUTTON_TYPE.ahk" { GPIOBUTTONS_BUTTON_TYPE }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct INPUT_BUTTON_ENABLE_INFO {
    #StructPack 4

    ButtonType : GPIOBUTTONS_BUTTON_TYPE

    Enabled : BOOLEAN

}
