#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TF_DA_COLORTYPE.ahk" { TF_DA_COLORTYPE }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * The TF_DA_COLOR structure contains color data used in the display attributes for a range of text.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_da_color
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_DA_COLOR {
    #StructPack 4

    /**
     * Specifies the color type as defined in the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_colortype">TF_DA_COLORTYPE</a> enumeration.
     */
    type : TF_DA_COLORTYPE

    nIndex : Int32

    static __New() {
        DefineProp(this.Prototype, 'cr', { type: COLORREF, offset: 4 })
        this.DeleteProp("__New")
    }
}
