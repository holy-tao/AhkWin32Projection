#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_ERROR_INFOW.ahk" { _ERROR_INFOW }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct STI_DIAG {
    #StructPack 4

    dwSize : UInt32

    dwBasicDiagCode : UInt32

    dwVendorDiagCode : UInt32

    dwStatusMask : UInt32

    sErrorInfo : _ERROR_INFOW

}
