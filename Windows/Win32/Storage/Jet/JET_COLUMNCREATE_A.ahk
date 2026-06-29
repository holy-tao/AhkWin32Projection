#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_COLUMNCREATE_A {
    #StructPack 8

    cbStruct : UInt32

    szColumnName : IntPtr

    coltyp : UInt32

    cbMax : UInt32

    grbit : UInt32

    pvDefault : IntPtr

    cbDefault : UInt32

    cp : UInt32

    columnid : UInt32

    err : Int32

}
