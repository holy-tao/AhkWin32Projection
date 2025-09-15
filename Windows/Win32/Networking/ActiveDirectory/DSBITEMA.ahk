#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data about an item in the Active Directory container browser dialog box. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The dsclient.h header defines DSBITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsbitema
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 * @charset ANSI
 */
class DSBITEMA extends Win32Struct
{
    static sizeof => 368

    static packingSize => 8

    /**
     * Contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a  null-terminated Unicode string that contains the ADsPath of the item.
     * @type {Pointer<PWSTR>}
     */
    pszADsPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the object class name of the item.
     * @type {Pointer<PWSTR>}
     */
    pszClass {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStateMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a null-terminated string that contains the display name of the item. The display name of an item can be changed by copying the new display name into this member, setting the <b>DSBF_DISPLAYNAME</b> flag in the <b>dwMask</b> member, and returning a nonzero value from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
     * @type {String}
     */
    szDisplayName {
        get => StrGet(this.ptr + 36, 63, "UTF-8")
        set => StrPut(value, this.ptr + 36, 63, "UTF-8")
    }

    /**
     * Pointer to a null-terminated string that contains the name of an .exe, .dll, or .ico file that contains the icon to display for the item. This can be any file type that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-extracticona">ExtractIcon</a> function. The index for this icon is specified in <b>iIconResID</b>. To modify the icon displayed for the item, copy the icon source file name into this member, set  <b>iIconResID</b> to the zero-based index of the icon, set the <b>DSBF_ICONLOCATION</b> flag in  the <b>dwMask</b> member, and return a nonzero value from <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nc-shlobj_core-bffcallback">BFFCallBack</a>.
     * @type {String}
     */
    szIconLocation {
        get => StrGet(this.ptr + 100, 259, "UTF-8")
        set => StrPut(value, this.ptr + 100, 259, "UTF-8")
    }

    /**
     * Contains the zero-based index of the icon to display for the item.
     * 
     * <div class="alert"><b>Note</b>  This is not the resource identifier of the icon.</div>
     * <div> </div>
     * @type {Integer}
     */
    iIconResID {
        get => NumGet(this, 360, "int")
        set => NumPut("int", value, this, 360)
    }
}
