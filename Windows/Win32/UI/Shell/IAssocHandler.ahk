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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetUIName", "GetIconLocation", "IsRecommended", "MakeDefault", "Invoke", "CreateInvoker"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-getname
     */
    GetName(ppsz) {
        result := ComCall(3, this, "ptr", ppsz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-getuiname
     */
    GetUIName(ppsz) {
        result := ComCall(4, this, "ptr", ppsz, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPath 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-geticonlocation
     */
    GetIconLocation(ppszPath, pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", ppszPath, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-isrecommended
     */
    IsRecommended() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-makedefault
     */
    MakeDefault(pszDescription) {
        pszDescription := pszDescription is String ? StrPtr(pszDescription) : pszDescription

        result := ComCall(7, this, "ptr", pszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pdo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-invoke
     */
    Invoke(pdo) {
        result := ComCall(8, this, "ptr", pdo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} pdo 
     * @param {Pointer<IAssocHandlerInvoker>} ppInvoker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iassochandler-createinvoker
     */
    CreateInvoker(pdo, ppInvoker) {
        result := ComCall(9, this, "ptr", pdo, "ptr*", ppInvoker, "HRESULT")
        return result
    }
}
