#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_CONDITIONALCOLUMN_A {
    #StructPack 8

    cbStruct : UInt32

    szColumnName : IntPtr

    grbit : UInt32

}
