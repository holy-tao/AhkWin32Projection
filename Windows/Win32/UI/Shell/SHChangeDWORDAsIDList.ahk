#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * SHChangeDWORDAsIDList may be altered or unavailable.
 * @remarks
 * This example demonstrates the use of <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/ns-shlobj_core-shchangeupdateimageidlist">SHChangeUpdateImageIDList</a> and <b>SHChangeDWORDAsIDList</b> by <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shchangenotify">SHChangeNotify</a> to mimic the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-shupdateimagea">SHUpdateImage</a> function.
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
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangedwordasidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHChangeDWORDAsIDList extends Win32Struct
{
    static sizeof => 16

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
     * Type: <b>DWORD</b>
     * 
     * First <b>DWORD</b> value.
     * @type {Integer}
     */
    dwItem1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Second <b>DWORD</b> value.
     * @type {Integer}
     */
    dwItem2 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>USHORT</b>
     * @type {Integer}
     */
    cbZero {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }
}
