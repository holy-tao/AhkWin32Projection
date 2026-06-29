#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMECOMPTEXT_FLAGS.ahk" { IMECOMPTEXT_FLAGS }

/**
 * Contains information about the Input Method Editor (IME) composition text in a Microsoft Rich Edit control.
 * @remarks
 * This structure is used with the <a href="https://msdn.microsoft.com/1516305c-5f87-4ae0-97db-8709c71abacc">EM_GETIMECOMPTEXT</a> message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-imecomptext
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct IMECOMPTEXT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Size of the output buffer, in bytes.
     */
    cb : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    flags : IMECOMPTEXT_FLAGS

}
