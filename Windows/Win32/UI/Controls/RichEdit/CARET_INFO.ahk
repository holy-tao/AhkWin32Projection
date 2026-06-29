#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARET_FLAGS.ahk" { CARET_FLAGS }
#Import "..\..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct CARET_INFO {
    #StructPack 8

    hbitmap : HBITMAP

    static __New() {
        DefineProp(this.Prototype, 'caretFlags', { type: CARET_FLAGS, offset: 0 })
        this.DeleteProp("__New")
    }
}
