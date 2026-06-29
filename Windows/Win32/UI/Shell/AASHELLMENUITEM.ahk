#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\AASHELLMENUFILENAME.ahk" { AASHELLMENUFILENAME }

/**
 * Contains information about a menu item. (AASHELLMENUITEM)
 * @remarks
 * <div class="alert"><b>Important</b>  This structure cannot be used with operating systems later than Windows 2000.</div>
 * <div> </div>
 * If the menu belongs to the Windows Explorer process and the menu item is MFT_OWNERDRAW and <b>dwItemData</b> is not <b>NULL</b>, then the <b>dwItemData</b> member can be probed to determine whether it is a Windows Explorer menu that shows owner-drawn file names.
 * 
 * The accessibility tool might treat the <b>dwItemData</b> member as a pointer to an <b>AASHELLMENUITEM</b> structure in the process that owns the menu. In this case the <b>lpName</b> and <b>psz</b> members might be examined to determine the identity of the menu item. If <b>lpName</b> is not <b>NULL</b>, then the menu item represents a file name, expressed as an <a href="https://docs.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenufilename">AASHELLMENUFILENAME</a> structure. If <b>lpName</b> is <b>NULL</b> but <b>psz</b> is not <b>NULL</b>, then the menu item represents a string that is pointed to by the <b>psz</b> member.
 * 
 * The <b>lpName</b> and <b>psz</b> members contain pointers into the process that owns the menu.
 * 
 * <div class="alert"><b>Note</b>  Not all owner-draw menus in the Windows Explorer process conform to this convention.</div>
 * <div> </div>
 * Applications that probe owner-draw menu data must validate all data read from the process.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenuitem
 * @namespace Windows.Win32.UI.Shell
 */
export default struct AASHELLMENUITEM {
    #StructPack 8

    /**
     * Type: <b>VOID</b>
     * 
     * Reserved. Applications should ignore this value.
     */
    lpReserved1 : IntPtr

    /**
     * Type: <b>int</b>
     * 
     * Reserved. Applications should ignore this value.
     */
    iReserved : Int32

    /**
     * Type: <b>UINT</b>
     * 
     * Reserved. Applications should ignore this value.
     */
    uiReserved : UInt32

    /**
     * Type: <b>LPAASHELLMENUFILENAME</b>
     * 
     * If the selected menu item represents a file, this member is a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenufilename">AASHELLMENUFILENAME</a> structure that contains the name of the file. Otherwise this member is <b>NULL</b>.
     */
    lpName : AASHELLMENUFILENAME.Ptr

    /**
     * Type: <b>LPTSTR</b>
     * 
     * A pointer to the string that contains the text to use if there is no file.
     */
    psz : PWSTR

}
