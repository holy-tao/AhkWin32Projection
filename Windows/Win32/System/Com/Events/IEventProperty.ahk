#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Associates a named event property with its value.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventproperty
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventProperty extends IDispatch{
    /**
     * The interface identifier for IEventProperty
     * @type {Guid}
     */
    static IID => Guid("{da538ee2-f4de-11d1-b6bb-00805fc79216}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} propertyName 
     * @returns {HRESULT} 
     */
    get_Name(propertyName) {
        result := ComCall(7, this, "ptr", propertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     */
    put_Name(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(8, this, "ptr", propertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    get_Value(propertyValue) {
        result := ComCall(9, this, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    put_Value(propertyValue) {
        result := ComCall(10, this, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
