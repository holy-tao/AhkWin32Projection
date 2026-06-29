#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Com\DVASPECT.ahk" { DVASPECT }

/**
 * Contains information identifying whether the display aspect of a pasted object should be based on the content of the object or the icon that represent the object.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-repastespecial
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct REPASTESPECIAL {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwAspect : DVASPECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD_PTR</a></b>
     * 
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Aspect data. If <b>dwAspect</b> is DVASPECT_ICON, this member contains the handle to the metafile with the icon view of the object.
     */
    dwParam : IntPtr

}
