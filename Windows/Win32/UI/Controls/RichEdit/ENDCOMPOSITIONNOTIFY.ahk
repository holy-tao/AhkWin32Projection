#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\ENDCOMPOSITIONNOTIFY_CODE.ahk" { ENDCOMPOSITIONNOTIFY_CODE }

/**
 * Contains information about an EN_ENDCOMPOSITION notification code from a rich edit control.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-endcompositionnotify
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENDCOMPOSITIONNOTIFY {
    #StructPack 8

    /**
     * The <b>code</b> member of this structure identifies the notification code being sent.
     */
    nmhdr : NMHDR

    dwCode : ENDCOMPOSITIONNOTIFY_CODE

}
