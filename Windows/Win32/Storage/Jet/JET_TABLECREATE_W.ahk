#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_INDEXCREATE_W.ahk" { JET_INDEXCREATE_W }
#Import ".\JET_COLUMNCREATE_W.ahk" { JET_COLUMNCREATE_W }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_TABLECREATE_W {
    #StructPack 8

    cbStruct : UInt32

    szTableName : IntPtr

    szTemplateTableName : IntPtr

    ulPages : UInt32

    ulDensity : UInt32

    rgcolumncreate : JET_COLUMNCREATE_W.Ptr

    cColumns : UInt32

    rgindexcreate : JET_INDEXCREATE_W.Ptr

    cIndexes : UInt32

    grbit : UInt32

    tableid : JET_TABLEID

    cCreated : UInt32

}
