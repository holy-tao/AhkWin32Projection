#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct NETWORK_APP_INSTANCE_EA {
    #StructPack 4

    AppInstanceID : Guid

    CsvFlags : UInt32

}
