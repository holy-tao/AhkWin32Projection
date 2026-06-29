#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct XSAVE_CET_U_FORMAT {
    #StructPack 8

    Ia32CetUMsr : Int64

    Ia32Pl3SspMsr : Int64

}
