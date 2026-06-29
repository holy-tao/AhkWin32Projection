#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXTCHKBOX.ahk" { EXTCHKBOX }
#Import ".\OIEXT.ahk" { OIEXT }
#Import ".\OPTTYPE.ahk" { OPTTYPE }
#Import ".\EXTPUSH.ahk" { EXTPUSH }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OPTITEM {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Level : Int8

    DlgPageIdx : Int8

    Flags : UInt32

    UserData : IntPtr

    pName : IntPtr

    Sel : Int32

    pExtChkBox : EXTCHKBOX.Ptr

    pOptType : OPTTYPE.Ptr

    HelpIndex : UInt32

    DMPubID : Int8

    UserItemID : Int8

    wReserved : UInt16

    pOIExt : OIEXT.Ptr

    dwReserved : IntPtr[3]

    static __New() {
        DefineProp(this.Prototype, 'pSel', { type: IntPtr, offset: 24 })
        DefineProp(this.Prototype, 'pExtPush', { type: EXTPUSH.Ptr, offset: 32 })
        this.DeleteProp("__New")
    }
}
