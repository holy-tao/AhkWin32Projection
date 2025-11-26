#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include .\SecurityProperty.ahk
#Include .\ContextInfo.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {SecurityProperty} 
     */
    Security {
        get => this.get_Security()
    }

    /**
     * @type {ContextInfo} 
     */
    ContextInfo {
        get => this.get_ContextInfo()
    }

    /**
     * 
     * @param {BSTR} bstrProgID 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-createinstance
     */
    CreateInstance(bstrProgID) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        pObject := VARIANT()
        result := ComCall(7, this, "ptr", bstrProgID, "ptr", pObject, "HRESULT")
        return pObject
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-isintransaction
     */
    IsInTransaction() {
        result := ComCall(12, this, "short*", &pbIsInTx := 0, "HRESULT")
        return pbIsInTx
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(13, this, "short*", &pbIsEnabled := 0, "HRESULT")
        return pbIsEnabled
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(14, this, "ptr", bstrRole, "short*", &pbInRole := 0, "HRESULT")
        return pbInRole
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_count
     */
    get_Count() {
        result := ComCall(15, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_item
     */
    get_Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pItem := VARIANT()
        result := ComCall(16, this, "ptr", name, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(17, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * 
     * @returns {SecurityProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_security
     */
    get_Security() {
        result := ComCall(18, this, "ptr*", &ppSecurityProperty := 0, "HRESULT")
        return SecurityProperty(ppSecurityProperty)
    }

    /**
     * 
     * @returns {ContextInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-objectcontext-get_contextinfo
     */
    get_ContextInfo() {
        result := ComCall(19, this, "ptr*", &ppContextInfo := 0, "HRESULT")
        return ContextInfo(ppContextInfo)
    }
}
