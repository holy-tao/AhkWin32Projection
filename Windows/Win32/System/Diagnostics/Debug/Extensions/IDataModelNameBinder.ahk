#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IKeyEnumerator.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelNameBinder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataModelNameBinder
     * @type {Guid}
     */
    static IID => Guid("{af352b7b-8292-4c01-b360-2dc3696c65e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindValue", "BindReference", "EnumerateValues", "EnumerateReferences"]

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} value 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindValue(contextObject, name, value, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", contextObject, "ptr", name, "ptr*", value, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} reference 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindReference(contextObject, name, reference, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", contextObject, "ptr", name, "ptr*", reference, "ptr*", metadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateValues(contextObject) {
        result := ComCall(5, this, "ptr", contextObject, "ptr*", &enumerator := 0, "HRESULT")
        return IKeyEnumerator(enumerator)
    }

    /**
     * 
     * @param {IModelObject} contextObject 
     * @returns {IKeyEnumerator} 
     */
    EnumerateReferences(contextObject) {
        result := ComCall(6, this, "ptr", contextObject, "ptr*", &enumerator := 0, "HRESULT")
        return IKeyEnumerator(enumerator)
    }
}
