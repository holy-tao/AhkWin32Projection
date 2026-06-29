#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_COLUMNBASE_A {
    #StructPack 4

    cbStruct : UInt32

    columnid : UInt32

    coltyp : UInt32

    wCountry : UInt16

    langid : UInt16

    cp : UInt16

    wFiller : UInt16

    cbMax : UInt32

    grbit : UInt32

    szBaseTableName : Int8[256]

    szBaseColumnName : Int8[256]

}
