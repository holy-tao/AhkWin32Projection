#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_RSTMAP_W {
    #StructPack 8

    szDatabaseName : IntPtr

    szNewDatabaseName : IntPtr

}
