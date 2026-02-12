#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Property Object (ADOX)
 * @remarks
 * ADOX objects have two types of properties: built-in and dynamic.  
 *   
 *  Built-in properties are those properties immediately available to any new object, using the MyObject.Property syntax. They do not appear as Property objects in an object's [Properties collection](../ado-api/properties-collection-ado.md), so although you can change their values, you cannot modify their characteristics.  
 *   
 *  Dynamic properties are defined by the underlying data provider, and appear in the Properties collection for the appropriate ADOX object.  Dynamic properties can be referenced only through the collection, using the MyObject.Properties(0) or MyObject.Properties("Name") syntax.  
 *   
 *  You cannot delete either kind of property.  
 *   
 *  A dynamic Property object has four built-in properties of its own:  
 *   
 *  The [Name](../ado-api/name-property-ado.md) property is a string that identifies the property.  
 *   
 *  The [Type](../ado-api/type-property-ado.md) property is an integer that specifies the property data type.  
 *   
 *  The [Value](../ado-api/value-property-ado.md) property is a variant that contains the property setting. Value is the default property for a Property object.  
 *   
 *  The [Attributes](../ado-api/attributes-property-ado.md) property is a long value that indicates characteristics of the property specific to the provider.  
 *   
 *  This section contains the following topic.  
 *   
 * -   [ADOX Property Object Properties, Methods, and Events](./adox-property-object-properties-methods-and-events.md)
 * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/property-object-adox
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Property extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Property
     * @type {Guid}
     */
    static IID => Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

    /**
     * The class identifier for Property
     * @type {Guid}
     */
    static CLSID => Guid("{4600c3a5-e301-41d8-b6d0-ef2e4212e0ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Value", "get_Name"]

    /**
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Value() {
        Value := VARIANT()
        result := ComCall(7, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    put_Value(Value) {
        result := ComCall(8, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(9, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Name
    }
}
