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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Value", "put_Value"]

    /**
     * 
     * @param {Pointer<BSTR>} propertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-get_name
     */
    get_Name(propertyName) {
        result := ComCall(7, this, "ptr", propertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-put_name
     */
    put_Name(propertyName) {
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(8, this, "ptr", propertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-get_value
     */
    get_Value(propertyValue) {
        result := ComCall(9, this, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventproperty-put_value
     */
    put_Value(propertyValue) {
        result := ComCall(10, this, "ptr", propertyValue, "HRESULT")
        return result
    }
}
