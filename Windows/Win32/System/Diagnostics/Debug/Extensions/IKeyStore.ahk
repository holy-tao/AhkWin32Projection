#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IKeyStore extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyStore
     * @type {Guid}
     */
    static IID => Guid("{0fc7557d-401d-4fca-9365-da1e9850697c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetKey", "SetKey", "GetKeyValue", "SetKeyValue", "ClearKeys"]

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, "ptr*", _object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @param {IKeyStore} metadata 
     * @returns {HRESULT} 
     */
    SetKey(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", _object, "ptr", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} _object 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, _object, metadata) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(5, this, "ptr", key, "ptr*", _object, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} _object 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, _object) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(6, this, "ptr", key, "ptr", _object, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearKeys() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
