#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_UNICODEINDEX.ahk" { JET_UNICODEINDEX }
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_COLUMNDEF.ahk" { JET_COLUMNDEF }

/**
 * Learn more about: JET_OPENTEMPORARYTABLE Structure
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-opentemporarytable-structure
 * @namespace Windows.Win32.Storage.Jet
 */
export default struct JET_OPENTEMPORARYTABLE {
    #StructPack 8

    cbStruct : UInt32

    prgcolumndef : JET_COLUMNDEF.Ptr

    ccolumn : UInt32

    pidxunicode : JET_UNICODEINDEX.Ptr

    grbit : UInt32

    prgcolumnid : IntPtr

    cbKeyMost : UInt32

    cbVarSegMac : UInt32

    tableid : JET_TABLEID

}
