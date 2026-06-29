#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Learn more about: JET_COLUMNDEF constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-columndef-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_COLUMNDEF {
    #StructPack 4

    cbStruct : UInt32

    columnid : UInt32

    coltyp : UInt32

    wCountry : UInt16

    langid : UInt16

    cp : UInt16

    wCollate : UInt16

    cbMax : UInt32

    grbit : UInt32

}
