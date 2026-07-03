#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SYSTEM_FIRMWARE_TABLE_HANDLER {
    #StructPack 8

    ProviderSignature : UInt32

    Register : BOOLEAN

    FirmwareTableHandler : IntPtr

    DriverObject : IntPtr

}
