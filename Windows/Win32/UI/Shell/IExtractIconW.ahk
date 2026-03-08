#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a client to retrieve the icon that is associated with one of the objects in a folder. (Unicode)
 * @remarks
 * There are two ways to retrieve an object's icon. The simplest way is to call <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a>. However, this approach is inflexible and may be slow. A more flexible and efficient way to retrieve an item's icon is to use <b>IExtractIcon</b>. The Shell uses <b>IExtractIcon</b> to retrieve icons when it displays the contents of a folder. To use <b>IExtractIcon</b> to retrieve an object's icon, do the following:
 * 
 * 				
 * 
 * <ol>
 * <li>Get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface of the folder that contains the object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> with the pointer to an item identifier list (PIDL) of the object and the interface ID of <b>IExtractIcon</b> (IID_IExtractIcon). The folder creates an object to handle the icon extraction, and returns the object's <b>IExtractIcon</b> interface pointer.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a> to retrieve the icon's location.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-extract">IExtractIcon::Extract</a> to retrieve the icon's handle.</li>
 * </ol>
 * It may also be possible to extract icons asynchronously on a background thread. This approach is useful when extraction is a time-consuming operation. For details, see <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a>.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/shell/nse-works">Namespace extensions</a> implement <b>IExtractIcon</b> to provide icons for their objects. A client obtains an <b>IExtractIcon</b> interface pointer for an object in a folder by calling the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-getuiobjectof">IShellFolder::GetUIObjectOf</a> method. The <b>IShellFolder::GetUIObjectOf</b> implementation must create an object to handle the icon extraction and return a pointer to the object's <b>IExtractIcon</b> interface.
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/shell/how-to-create-icon-handlers">Icon handlers</a> also implement <b>IExtractIcon</b>. An icon handler is a type of Shell extension handler that allows you to dynamically assign icons to the members of a <a href="https://docs.microsoft.com/windows/desktop/shell/fa-file-types">file type</a>.
 * 
 * Call this interface if your application needs a more flexible way to retrieve an object's icon than <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-shgetfileinfoa">SHGetFileInfo</a>.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shlobj_core.h header defines IExtractIcon as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iextracticonw
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset Unicode
 */
class IExtractIconW extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExtractIconW
     * @type {Guid}
     */
    static IID => Guid("{000214fa-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIconLocation", "Extract"]

    /**
     * Gets the location and index of an icon. (Unicode)
     * @remarks
     * When a client sets the <b>GIL_ASYNC</b> flag in <i>uFlags</i> and receives E_PENDING as a return value, it typically creates a background thread to extract the icon. It calls <b>GetIconLocation</b> from that thread, without the <b>GIL_ASYNC</b> flag, to retrieve the icon location. It then calls <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-extract">IExtractIcon::Extract</a> to extract the icon. Returning E_PENDING implies that the object is free threaded. In other words, it can safely be called concurrently by multiple threads.
     * 
     * The <b>GIL_DEFAULTICON</b> flag is usually set in the case where the desired icon is found, but that icon is not present in the icon cache. Icon extraction is a low priority background process, and as such may be delayed by other processes. The default icon will be displayed in place of the final icon during the time that it takes for that final icon to be extracted, added to the cache, and made available.
     * @param {Integer} uFlags Type: <b>UINT</b>
     * @param {PWSTR} pszIconFile Type: <b>PTSTR</b>
     * 
     * A pointer to a buffer that receives the icon location. The icon location is a null-terminated string that identifies the file that contains the icon.
     * @param {Integer} cchMax Type: <b>UINT</b>
     * 
     * The size of the buffer, in characters, pointed to by <i>pszIconFile</i>.
     * @param {Pointer<Integer>} piIndex Type: <b>int*</b>
     * 
     * A pointer to an <b>int</b> that receives the index of the icon in the file pointed to by <i>pszIconFile</i>.
     * @param {Pointer<Integer>} pwFlags Type: <b>UINT*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the function returned a valid location, or S_FALSE if the Shell should use a default icon. If the <b>GIL_ASYNC</b> flag is set in <i>uFlags</i>, the method can return E_PENDING to indicate that icon extraction will be time-consuming.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iextracticonw-geticonlocation
     */
    GetIconLocation(uFlags, pszIconFile, cchMax, piIndex, pwFlags) {
        pszIconFile := pszIconFile is String ? StrPtr(pszIconFile) : pszIconFile

        piIndexMarshal := piIndex is VarRef ? "int*" : "ptr"
        pwFlagsMarshal := pwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", uFlags, "ptr", pszIconFile, "uint", cchMax, piIndexMarshal, piIndex, pwFlagsMarshal, pwFlags, "HRESULT")
        return result
    }

    /**
     * Extracts an icon image from the specified location. (Unicode)
     * @remarks
     * The icon location and index are the same values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-iextracticona-geticonlocation">IExtractIcon::GetIconLocation</a> method. If <b>IExtractIcon::Extract</b> function returns S_FALSE, these values must specify an icon file name and index that form legal parameters for a call to <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-extracticona">ExtractIcon</a>. If <b>IExtractIcon::Extract</b> does not return S_FALSE, no assumptions should be made about the meanings of the <i>pszFile</i> and <i>nIconIndex</i> parameters.
     * @param {PWSTR} pszFile Type: <b>PCTSTR</b>
     * 
     * A pointer to a null-terminated string that specifies the icon location.
     * @param {Integer} nIconIndex Type: <b>UINT</b>
     * 
     * The index of the icon in the file pointed to by <i>pszFile</i>.
     * @param {Pointer<HICON>} phiconLarge Type: <b>HICON*</b>
     * 
     * A pointer to an <b>HICON</b> value that receives the handle to the large icon. This parameter may be <b>NULL</b>.
     * @param {Pointer<HICON>} phiconSmall Type: <b>HICON*</b>
     * 
     * A pointer to an <b>HICON</b> value that receives the handle to the small icon. This parameter may be <b>NULL</b>.
     * @param {Integer} nIconSize Type: <b>UINT</b>
     * 
     * The desired size of the icon, in pixels. The low word contains the size of the large icon, and the high word contains the size of the small icon. The size specified can be the width or height. The width of an icon always equals its height.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the function extracted the icon, or S_FALSE if the calling application should extract the icon.
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iextracticonw-extract
     */
    Extract(pszFile, nIconIndex, phiconLarge, phiconSmall, nIconSize) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(4, this, "ptr", pszFile, "uint", nIconIndex, "ptr", phiconLarge, "ptr", phiconSmall, "uint", nIconSize, "HRESULT")
        return result
    }
}
