#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPropertyEntry interface is used to manage a property entry in the property cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadspropertyentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyEntry
     * @type {Guid}
     */
    static IID => Guid("{05792c8e-941f-11d0-8529-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "get_Name", "put_Name", "get_ADsType", "put_ADsType", "get_ControlCode", "put_ControlCode", "get_Values", "put_Values"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
     */
    ADsType {
        get => this.get_ADsType()
        set => this.put_ADsType(value)
    }

    /**
     * @type {Integer} 
     */
    ControlCode {
        get => this.get_ControlCode()
        set => this.put_ControlCode(value)
    }

    /**
     * @type {VARIANT} 
     */
    Values {
        get => this.get_Values()
        set => this.put_Values(value)
    }

    /**
     * Clear Method (ADO)
     * @remarks
     * Use the **Clear** method on the [Errors](./errors-collection-ado.md) collection to remove all existing [Error](./error-object.md) objects from the collection. When an error occurs, ADO automatically clears the **Errors** collection and fills it with **Error** objects based on the new error.  
     *   
     *  Some properties and methods return warnings that appear as **Error** objects in the **Errors** collection but do not halt a program's execution. Before you call the [Resync](./resync-method.md), [UpdateBatch](./updatebatch-method.md), or [CancelBatch](./cancelbatch-method-ado.md) methods on a [Recordset](./recordset-object-ado.md) object; the [Open](./open-method-ado-connection.md) method on a [Connection](./connection-object-ado.md) object; or set the [Filter](./filter-property.md) property on a **Recordset** object, call the **Clear** method on the **Errors** collection. That way, you can read the [Count](./count-property-ado.md) property of the **Errors** collection to test for returned warnings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clear-method-ado
     */
    Clear() {
        result := ComCall(7, this, "int")
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
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        if(bstrName is String) {
            pin := BSTR.Alloc(bstrName)
            bstrName := pin.Value
        }

        result := ComCall(9, this, "ptr", bstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ADsType() {
        result := ComCall(10, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnADsType 
     * @returns {HRESULT} 
     */
    put_ADsType(lnADsType) {
        result := ComCall(11, this, "int", lnADsType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlCode() {
        result := ComCall(12, this, "int*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {Integer} lnControlCode 
     * @returns {HRESULT} 
     */
    put_ControlCode(lnControlCode) {
        result := ComCall(13, this, "int", lnControlCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Values() {
        retval := VARIANT()
        result := ComCall(14, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {VARIANT} vValues 
     * @returns {HRESULT} 
     */
    put_Values(vValues) {
        result := ComCall(15, this, "ptr", vValues, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
