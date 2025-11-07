#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SHChangeUpdateImageIDList may be altered or unavailable.
 * @remarks
 * 
 * This example demonstrates the use of <b>SHChangeUpdateImageIDList</b> and <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shchangedwordasidlist">SHChangeDWORDAsIDList</a> by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shchangenotify">SHChangeNotify</a> to mimic the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shupdateimagea">SHUpdateImage</a> function.
 * 
 *                 
 * 
 * 
 * ```
 * void MyUpdateImage(LPCWSTR pszHashItem, int iIndex, UINT uFlags, int iImageIndex)
 * {
 *     SHChangeUpdateImageIDList rgPidl;
 *     SHChangeDWORDAsIDList rgDWord;
 *     int cchLen;
 *     USHORT *pcb;
 * 
 *     // Validate parameters: iImageIndex must be a valid system image list value.
 *     if (iImageIndex < 0)
 *     {
 *         return;
 *     }
 * 
 *     // Validate parameters: pszHashItem must not exceed MAX_PATH in length
 *     cchLen = lstrlenW(pszHashItem);
 *     if (cchLen >= MAX_PATH)
 *     {
 *         return;
 *     }
 * 
 *     // Load SHChangeUpdateImageIDList
 *     rgPidl.dwProcessID = GetCurrentProcessId();
 *     rgPidl.iIconIndex = iIndex;
 *     rgPidl.iCurIndex = iImageIndex;
 *     rgPidl.uFlags = uFlags;
 *     lstrcpynW(rgPidl.szName, pszHashItem, MAX_PATH);
 *     pcb = &rgPidl.szName[cchLen+1];
 *     
 *     // Set the size of the first element
 *     rgPidl.cb = (USHORT)((BYTE*)pcb - (BYTE*)rgPidl); 
 *     
 *     // Terminate the "ITEMIDLIST"
 *     *pcb = 0; 
 * 
 *     // Load SHChangeDWORDAsIDList
 *     rgDWord.cb = (USHORT)FIELD_OFFSET(SHChangeDWORDAsIDList, cbZero);
 *     rgDWord.dwItem1 = iImageIndex;
 *     rgDWord.dwItem2 = 0;
 *     rgDWord.cbZero = 0;
 * 
 *     // Parameters are now in the form that SHCNE_UPDATEIMAGE can accept
 *     SHChangeNotify(SHCNE_UPDATEIMAGE, SHCNF_IDLIST, &rgDWord, &rgPidl);
 * }
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shchangeupdateimageidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHChangeUpdateImageIDList extends Win32Struct
{
    static sizeof => 544

    static packingSize => 4

    /**
     * Type: <b>USHORT</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of the icon in the file specified by <b>szName</b>. Obtain this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a> and retrieving the value pointed to by <i>piIndex</i>.
     * @type {Integer}
     */
    iIconIndex {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index in the system image list of the icon being updated.
     * @type {Integer}
     */
    iCurIndex {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Flags that determine the icon attributes. Obtain this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a> and retrieving the value pointed to by <i>pwFlags</i>. These two flags are relevant to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shupdateimagea">SHUpdateImage</a>.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    dwProcessID {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string that specifies the fully qualified path of the file that contains the icon. Obtain this value by calling <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a> and retrieving the value pointed to by <i>szIconFile</i>.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 20, 259, "UTF-16")
        set => StrPut(value, this.ptr + 20, 259, "UTF-16")
    }

    /**
     * Type: <b>USHORT</b>
     * @type {Integer}
     */
    cbZero {
        get => NumGet(this, 540, "ushort")
        set => NumPut("ushort", value, this, 540)
    }
}
