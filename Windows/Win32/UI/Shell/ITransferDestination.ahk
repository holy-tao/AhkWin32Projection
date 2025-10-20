#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that create a destination Shell item for a copy or move operation. This interface is provided to allow more control over file operations by providing an ITransferDestination::Advise method.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-itransferdestination
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ITransferDestination extends IUnknown{
    /**
     * The interface identifier for ITransferDestination
     * @type {Guid}
     */
    static IID => Guid("{48addd32-3ca5-4124-abe3-b5a72531b207}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITransferAdviseSink>} psink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(psink, pdwCookie) {
        result := ComCall(3, this, "ptr", psink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} dwAttributes 
     * @param {Integer} ullSize 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riidItem 
     * @param {Pointer<Void>} ppvItem 
     * @param {Pointer<Guid>} riidResources 
     * @param {Pointer<Void>} ppvResources 
     * @returns {HRESULT} 
     */
    CreateItem(pszName, dwAttributes, ullSize, flags, riidItem, ppvItem, riidResources, ppvResources) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "uint", dwAttributes, "uint", ullSize, "uint", flags, "ptr", riidItem, "ptr", ppvItem, "ptr", riidResources, "ptr", ppvResources, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
