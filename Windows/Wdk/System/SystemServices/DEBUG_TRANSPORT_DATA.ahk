#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEBUG_TRANSPORT_DATA {
    #StructPack 4

    HwContextSize : UInt32

    SharedVisibleDataSize : UInt32

    UseSerialFraming : BOOLEAN

    ValidUSBCoreId : BOOLEAN

    USBCoreId : Int8

}
