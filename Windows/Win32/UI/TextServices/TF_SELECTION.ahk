#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TF_SELECTIONSTYLE.ahk" { TF_SELECTIONSTYLE }
#Import ".\TfActiveSelEnd.ahk" { TfActiveSelEnd }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The TF_SELECTION structure contains text selection data.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_selection
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_SELECTION {
    #StructPack 8

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the selected text.
     */
    range : ITfRange

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_selectionstyle">TF_SELECTIONSTYLE</a> structure that contains selection data.
     */
    style : TF_SELECTIONSTYLE

}
