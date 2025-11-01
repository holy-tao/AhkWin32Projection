#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to the current object's context. An object's context is primarily used when working with transactions or dealing with the security of an object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-objectcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ObjectContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ObjectContext
     * @type {Guid}
     */
    static IID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The class identifier for ObjectContext
     * @type {Guid}
     */
    static CLSID => Guid("{74c08646-cedb-11cf-8b49-00aa00b8a790}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "SetComplete", "SetAbort", "EnableCommit", "DisableCommit", "IsInTransaction", "IsSecurityEnabled", "IsCallerInRole", "get_Count", "get_Item", "get__NewEnum", "get_Security", "get_ContextInfo"]

    /**
     * 
     * @param {BSTR} bstrProgID 
     * @param {Pointer<VARIANT>} pObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-createinstance
     */
    CreateInstance(bstrProgID, pObject) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(7, this, "ptr", bstrProgID, "ptr", pObject, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-setcomplete
     */
    SetComplete() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-setabort
     */
    SetAbort() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-enablecommit
     */
    EnableCommit() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-disablecommit
     */
    DisableCommit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsInTx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-isintransaction
     */
    IsInTransaction(pbIsInTx) {
        result := ComCall(12, this, "ptr", pbIsInTx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-issecurityenabled
     */
    IsSecurityEnabled(pbIsEnabled) {
        result := ComCall(13, this, "ptr", pbIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @param {Pointer<VARIANT_BOOL>} pbInRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole, pbInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(14, this, "ptr", bstrRole, "ptr", pbInRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_count
     */
    get_Count(plCount) {
        result := ComCall(15, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_item
     */
    get_Item(name, pItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(16, this, "ptr", name, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(17, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SecurityProperty>} ppSecurityProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_security
     */
    get_Security(ppSecurityProperty) {
        result := ComCall(18, this, "ptr*", ppSecurityProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ContextInfo>} ppContextInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_contextinfo
     */
    get_ContextInfo(ppContextInfo) {
        result := ComCall(19, this, "ptr*", ppContextInfo, "HRESULT")
        return result
    }
}
