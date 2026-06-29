#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JET_SPACEHINTS.ahk" { JET_SPACEHINTS }
#Import ".\JET_CONDITIONALCOLUMN_W.ahk" { JET_CONDITIONALCOLUMN_W }
#Import ".\JET_TUPLELIMITS.ahk" { JET_TUPLELIMITS }
#Import ".\JET_UNICODEINDEX2.ahk" { JET_UNICODEINDEX2 }

/**
 * @namespace Windows.Win32.Storage.Jet
 * @charset Unicode
 */
export default struct JET_INDEXCREATE3_W {
    #StructPack 8

    cbStruct : UInt32

    szIndexName : IntPtr

    szKey : IntPtr

    cbKey : UInt32

    grbit : UInt32

    ulDensity : UInt32

    pidxunicode : JET_UNICODEINDEX2.Ptr

    cbVarSegMac : UInt32

    rgconditionalcolumn : JET_CONDITIONALCOLUMN_W.Ptr

    cConditionalColumn : UInt32

    err : Int32

    cbKeyMost : UInt32

    pSpacehints : JET_SPACEHINTS.Ptr

    static __New() {
        DefineProp(this.Prototype, 'ptuplelimits', { type: JET_TUPLELIMITS.Ptr, offset: 48 })
        this.DeleteProp("__New")
    }
}
