#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains object position information.
 * @remarks
 * This is used in the <a href="https://msdn.microsoft.com/1965185f-8a13-4989-8574-af8b9b30f6b0">EN_OBJECTPOSITIONS</a> notification.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-objectpositions
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct OBJECTPOSITIONS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of this structure identifies the notification code being sent.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of object positions.
     */
    cObjectCount : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The object positions.
     */
    pcpPositions : IntPtr

}
