#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IModelObject.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelPropertyAccessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IModelPropertyAccessor
     * @type {Guid}
     */
    static IID => Guid("{5a0c63d9-0526-42b8-960c-9516a3254c85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "SetValue"]

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @returns {IModelObject} 
     */
    GetValue(key, contextObject) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, "ptr", contextObject, "ptr*", &value := 0, "HRESULT")
        return IModelObject(value)
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {IModelObject} contextObject 
     * @param {IModelObject} value 
     * @returns {HRESULT} 
     */
    SetValue(key, contextObject, value) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", contextObject, "ptr", value, "HRESULT")
        return result
    }
}
