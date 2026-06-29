#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines the CF_HDROP clipboard format. The data that follows is a double null-terminated list of file names.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dropfiles
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DROPFILES {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset of the file list from the beginning of this structure, in bytes.
     */
    pFiles : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The drop point. The coordinates depend on <b>fNC</b>.
     */
    pt : POINT

    /**
     * Type: <b>BOOL</b>
     * 
     * A nonclient area flag. If this member is <b>TRUE</b>, <b>pt</b> specifies the screen coordinates of a point in a window's nonclient area. If it is <b>FALSE</b>, <b>pt</b> specifies the client coordinates of a point in the client area.
     */
    fNC : BOOL

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the file contains ANSI or Unicode characters. If the value is zero, the file contains ANSI characters. Otherwise, it contains Unicode characters.
     */
    fWide : BOOL

}
