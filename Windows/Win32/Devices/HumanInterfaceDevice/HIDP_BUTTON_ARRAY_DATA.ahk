#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_BUTTON_ARRAY_DATA {
    #StructPack 2

    ArrayIndex : UInt16

    On : BOOLEAN

}
