#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_SPACEHINTS.ahk" { JET_SPACEHINTS }
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_INDEXCREATE2_W.ahk" { JET_INDEXCREATE2_W }
#Import ".\JET_COLUMNCREATE_W.ahk" { JET_COLUMNCREATE_W }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_TABLECREATE3_W {
    #StructPack 8

    cbStruct : UInt32

    szTableName : IntPtr

    szTemplateTableName : IntPtr

    ulPages : UInt32

    ulDensity : UInt32

    rgcolumncreate : JET_COLUMNCREATE_W.Ptr

    cColumns : UInt32

    rgindexcreate : JET_INDEXCREATE2_W.Ptr

    cIndexes : UInt32

    szCallback : IntPtr

    cbtyp : UInt32

    grbit : UInt32

    pSeqSpacehints : JET_SPACEHINTS.Ptr

    pLVSpacehints : JET_SPACEHINTS.Ptr

    cbSeparateLV : UInt32

    tableid : JET_TABLEID

    cCreated : UInt32

}
