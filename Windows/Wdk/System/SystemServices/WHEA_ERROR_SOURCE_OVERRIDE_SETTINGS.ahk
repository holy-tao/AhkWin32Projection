#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ERROR_SOURCE_OVERRIDE_SETTINGS {
    #StructPack 4

    Type : WHEA_ERROR_SOURCE_TYPE

    MaxRawDataLength : UInt32

    NumRecordsToPreallocate : UInt32

    MaxSectionsPerRecord : UInt32

}
