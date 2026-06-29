#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_RELOP.ahk" { JET_RELOP }

/**
 * Learn more about: JET_INDEX_COLUMN constructor
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-index-column-constructor
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_INDEX_COLUMN {
    #StructPack 8

    columnid : UInt32

    relop : JET_RELOP

    pv : IntPtr

    cb : UInt32

    grbit : UInt32

}
