#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDynamicKeyProviderConcept extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKey", "SetKey", "EnumerateKeys"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} keyValue 
     * @param {Pointer<IKeyStore>} metadata 
     * @param {Pointer<Boolean>} hasKey 
     * @returns {HRESULT} 
     */
    GetKey(contextObject, key, keyValue, metadata, hasKey) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", contextObject, "ptr", key, "ptr*", keyValue, "ptr*", metadata, "int*", hasKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} key 
     * @param {IModelObject} keyValue 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(contextObject, key, keyValue, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", contextObject, "ptr", key, "ptr", keyValue, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {Pointer<IKeyEnumerator>} ppEnumerator 
     * @returns {HRESULT} 
     */
    EnumerateKeys(contextObject, ppEnumerator) {
        result := ComCall(5, this, "ptr", contextObject, "ptr*", ppEnumerator, "HRESULT")
        return result
    }
}
