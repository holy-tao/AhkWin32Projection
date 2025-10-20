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
     * 
     * @param {BSTR} bstrProgID 
     * @param {Pointer<VARIANT>} pObject 
     * @returns {HRESULT} 
     */
    CreateInstance(bstrProgID, pObject) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(7, this, "ptr", bstrProgID, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetComplete() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetAbort() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableCommit() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableCommit() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsInTx 
     * @returns {HRESULT} 
     */
    IsInTransaction(pbIsInTx) {
        result := ComCall(12, this, "ptr", pbIsInTx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbIsEnabled 
     * @returns {HRESULT} 
     */
    IsSecurityEnabled(pbIsEnabled) {
        result := ComCall(13, this, "ptr", pbIsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @param {Pointer<VARIANT_BOOL>} pbInRole 
     * @returns {HRESULT} 
     */
    IsCallerInRole(bstrRole, pbInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(14, this, "ptr", bstrRole, "ptr", pbInRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_Count(plCount) {
        result := ComCall(15, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    get_Item(name, pItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(16, this, "ptr", name, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnum) {
        result := ComCall(17, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SecurityProperty>} ppSecurityProperty 
     * @returns {HRESULT} 
     */
    get_Security(ppSecurityProperty) {
        result := ComCall(18, this, "ptr", ppSecurityProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ContextInfo>} ppContextInfo 
     * @returns {HRESULT} 
     */
    get_ContextInfo(ppContextInfo) {
        result := ComCall(19, this, "ptr", ppContextInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
