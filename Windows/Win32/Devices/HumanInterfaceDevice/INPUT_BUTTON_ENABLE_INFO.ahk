#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GPIOBUTTONS_BUTTON_TYPE.ahk" { GPIOBUTTONS_BUTTON_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct INPUT_BUTTON_ENABLE_INFO {
    #StructPack 4

    ButtonType : GPIOBUTTONS_BUTTON_TYPE

    Enabled : BOOLEAN

}
