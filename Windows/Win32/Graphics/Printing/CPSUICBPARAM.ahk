#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\OPTITEM.ahk" { OPTITEM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct CPSUICBPARAM {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Reason : UInt16

    hDlg : HWND

    pOptItem : OPTITEM.Ptr

    cOptItem : UInt16

    Flags : UInt16

    pCurItem : OPTITEM.Ptr

    OldSel : Int32

    UserData : IntPtr

    Result : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pOldSel', { type: IntPtr, offset: 40 })
        this.DeleteProp("__New")
    }
}
