#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates IPropertyValue objects that you can store in a property store.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nn-windows-foundation-ipropertyvaluestatics
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IPropertyValueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyValueStatics
     * @type {Guid}
     */
    static IID => Guid("{629bdbc8-d932-4ff4-96b9-8d96c5c1e858}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEmpty", "CreateUInt8", "CreateInt16", "CreateUInt16", "CreateInt32", "CreateUInt32", "CreateInt64", "CreateUInt64", "CreateSingle", "CreateDouble", "CreateChar16", "CreateBoolean", "CreateString", "CreateInspectable", "CreateGuid", "CreateDateTime", "CreateTimeSpan", "CreatePoint", "CreateSize", "CreateRect", "CreateUInt8Array", "CreateInt16Array", "CreateUInt16Array", "CreateInt32Array", "CreateUInt32Array", "CreateInt64Array", "CreateUInt64Array", "CreateSingleArray", "CreateDoubleArray", "CreateChar16Array", "CreateBooleanArray", "CreateStringArray", "CreateInspectableArray", "CreateGuidArray", "CreateDateTimeArray", "CreateTimeSpanArray", "CreatePointArray", "CreateSizeArray", "CreateRectArray"]

    /**
     * Creates a new IPropertyValue object that represents an empty value.
     * @remarks
     * Use the <b>CreateEmpty</b>  method to represent an empty or unset property value in a property store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createempty
     */
    CreateEmpty() {
        result := ComCall(6, this, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified unsigned 8-bit integer value.
     * @remarks
     * Use the <b>CreateUInt8</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint8">GetUInt8</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>BYTE</b>
     * 
     * The unsigned 8-bit integer value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint8
     */
    CreateUInt8(value) {
        result := ComCall(7, this, "char", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {IInspectable} 
     */
    CreateInt16(value) {
        result := ComCall(8, this, "short", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {IInspectable} 
     */
    CreateUInt16(value) {
        result := ComCall(9, this, "ushort", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified signed 32-bit integer value.
     * @remarks
     * Use the <b>CreateInt32</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getint32">GetInt32</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>INT32</b>
     * 
     * The signed 32-bit integer value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createint32
     */
    CreateInt32(value) {
        result := ComCall(10, this, "int", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified unsigned 32-bit integer value.
     * @remarks
     * Use the <b>CreateUInt32</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint32">GetUInt32</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>UINT32</b>
     * 
     * The unsigned 32-bit integer value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint32
     */
    CreateUInt32(value) {
        result := ComCall(11, this, "uint", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified signed 64-bit integer value.
     * @remarks
     * Use the <b>CreateInt64</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getint64">GetInt64</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>INT64</b>
     * 
     * The signed 64-bit integer value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createint64
     */
    CreateInt64(value) {
        result := ComCall(12, this, "int64", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified unsigned 64-bit integer value.
     * @remarks
     * Use the <b>CreateUInt64</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint64">GetUInt64</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>UINT64</b>
     * 
     * The unsigned 64-bit integer value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint64
     */
    CreateUInt64(value) {
        result := ComCall(13, this, "uint", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified 32-bit floating point value.
     * @remarks
     * Use the <b>CreateSingle</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getsingle">GetSingle</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Float} value Type: <b>FLOAT</b>
     * 
     * The 32-bit floating point value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createsingle
     */
    CreateSingle(value) {
        result := ComCall(14, this, "float", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified 64-bit floating point value.
     * @remarks
     * Use the <b>CreateDouble</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getdouble">GetDouble</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Float} value Type: <b>DOUBLE</b>
     * 
     * The 64-bit floating point value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createdouble
     */
    CreateDouble(value) {
        result := ComCall(15, this, "double", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified Unicode character.
     * @remarks
     * Use the <b>CreateChar16</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getchar16">GetChar16</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Integer} value Type: <b>WCHAR</b>
     * 
     * The Unicode character to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createchar16
     */
    CreateChar16(value) {
        result := ComCall(16, this, "char", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified 8-bit Boolean value.
     * @remarks
     * Use the <b>CreateBoolean</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getboolean">GetBoolean</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {Boolean} value Type: <b>boolean</b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createboolean
     */
    CreateBoolean(value) {
        result := ComCall(17, this, "int", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified string value.
     * @remarks
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowscreatestring">CreateString</a> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nf-windows-foundation-ipropertyvalue-getstring">GetString</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {HSTRING} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a></b>
     * 
     * The string value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createstring
     */
    CreateString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(18, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified IInspectable object.
     * @remarks
     * Use the <b>CreateInspectable</b> method to  store a value in an <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/nn-windows-foundation-ipropertyvalue">IPropertyValue</a> object. You can add the  <b>IPropertyValue</b> object to a property store. Use the <a href="https://docs.microsoft.com/previous-versions/visualstudio">GetInspectable</a> method to retrieve the value from the  <b>IPropertyValue</b> object.
     * @param {IInspectable} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>*</b>
     * 
     * The object to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createinspectable
     */
    CreateInspectable(value) {
        result := ComCall(19, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified GUID value.
     * @param {Guid} value Type: <b>GUID</b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createguid
     */
    CreateGuid(value) {
        result := ComCall(20, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified DateTime value.
     * @param {DateTime} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime">DateTime</a></b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createdatetime
     */
    CreateDateTime(value) {
        result := ComCall(21, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified TimeSpan value.
     * @param {TimeSpan} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan">TimeSpan</a></b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createtimespan
     */
    CreateTimeSpan(value) {
        result := ComCall(22, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified Point value.
     * @param {POINT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-point">Point</a></b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createpoint
     */
    CreatePoint(value) {
        result := ComCall(23, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified Size value.
     * @param {SIZE} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-size">Size</a></b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createsize
     */
    CreateSize(value) {
        result := ComCall(24, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified Rect value.
     * @param {RECT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-rect">Rect</a></b>
     * 
     * The value to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createrect
     */
    CreateRect(value) {
        result := ComCall(25, this, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of unsigned 8-bit integer values.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>BYTE*</b>
     * 
     * The array of unsigned 8-bit integer values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint8array
     */
    CreateUInt8Array(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {IInspectable} 
     */
    CreateInt16Array(value_length, value) {
        valueMarshal := value is VarRef ? "short*" : "ptr"

        result := ComCall(27, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {IInspectable} 
     */
    CreateUInt16Array(value_length, value) {
        valueMarshal := value is VarRef ? "ushort*" : "ptr"

        result := ComCall(28, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of signed 32-bit integer values.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>INT32*</b>
     * 
     * The array of signed 32-bit integer values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createint32array
     */
    CreateInt32Array(value_length, value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of unsigned 32-bit integer values.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>UINT32*</b>
     * 
     * The array of unsigned 32-bit integer values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint32array
     */
    CreateUInt32Array(value_length, value) {
        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of signed 64-bit integer values.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>INT64*</b>
     * 
     * The array of signed 64-bit integer values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createint64array
     */
    CreateInt64Array(value_length, value) {
        valueMarshal := value is VarRef ? "int64*" : "ptr"

        result := ComCall(31, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of unsigned 64-bit integer values.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>UINT64*</b>
     * 
     * The array of unsigned 64-bit integer values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createuint64array
     */
    CreateUInt64Array(value_length, value) {
        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of 32-bit floating point values.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value Type: <b>FLOAT*</b>
     * 
     * The array of 32-bit floating point values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createsinglearray
     */
    CreateSingleArray(value_length, value) {
        valueMarshal := value is VarRef ? "float*" : "ptr"

        result := ComCall(33, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of 64-bit floating point values.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value Type: <b>DOUBLE*</b>
     * 
     * The array of 64-bit floating point values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createdoublearray
     */
    CreateDoubleArray(value_length, value) {
        valueMarshal := value is VarRef ? "double*" : "ptr"

        result := ComCall(34, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of Unicode characters.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value Type: <b>WCHAR*</b>
     * 
     * The array of Unicode characters to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createchar16array
     */
    CreateChar16Array(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(35, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of 8-bit Boolean values.
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value Type: <b>boolean*</b>
     * 
     * The array of 8-bit Boolean values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createbooleanarray
     */
    CreateBooleanArray(value_length, value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of string values.
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * The array of string values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createstringarray
     */
    CreateStringArray(value_length, value) {
        result := ComCall(37, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of IInspectable objects.
     * @param {Integer} value_length 
     * @param {Pointer<IInspectable>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * The array of  <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> objects to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createinspectablearray
     */
    CreateInspectableArray(value_length, value) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"

        result := ComCall(38, this, "uint", value_length, valueMarshal, value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of Guid values.
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value Type: <b>GUID*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/dotnet/api/system.guid">Guid</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createguidarray
     */
    CreateGuidArray(value_length, value) {
        result := ComCall(39, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of DateTime values.
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime">DateTime</a>*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime">DateTime</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createdatetimearray
     */
    CreateDateTimeArray(value_length, value) {
        result := ComCall(40, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of TimeSpan values.
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan">TimeSpan</a>*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan">TimeSpan</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createtimespanarray
     */
    CreateTimeSpanArray(value_length, value) {
        result := ComCall(41, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of Point values.
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-point">Point</a>*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-point">Point</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createpointarray
     */
    CreatePointArray(value_length, value) {
        result := ComCall(42, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of Size values.
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-size">Size</a>*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-size">Size</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createsizearray
     */
    CreateSizeArray(value_length, value) {
        result := ComCall(43, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }

    /**
     * Creates a new IPropertyValue object that contains the specified array of Rect values.
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-rect">Rect</a>*</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-rect">Rect</a> values to store.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvaluestatics-createrectarray
     */
    CreateRectArray(value_length, value) {
        result := ComCall(44, this, "uint", value_length, "ptr", value, "ptr*", &propertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(propertyValue_)
    }
}
