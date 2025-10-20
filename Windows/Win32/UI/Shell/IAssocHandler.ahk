#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for operations with a file association dialog box or menu.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iassochandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAssocHandler extends IUnknown{
    /**
     * The interface identifier for IAssocHandler
     * @type {Guid}
     */
    static IID => Guid("{f04061ac-1659-4a3f-a954-775aa57fc083}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     */
    GetName(ppsz) {
        result := ComCall(3, this, "ptr", ppsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     */
    GetUIName(ppsz) {
        result := ComCall(4, this, "ptr", ppsz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @param {Pointer<Int32>} pIndex 
     * @returns {HRESULT} 
     */
    GetIconLocation(ppszPath, pIndex) {
        result := ComCall(5, this, "ptr", ppszPath, "int*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsRecommended() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszDescription 
     * @returns {HRESULT} 
     */
    MakeDefault(pszDescription) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(7, this, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pdo 
     * @returns {HRESULT} 
     */
    Invoke(pdo) {
        result := ComCall(8, this, "ptr", pdo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} pdo 
     * @param {Pointer<IAssocHandlerInvoker>} ppInvoker 
     * @returns {HRESULT} 
     */
    CreateInvoker(pdo, ppInvoker) {
        result := ComCall(9, this, "ptr", pdo, "ptr", ppInvoker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
