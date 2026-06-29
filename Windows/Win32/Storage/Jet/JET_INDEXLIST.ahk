#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }

/**
 * Learn more about: JET_INDEXLIST Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-indexlist-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_INDEXLIST {
    #StructPack 8

    cbStruct : UInt32

    tableid : JET_TABLEID

    cRecord : UInt32

    columnidindexname : UInt32

    columnidgrbitIndex : UInt32

    columnidcKey : UInt32

    columnidcEntry : UInt32

    columnidcPage : UInt32

    columnidcColumn : UInt32

    columnidiColumn : UInt32

    columnidcolumnid : UInt32

    columnidcoltyp : UInt32

    columnidCountry : UInt32

    columnidLangid : UInt32

    columnidCp : UInt32

    columnidCollate : UInt32

    columnidgrbitColumn : UInt32

    columnidcolumnname : UInt32

    columnidLCMapFlags : UInt32

}
