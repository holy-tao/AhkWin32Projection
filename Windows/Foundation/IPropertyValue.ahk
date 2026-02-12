#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PropertyType.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\DateTime.ahk
#Include .\TimeSpan.ahk
#Include ..\Win32\Foundation\POINT.ahk
#Include ..\Win32\Foundation\SIZE.ahk
#Include ..\Win32\Foundation\RECT.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a value in a property store. You can't implement this interface, see Remarks.
 * @remarks
 * The IPropertyValue interface is a store for values whose type is not known until runtime.
 * 
 * To obtain the value stored in an IPropertyValue object, when the type of the stored property is not known ahead of time, you should first determine the stored type from the [Type](ipropertyvalue_type.md) property and then call the appropriate IPropertyValue method for the type.
 * 
 * If the type is known ahead of time, you can the type access method of IPropertyValue interface directory and check for the return value to verify type returned was what is expected. If the type returned does not match the value of the [Type](ipropertyvalue_type.md) property then the method fails with the **TYPE_E_TYPEMISMATCH** error.
 * 
 * You can't implement the IPropertyValue interface or include it in a signature. IPropertyValue is mainly an internal implementation detail of how the Windows Runtime implements boxing and nullable values.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IPropertyValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertyValue
     * @type {Guid}
     */
    static IID => Guid("{4bd682dd-7554-40e9-9a9b-82654ede7e62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "get_IsNumericScalar", "GetUInt8", "GetInt16", "GetUInt16", "GetInt32", "GetUInt32", "GetInt64", "GetUInt64", "GetSingle", "GetDouble", "GetChar16", "GetBoolean", "GetString", "GetGuid", "GetDateTime", "GetTimeSpan", "GetPoint", "GetSize", "GetRect", "GetUInt8Array", "GetInt16Array", "GetUInt16Array", "GetInt32Array", "GetUInt32Array", "GetInt64Array", "GetUInt64Array", "GetSingleArray", "GetDoubleArray", "GetChar16Array", "GetBooleanArray", "GetStringArray", "GetInspectableArray", "GetGuidArray", "GetDateTimeArray", "GetTimeSpanArray", "GetPointArray", "GetSizeArray", "GetRectArray"]

    /**
     * Returns the type stored in the property value.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value that indicates whether the property value is a scalar value.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.isnumericscalar
     * @type {Boolean} 
     */
    IsNumericScalar {
        get => this.get_IsNumericScalar()
    }

    /**
     * Gets the data type of the value that is stored in the current IPropertyValue object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-get_type
     */
    get_Type() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNumericScalar() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the unsigned 8-bit integer value that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>BYTE*</b>
     * 
     * The unsigned 8-bit integer values.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint8
     */
    GetUInt8() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Returns the integer value stored as a property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint16
     */
    GetInt16() {
        result := ComCall(9, this, "short*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Returns the unsigned integer value stored as a property value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint16
     */
    GetUInt16() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the signed 32-bit integer value that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>INT32*</b>
     * 
     * The signed 32-bit integer value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getint32
     */
    GetInt32() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the unsigned 32-bit integer value that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The unsigned 32-bit integer value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint32
     */
    GetUInt32() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the signed 64-bit integer value that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>INT64*</b>
     * 
     * The signed 64-bit integer value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getint64
     */
    GetInt64() {
        result := ComCall(13, this, "int64*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the unsigned 64-bit integer value that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * The unsigned 64-bit integer value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getuint64
     */
    GetUInt64() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the 32-bit floating point value that is stored in the current IPropertyValue object.
     * @returns {Float} Type: <b>FLOAT*</b>
     * 
     * The 32-bit floating point value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getsingle
     */
    GetSingle() {
        result := ComCall(15, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the 64-bit floating point value that is stored in the current IPropertyValue object.
     * @returns {Float} Type: <b>DOUBLE*</b>
     * 
     * The 64-bit floating point value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getdouble
     */
    GetDouble() {
        result := ComCall(16, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the Unicode character that is stored in the current IPropertyValue object.
     * @returns {Integer} Type: <b>WCHAR*</b>
     * 
     * The Unicode character.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getchar16
     */
    GetChar16() {
        result := ComCall(17, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the 8-bit Boolean value that is stored in the current IPropertyValue object.
     * @returns {Boolean} Type: <b>BOOLEAN*</b>
     * 
     * The 8-bit Boolean value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getboolean
     */
    GetBoolean() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the string value that is stored in the current IPropertyValue object.
     * @returns {HSTRING} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * The string value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getstring
     */
    GetString() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the GUID value that is stored in the current IPropertyValue object.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getguid
     */
    GetGuid() {
        value := Guid()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the DateTime value that is stored in the current IPropertyValue object.
     * @returns {DateTime} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-datetime">DateTime</a>*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getdatetime
     */
    GetDateTime() {
        value := DateTime()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the TimeSpan value that is stored in the current IPropertyValue object.
     * @returns {TimeSpan} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-timespan">TimeSpan</a>*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-gettimespan
     */
    GetTimeSpan() {
        value := TimeSpan()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the Point value that is stored in the current IPropertyValue object.
     * @returns {POINT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-point">Point</a>*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getpoint
     */
    GetPoint() {
        value := POINT()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the Size value that is stored in the current IPropertyValue object.
     * @returns {SIZE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-size">Size</a>*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getsize
     */
    GetSize() {
        value := SIZE()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets the Rect value that is stored in the current IPropertyValue object.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windows.foundation/ns-windows-foundation-rect">Rect</a>*</b>
     * 
     * The value.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.foundation/nf-windows-foundation-ipropertyvalue-getrect
     */
    GetRect() {
        value := RECT()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Returns the array of byte values stored as a property value.
     * @param {Pointer<Byte>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint8array
     */
    GetUInt8Array(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of integer values stored as a property value.
     * @param {Pointer<Int16>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint16array
     */
    GetInt16Array(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of unsigned integer values stored as a property value.
     * @param {Pointer<UInt16>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint16array
     */
    GetUInt16Array(value) {
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of integer values stored as a property value.
     * @param {Pointer<Int32>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint32array
     */
    GetInt32Array(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of unsigned integer values stored as a property value.
     * @param {Pointer<UInt32>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint32array
     */
    GetUInt32Array(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of integer values stored as a property value.
     * @param {Pointer<Int64>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getint64array
     */
    GetInt64Array(value) {
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of unsigned integer values stored as a property value.
     * @param {Pointer<UInt64>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getuint64array
     */
    GetUInt64Array(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of floating-point values stored as a property value.
     * @param {Pointer<Single>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getsinglearray
     */
    GetSingleArray(value) {
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of floating-point values stored as a property value.
     * @param {Pointer<Double>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getdoublearray
     */
    GetDoubleArray(value) {
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of Unicode characters stored as a property value.
     * @param {Pointer<Char>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getchar16array
     */
    GetChar16Array(value) {
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of Boolean values stored as a property value.
     * @param {Pointer<Boolean>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getbooleanarray
     */
    GetBooleanArray(value) {
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of string values stored as a property value.
     * @param {Pointer<HSTRING>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getstringarray
     */
    GetStringArray(value) {
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of inspectable objects stored as a property value.
     * @param {Pointer<Object>} value The array of objects.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getinspectablearray
     */
    GetInspectableArray(value) {
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) values stored as a property value.
     * @param {Pointer<Guid>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getguidarray
     */
    GetGuidArray(value) {
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of date and time values stored as a property value.
     * @param {Pointer<DateTime>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getdatetimearray
     */
    GetDateTimeArray(value) {
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of time interval values stored as a property value.
     * @param {Pointer<TimeSpan>} value The array of values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.gettimespanarray
     */
    GetTimeSpanArray(value) {
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of point structures stored as a property value.
     * @param {Pointer<POINT>} value The array of structures.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getpointarray
     */
    GetPointArray(value) {
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of size structures stored as a property value.
     * @param {Pointer<SIZE>} value The array of structures.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getsizearray
     */
    GetSizeArray(value) {
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the array of rectangle structures stored as a property value.
     * @param {Pointer<RECT>} value The array of structures.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.ipropertyvalue.getrectarray
     */
    GetRectArray(value) {
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * If the PropertyValue contains a primitive or a struct, unboxes it and returns it. Arrays
     * are currently not supported, as is the "OtherType" type.
     * @returns {Any} The boxed value, if it can be easily unboxed
     */
    Unbox() {
        switch(this.Type) {
            case PropertyType.Empty: return ""
            case PropertyType.UInt8: return this.GetUInt8()
            case PropertyType.Int16: return this.GetInt16()
            case PropertyType.UInt16: return this.GetUInt16()
            case PropertyType.Int32: return this.GetInt32()
            case PropertyType.Int64: return this.GetInt64()
            case PropertyType.UInt64: return this.GetUInt64()
            case PropertyType.Single: return this.GetSingle()
            case PropertyType.Double: return this.GetDouble()
            case PropertyType.Char16: return this.GetChar16()
            case PropertyType.Boolean: return this.GetBoolean()
            case PropertyType.String: return this.GetString()
            case PropertyType.DateTime: return this.GetDateTime()
            case PropertyType.Timespan: return this.GetTimespan()
            case PropertyType.Guid: return this.GetGuid()
            case PropertyType.Point: return this.GetPoint()
            case PropertyType.Size: return this.GetSize()
            case PropertyType.Rect: return this.GetRect()
            default:
                throw Error("PropertyValue of type " String(this.Type) " cannot be automatically unboxed", -1, this.Type)
        }
    }
}
