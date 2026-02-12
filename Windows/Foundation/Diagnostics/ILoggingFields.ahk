#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class ILoggingFields extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoggingFields
     * @type {Guid}
     */
    static IID => Guid("{d7f6b7af-762d-4579-83bd-52c23bc333bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clear", "BeginStruct", "BeginStructWithTags", "EndStruct", "AddEmpty", "AddEmptyWithFormat", "AddEmptyWithFormatAndTags", "AddUInt8", "AddUInt8WithFormat", "AddUInt8WithFormatAndTags", "AddUInt8Array", "AddUInt8ArrayWithFormat", "AddUInt8ArrayWithFormatAndTags", "AddInt16", "AddInt16WithFormat", "AddInt16WithFormatAndTags", "AddInt16Array", "AddInt16ArrayWithFormat", "AddInt16ArrayWithFormatAndTags", "AddUInt16", "AddUInt16WithFormat", "AddUInt16WithFormatAndTags", "AddUInt16Array", "AddUInt16ArrayWithFormat", "AddUInt16ArrayWithFormatAndTags", "AddInt32", "AddInt32WithFormat", "AddInt32WithFormatAndTags", "AddInt32Array", "AddInt32ArrayWithFormat", "AddInt32ArrayWithFormatAndTags", "AddUInt32", "AddUInt32WithFormat", "AddUInt32WithFormatAndTags", "AddUInt32Array", "AddUInt32ArrayWithFormat", "AddUInt32ArrayWithFormatAndTags", "AddInt64", "AddInt64WithFormat", "AddInt64WithFormatAndTags", "AddInt64Array", "AddInt64ArrayWithFormat", "AddInt64ArrayWithFormatAndTags", "AddUInt64", "AddUInt64WithFormat", "AddUInt64WithFormatAndTags", "AddUInt64Array", "AddUInt64ArrayWithFormat", "AddUInt64ArrayWithFormatAndTags", "AddSingle", "AddSingleWithFormat", "AddSingleWithFormatAndTags", "AddSingleArray", "AddSingleArrayWithFormat", "AddSingleArrayWithFormatAndTags", "AddDouble", "AddDoubleWithFormat", "AddDoubleWithFormatAndTags", "AddDoubleArray", "AddDoubleArrayWithFormat", "AddDoubleArrayWithFormatAndTags", "AddChar16", "AddChar16WithFormat", "AddChar16WithFormatAndTags", "AddChar16Array", "AddChar16ArrayWithFormat", "AddChar16ArrayWithFormatAndTags", "AddBoolean", "AddBooleanWithFormat", "AddBooleanWithFormatAndTags", "AddBooleanArray", "AddBooleanArrayWithFormat", "AddBooleanArrayWithFormatAndTags", "AddString", "AddStringWithFormat", "AddStringWithFormatAndTags", "AddStringArray", "AddStringArrayWithFormat", "AddStringArrayWithFormatAndTags", "AddGuid", "AddGuidWithFormat", "AddGuidWithFormatAndTags", "AddGuidArray", "AddGuidArrayWithFormat", "AddGuidArrayWithFormatAndTags", "AddDateTime", "AddDateTimeWithFormat", "AddDateTimeWithFormatAndTags", "AddDateTimeArray", "AddDateTimeArrayWithFormat", "AddDateTimeArrayWithFormatAndTags", "AddTimeSpan", "AddTimeSpanWithFormat", "AddTimeSpanWithFormatAndTags", "AddTimeSpanArray", "AddTimeSpanArrayWithFormat", "AddTimeSpanArrayWithFormatAndTags", "AddPoint", "AddPointWithFormat", "AddPointWithFormatAndTags", "AddPointArray", "AddPointArrayWithFormat", "AddPointArrayWithFormatAndTags", "AddSize", "AddSizeWithFormat", "AddSizeWithFormatAndTags", "AddSizeArray", "AddSizeArrayWithFormat", "AddSizeArrayWithFormatAndTags", "AddRect", "AddRectWithFormat", "AddRectWithFormatAndTags", "AddRectArray", "AddRectArrayWithFormat", "AddRectArrayWithFormatAndTags"]

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
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    BeginStruct(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    BeginStructWithTags(name, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(8, this, "ptr", name, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndStruct() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    AddEmpty(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddEmptyWithFormat(name, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddEmptyWithFormatAndTags(name, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(12, this, "ptr", name, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddUInt8(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(13, this, "ptr", name, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt8WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(14, this, "ptr", name, "char", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt8WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(15, this, "ptr", name, "char", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddUInt8Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt8ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt8ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddInt16(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(19, this, "ptr", name, "short", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt16WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(20, this, "ptr", name, "short", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt16WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(21, this, "ptr", name, "short", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddInt16Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt16ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "short*" : "ptr"

        result := ComCall(23, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddUInt16(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(25, this, "ptr", name, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt16WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(26, this, "ptr", name, "ushort", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt16WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(27, this, "ptr", name, "ushort", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddUInt16Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt16ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "ushort*" : "ptr"

        result := ComCall(29, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "ushort*" : "ptr"

        result := ComCall(30, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddInt32(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(31, this, "ptr", name, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt32WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(32, this, "ptr", name, "int", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt32WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(33, this, "ptr", name, "int", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddInt32Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt32ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt32ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddUInt32(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(37, this, "ptr", name, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt32WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(38, this, "ptr", name, "uint", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt32WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(39, this, "ptr", name, "uint", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddUInt32Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt32ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt32ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddInt64(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(43, this, "ptr", name, "int64", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt64WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(44, this, "ptr", name, "int64", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt64WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(45, this, "ptr", name, "int64", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddInt64Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(46, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddInt64ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(47, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddInt64ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(48, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddUInt64(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(49, this, "ptr", name, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt64WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(50, this, "ptr", name, "uint", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt64WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(51, this, "ptr", name, "uint", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddUInt64Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(52, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddUInt64ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(53, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddUInt64ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(54, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    AddSingle(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(55, this, "ptr", name, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddSingleWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(56, this, "ptr", name, "float", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddSingleWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(57, this, "ptr", name, "float", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    AddSingleArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := ComCall(58, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddSingleArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := ComCall(59, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddSingleArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := ComCall(60, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    AddDouble(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(61, this, "ptr", name, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddDoubleWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(62, this, "ptr", name, "double", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Float} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddDoubleWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(63, this, "ptr", name, "double", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @returns {HRESULT} 
     */
    AddDoubleArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(64, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddDoubleArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(65, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddDoubleArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(66, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    AddChar16(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(67, this, "ptr", name, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddChar16WithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(68, this, "ptr", name, "char", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddChar16WithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(69, this, "ptr", name, "char", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    AddChar16Array(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(70, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddChar16ArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(71, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddChar16ArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(72, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    AddBoolean(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(73, this, "ptr", name, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Boolean} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddBooleanWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(74, this, "ptr", name, "int", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Boolean} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddBooleanWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(75, this, "ptr", name, "int", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value 
     * @returns {HRESULT} 
     */
    AddBooleanArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(76, this, "ptr", name, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddBooleanArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddBooleanArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(78, this, "ptr", name, "uint", value_length, valueMarshal, value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    AddString(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(79, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddStringWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(80, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddStringWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(81, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value 
     * @returns {HRESULT} 
     */
    AddStringArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(82, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddStringArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(83, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddStringArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(84, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    AddGuid(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(85, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Guid} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddGuidWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(86, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Guid} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddGuidWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(87, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value 
     * @returns {HRESULT} 
     */
    AddGuidArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(88, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddGuidArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(89, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddGuidArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(90, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    AddDateTime(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(91, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {DateTime} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddDateTimeWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(92, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {DateTime} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddDateTimeWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(93, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value 
     * @returns {HRESULT} 
     */
    AddDateTimeArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(94, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddDateTimeArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(95, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddDateTimeArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(96, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    AddTimeSpan(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(97, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {TimeSpan} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddTimeSpanWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(98, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {TimeSpan} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddTimeSpanWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(99, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    AddTimeSpanArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(100, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddTimeSpanArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(101, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddTimeSpanArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(102, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @remarks
     * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
     * @param {HSTRING} name 
     * @param {POINT} value 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     */
    AddPoint(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(103, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @remarks
     * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
     * @param {HSTRING} name 
     * @param {POINT} value 
     * @param {Integer} format 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     */
    AddPointWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(104, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Include the specified pointer in the set of pointers processed by the Interaction Context object.
     * @remarks
     * Turn pointer filtering on by setting INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/interactioncontext/nf-interactioncontext-setpropertyinteractioncontext">SetPropertyInteractionContext</a>.
     * @param {HSTRING} name 
     * @param {POINT} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} If this function succeeds, it returns S_OK.
     *  
     * Otherwise, it returns an HRESULT error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/interactioncontext/nf-interactioncontext-addpointerinteractioncontext
     */
    AddPointWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(105, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value 
     * @returns {HRESULT} 
     */
    AddPointArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(106, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddPointArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(107, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddPointArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(108, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    AddSize(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(109, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SIZE} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddSizeWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(110, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {SIZE} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddSizeWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(111, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value 
     * @returns {HRESULT} 
     */
    AddSizeArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(112, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddSizeArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(113, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddSizeArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(114, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    AddRect(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(115, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {RECT} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddRectWithFormat(name, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(116, this, "ptr", name, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {RECT} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddRectWithFormatAndTags(name, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(117, this, "ptr", name, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value 
     * @returns {HRESULT} 
     */
    AddRectArray(name, value_length, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(118, this, "ptr", name, "uint", value_length, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value 
     * @param {Integer} format 
     * @returns {HRESULT} 
     */
    AddRectArrayWithFormat(name, value_length, value, format) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(119, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value 
     * @param {Integer} format 
     * @param {Integer} tags 
     * @returns {HRESULT} 
     */
    AddRectArrayWithFormatAndTags(name, value_length, value, format, tags) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(120, this, "ptr", name, "uint", value_length, "ptr", value, "int", format, "int", tags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
