#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_COLUMNDEF.ahk" { JET_COLUMNDEF }
#Import ".\JET_UNICODEINDEX2.ahk" { JET_UNICODEINDEX2 }

/**
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_OPENTEMPORARYTABLE2 {
    #StructPack 8

    cbStruct : UInt32

    prgcolumndef : JET_COLUMNDEF.Ptr

    ccolumn : UInt32

    pidxunicode : JET_UNICODEINDEX2.Ptr

    grbit : UInt32

    prgcolumnid : IntPtr

    cbKeyMost : UInt32

    cbVarSegMac : UInt32

    tableid : JET_TABLEID

}
