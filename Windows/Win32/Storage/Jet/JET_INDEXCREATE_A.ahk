#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_UNICODEINDEX.ahk" { JET_UNICODEINDEX }
#Import ".\JET_TUPLELIMITS.ahk" { JET_TUPLELIMITS }
#Import ".\JET_CONDITIONALCOLUMN_A.ahk" { JET_CONDITIONALCOLUMN_A }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset ANSI
 */
export default struct JET_INDEXCREATE_A {
    #StructPack 8

    cbStruct : UInt32

    szIndexName : IntPtr

    szKey : IntPtr

    cbKey : UInt32

    grbit : UInt32

    ulDensity : UInt32

    lcid : UInt32

    cbVarSegMac : UInt32

    rgconditionalcolumn : JET_CONDITIONALCOLUMN_A.Ptr

    cConditionalColumn : UInt32

    err : Int32

    cbKeyMost : UInt32

    static __New() {
        DefineProp(this.Prototype, 'pidxunicode', { type: JET_UNICODEINDEX.Ptr, offset: 40 })
        DefineProp(this.Prototype, 'ptuplelimits', { type: JET_TUPLELIMITS.Ptr, offset: 48 })
        this.DeleteProp("__New")
    }
}
