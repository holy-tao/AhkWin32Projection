#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_COMPOSITE_FUNCTION_INFO {
    #StructPack 1

    FunctionNumber : Int8

    BaseInterfaceNumber : Int8

    NumberOfInterfaces : Int8

    FunctionIsIdle : BOOLEAN

}
