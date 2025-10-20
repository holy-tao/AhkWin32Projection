#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IModelPropertyAccessor extends IUnknown{
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
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IModelObject>} value 
     * @returns {HRESULT} 
     */
    GetValue(key, contextObject, value) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(3, this, "ptr", key, "ptr", contextObject, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} key 
     * @param {Pointer<IModelObject>} contextObject 
     * @param {Pointer<IModelObject>} value 
     * @returns {HRESULT} 
     */
    SetValue(key, contextObject, value) {
        key := key is String ? StrPtr(key) : key

        result := ComCall(4, this, "ptr", key, "ptr", contextObject, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
