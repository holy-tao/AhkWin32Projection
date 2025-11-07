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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "Unadvise", "CreateItem"]

    /**
     * 
     * @param {ITransferAdviseSink} psink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-advise
     */
    Advise(psink) {
        result := ComCall(3, this, "ptr", psink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Integer} dwAttributes 
     * @param {Integer} ullSize 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riidItem 
     * @param {Pointer<Pointer<Void>>} ppvItem 
     * @param {Pointer<Guid>} riidResources 
     * @param {Pointer<Pointer<Void>>} ppvResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-itransferdestination-createitem
     */
    CreateItem(pszName, dwAttributes, ullSize, flags, riidItem, ppvItem, riidResources, ppvResources) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        ppvItemMarshal := ppvItem is VarRef ? "ptr*" : "ptr"
        ppvResourcesMarshal := ppvResources is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pszName, "uint", dwAttributes, "uint", ullSize, "uint", flags, "ptr", riidItem, ppvItemMarshal, ppvItem, "ptr", riidResources, ppvResourcesMarshal, ppvResources, "HRESULT")
        return result
    }
}
