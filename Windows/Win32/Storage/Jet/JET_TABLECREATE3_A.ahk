#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_SPACEHINTS.ahk" { JET_SPACEHINTS }
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_INDEXCREATE2_A.ahk" { JET_INDEXCREATE2_A }
#Import ".\JET_COLUMNCREATE_A.ahk" { JET_COLUMNCREATE_A }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_TABLECREATE3_A {
    #StructPack 8

    cbStruct : UInt32

    szTableName : IntPtr

    szTemplateTableName : IntPtr

    ulPages : UInt32

    ulDensity : UInt32

    rgcolumncreate : JET_COLUMNCREATE_A.Ptr

    cColumns : UInt32

    rgindexcreate : JET_INDEXCREATE2_A.Ptr

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
