#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct SHChangeDWORDAsIDList {
    #StructPack 4

    /**
     * Type: <b>USHORT</b>
     * 
     * The size of the structure, in bytes.
     */
    cb : UInt16

    /**
     * Type: <b>DWORD</b>
     * 
     * First <b>DWORD</b> value.
     */
    dwItem1 : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Second <b>DWORD</b> value.
     */
    dwItem2 : UInt32

    /**
     * Type: <b>USHORT</b>
     */
    cbZero : UInt16

}
