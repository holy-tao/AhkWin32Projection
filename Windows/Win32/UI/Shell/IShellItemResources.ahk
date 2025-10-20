#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods to manipulate and query Shell item resources.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellitemresources
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellItemResources extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} pdwAttributes 
     * @returns {HRESULT} 
     */
    GetAttributes(pdwAttributes) {
        result := ComCall(3, this, "uint*", pdwAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pullSize 
     * @returns {HRESULT} 
     */
    GetSize(pullSize) {
        result := ComCall(4, this, "uint*", pullSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftCreation 
     * @param {Pointer<FILETIME>} pftWrite 
     * @param {Pointer<FILETIME>} pftAccess 
     * @returns {HRESULT} 
     */
    GetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(5, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftCreation 
     * @param {Pointer<FILETIME>} pftWrite 
     * @param {Pointer<FILETIME>} pftAccess 
     * @returns {HRESULT} 
     */
    SetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(6, this, "ptr", pftCreation, "ptr", pftWrite, "ptr", pftAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @param {Pointer<PWSTR>} ppszDescription 
     * @returns {HRESULT} 
     */
    GetResourceDescription(pcsir, ppszDescription) {
        result := ComCall(7, this, "ptr", pcsir, "ptr", ppszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumResources>} ppenumr 
     * @returns {HRESULT} 
     */
    EnumResources(ppenumr) {
        result := ComCall(8, this, "ptr", ppenumr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @returns {HRESULT} 
     */
    SupportsResource(pcsir) {
        result := ComCall(9, this, "ptr", pcsir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    OpenResource(pcsir, riid, ppv) {
        result := ComCall(10, this, "ptr", pcsir, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateResource(pcsir, riid, ppv) {
        result := ComCall(11, this, "ptr", pcsir, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkForDelete() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
