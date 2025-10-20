#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicKeyProviderConcept extends IUnknown{
    /**
     * The interface identifier for IDynamicKeyProviderConcept
     * @type {Guid}
     */
    static IID => Guid("{e7983fa1-80a7-498c-988f-518ddc5d4025}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} keyValue 
     * @param {Pointer<IKeyStore>} metadata 
     * @param {Pointer<Boolean>} hasKey 
     * @returns {HRESULT} 
     */
    GetKey(contextObject, key, keyValue, metadata, hasKey) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", contextObject, "ptr", key, "ptr", keyValue, "ptr", metadata, "int*", hasKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} keyValue 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    SetKey(contextObject, key, keyValue, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", contextObject, "ptr", key, "ptr", keyValue, "ptr", metadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IKeyEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateKeys(contextObject, ppEnumerator) {
        result := ComCall(5, this, "ptr", contextObject, "ptr", ppEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
