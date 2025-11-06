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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getattributes
     */
    GetAttributes() {
        result := ComCall(3, this, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getsize
     */
    GetSize() {
        result := ComCall(4, this, "uint*", &pullSize := 0, "HRESULT")
        return pullSize
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftCreation 
     * @param {Pointer<FILETIME>} pftWrite 
     * @param {Pointer<FILETIME>} pftAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-gettimes
     */
    GetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(5, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftCreation 
     * @param {Pointer<FILETIME>} pftWrite 
     * @param {Pointer<FILETIME>} pftAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-settimes
     */
    SetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(6, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getresourcedescription
     */
    GetResourceDescription(pcsir) {
        result := ComCall(7, this, "ptr", pcsir, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {IEnumResources} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-enumresources
     */
    EnumResources() {
        result := ComCall(8, this, "ptr*", &ppenumr := 0, "HRESULT")
        return IEnumResources(ppenumr)
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-supportsresource
     */
    SupportsResource(pcsir) {
        result := ComCall(9, this, "ptr", pcsir, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-openresource
     */
    OpenResource(pcsir, riid) {
        result := ComCall(10, this, "ptr", pcsir, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-createresource
     */
    CreateResource(pcsir, riid) {
        result := ComCall(11, this, "ptr", pcsir, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-markfordelete
     */
    MarkForDelete() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
