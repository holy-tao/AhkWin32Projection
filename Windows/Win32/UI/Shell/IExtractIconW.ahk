#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that allow a client to retrieve the icon that is associated with one of the objects in a folder.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/nn-shlobj_core-iextracticonw
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
     * 
     * @param {Integer} uFlags 
     * @param {PWSTR} pszIconFile 
     * @param {Integer} cchMax 
     * @param {Pointer<Integer>} piIndex 
     * @param {Pointer<Integer>} pwFlags 
     * @returns {HRESULT} 
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
     * 
     * @param {PWSTR} pszFile 
     * @param {Integer} nIconIndex 
     * @param {Pointer<HICON>} phiconLarge 
     * @param {Pointer<HICON>} phiconSmall 
     * @param {Integer} nIconSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-iextracticonw-extract
     */
    Extract(pszFile, nIconIndex, phiconLarge, phiconSmall, nIconSize) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(4, this, "ptr", pszFile, "uint", nIconIndex, "ptr", phiconLarge, "ptr", phiconSmall, "uint", nIconSize, "HRESULT")
        return result
    }
}
