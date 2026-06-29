#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIDP_UNKNOWN_TOKEN.ahk" { HIDP_UNKNOWN_TOKEN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HIDP_EXTENDED_ATTRIBUTES {
    #StructPack 8

    NumGlobalUnknowns : Int8

    Reserved : Int8[3]

    GlobalUnknowns : HIDP_UNKNOWN_TOKEN.Ptr

    Data : UInt32[1]

}
