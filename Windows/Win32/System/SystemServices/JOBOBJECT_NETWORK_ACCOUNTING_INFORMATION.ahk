#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct JOBOBJECT_NETWORK_ACCOUNTING_INFORMATION {
    #StructPack 8

    DataBytesIn : Int64

    DataBytesOut : Int64

}
