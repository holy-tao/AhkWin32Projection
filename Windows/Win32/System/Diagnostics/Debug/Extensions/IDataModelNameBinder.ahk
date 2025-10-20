#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDataModelNameBinder extends IUnknown{
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
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} value 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindValue(contextObject, name, value, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", contextObject, "ptr", name, "ptr", value, "ptr", metadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {PWSTR} name 
     * @param {Pointer<IModelObject>} reference 
     * @param {Pointer<IKeyStore>} metadata 
     * @returns {HRESULT} 
     */
    BindReference(contextObject, name, reference, metadata) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", contextObject, "ptr", name, "ptr", reference, "ptr", metadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IKeyEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateValues(contextObject, enumerator) {
        result := ComCall(5, this, "ptr", contextObject, "ptr", enumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IKeyEnumerator>} enumerator 
     * @returns {HRESULT} 
     */
    EnumerateReferences(contextObject, enumerator) {
        result := ComCall(6, this, "ptr", contextObject, "ptr", enumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
