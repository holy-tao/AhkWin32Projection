#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\HACCEL.ahk" { HACCEL }

/**
 * Accelerator table structure. Used by IPreviewHandlerFrame::GetWindowContext.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-previewhandlerframeinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct PREVIEWHANDLERFRAMEINFO {
    #StructPack 8

    /**
     * Type: <b>HACCEL</b>
     * 
     * A handle to the accelerator table.
     */
    haccel : HACCEL

    /**
     * Type: <b>UINT</b>
     * 
     * The number of entries in the accelerator table.
     */
    cAccelEntries : UInt32

}
