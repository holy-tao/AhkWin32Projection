#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains data about an item in the Active Directory container browser dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The dsclient.h header defines DSBITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsbitema
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset ANSI
 */
export default struct DSBITEMA {
    #StructPack 8

    /**
     * Contains the size, in bytes, of the structure.
     */
    cbStruct : UInt32

    /**
     * Pointer to a  null-terminated Unicode string that contains the ADsPath of the item.
     */
    pszADsPath : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the object class name of the item.
     */
    pszClass : PWSTR

    dwMask : UInt32

    dwState : UInt32

    dwStateMask : UInt32

    /**
     * Pointer to a null-terminated string that contains the display name of the item. The display name of an item can be changed by copying the new display name into this member, setting the <b>DSBF_DISPLAYNAME</b> flag in the <b>dwMask</b> member, and returning a nonzero value from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
     */
    szDisplayName : CHAR[64]

    /**
     * Pointer to a null-terminated string that contains the name of an .exe, .dll, or .ico file that contains the icon to display for the item. This can be any file type that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-extracticona">ExtractIcon</a> function. The index for this icon is specified in <b>iIconResID</b>. To modify the icon displayed for the item, copy the icon source file name into this member, set  <b>iIconResID</b> to the zero-based index of the icon, set the <b>DSBF_ICONLOCATION</b> flag in  the <b>dwMask</b> member, and return a nonzero value from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
     */
    szIconLocation : CHAR[260]

    /**
     * Contains the zero-based index of the icon to display for the item.
     * 
     * <div class="alert"><b>Note</b>  This is not the resource identifier of the icon.</div>
     * <div> </div>
     */
    iIconResID : Int32

}
