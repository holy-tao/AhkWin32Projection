#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumResources.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to manipulate and query Shell item resources.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitemresources
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItemResources extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellItemResources
     * @type {Guid}
     */
    static IID => Guid("{ff5693be-2ce0-4d48-b5c5-40817d1acdb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributes", "GetSize", "GetTimes", "SetTimes", "GetResourceDescription", "EnumResources", "SupportsResource", "OpenResource", "CreateResource", "MarkForDelete"]

    /**
     * Gets resource attributes.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to resource attributes. The following are attribute values.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-getattributes
     */
    GetAttributes() {
        result := ComCall(3, this, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * Gets the source size.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * A pointer to the source size.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-getsize
     */
    GetSize() {
        result := ComCall(4, this, "uint*", &pullSize := 0, "HRESULT")
        return pullSize
    }

    /**
     * Gets file times.
     * @param {Pointer<FILETIME>} pftCreation Type: <b>FILETIME*</b>
     * 
     * A pointer to the creation date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftWrite Type: <b>FILETIME*</b>
     * 
     * A pointer to write date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftAccess Type: <b>FILETIME*</b>
     * 
     * A pointer to access date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-gettimes
     */
    GetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(5, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "HRESULT")
        return result
    }

    /**
     * Sets file times.
     * @param {Pointer<FILETIME>} pftCreation Type: <b>const FILETIME*</b>
     * 
     * A pointer to a creation date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftWrite Type: <b>const FILETIME*</b>
     * 
     * A pointer to a write date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftAccess Type: <b>const FILETIME*</b>
     * 
     * A pointer to an access date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-settimes
     */
    SetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(6, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "HRESULT")
        return result
    }

    /**
     * Gets a resource description.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a resource description as a Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-getresourcedescription
     */
    GetResourceDescription(pcsir) {
        result := ComCall(7, this, "ptr", pcsir, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Gets a resource enumerator object.
     * @returns {IEnumResources} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-enumresources
     */
    EnumResources() {
        result := ComCall(8, this, "ptr*", &ppenumr := 0, "HRESULT")
        return IEnumResources(ppenumr)
    }

    /**
     * Retrieves whether an item supports a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-supportsresource
     */
    SupportsResource(pcsir) {
        result := ComCall(9, this, "ptr", pcsir, "HRESULT")
        return result
    }

    /**
     * Opens a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to a resource.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-openresource
     */
    OpenResource(pcsir, riid) {
        result := ComCall(10, this, "ptr", pcsir, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the resource.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-createresource
     */
    CreateResource(pcsir, riid) {
        result := ComCall(11, this, "ptr", pcsir, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Marks for delete.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellitemresources-markfordelete
     */
    MarkForDelete() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
