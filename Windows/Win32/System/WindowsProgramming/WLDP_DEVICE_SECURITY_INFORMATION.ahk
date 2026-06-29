#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_DEVICE_SECURITY_INFORMATION {
    #StructPack 8

    UnlockIdSize : UInt32

    UnlockId : IntPtr

    ManufacturerIDLength : UInt32

    ManufacturerID : PWSTR

}
