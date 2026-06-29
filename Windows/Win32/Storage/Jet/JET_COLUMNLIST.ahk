#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }

/**
 * Learn more about: JET_COLUMNLIST Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-columnlist-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_COLUMNLIST {
    #StructPack 8

    cbStruct : UInt32

    tableid : JET_TABLEID

    cRecord : UInt32

    columnidPresentationOrder : UInt32

    columnidcolumnname : UInt32

    columnidcolumnid : UInt32

    columnidcoltyp : UInt32

    columnidCountry : UInt32

    columnidLangid : UInt32

    columnidCp : UInt32

    columnidCollate : UInt32

    columnidcbMax : UInt32

    columnidgrbit : UInt32

    columnidDefault : UInt32

    columnidBaseTableName : UInt32

    columnidBaseColumnName : UInt32

    columnidDefinitionName : UInt32

}
