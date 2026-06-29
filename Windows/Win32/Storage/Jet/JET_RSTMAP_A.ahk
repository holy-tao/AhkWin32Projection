#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_RSTMAP_A {
    #StructPack 8

    szDatabaseName : IntPtr

    szNewDatabaseName : IntPtr

}
