#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include ..\IDispatch.ahk

/**
 * Associates a named event property with its value.
 * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nn-eventsys-ieventproperty
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * The name of the event property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventproperty-get_name
     */
    get_Name() {
        propertyName := BSTR()
        result := ComCall(7, this, "ptr", propertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return propertyName
    }

    /**
     * The name of the event property. (Put)
     * @param {BSTR} propertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventproperty-put_name
     */
    put_Name(propertyName) {
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        result := ComCall(8, this, "ptr", propertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The value of the event property. (Get)
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventproperty-get_value
     */
    get_Value() {
        propertyValue_ := VARIANT()
        result := ComCall(9, this, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return propertyValue_
    }

    /**
     * The value of the event property. (Put)
     * @param {Pointer<VARIANT>} propertyValue_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventproperty-put_value
     */
    put_Value(propertyValue_) {
        result := ComCall(10, this, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
