#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPropertyValueStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a value in a property store (such as a [PropertySet](../windows.foundation.collections/propertyset.md) instance).
 * @remarks
 * PropertyValue represents the value portion of a property that typically has a string name, and some value. There are multiple properties in a property set, and each property potentially has a different value type, so from a collection standpoint the collection is mixed, not strongly typed. The [PropertySet](../windows.foundation.collections/propertyset.md) class and the [IPropertySet](../windows.foundation.collections/ipropertyset.md) interface are existing interfaces or implementations that use this model and use a PropertyValue as the value part of a key-value pair. [IPropertySet](../windows.foundation.collections/ipropertyset.md) is the type of various Windows Runtime properties where the goal is to provide your app with a *property bag* of properties that are conceptually related in their origin, but each property might (and often does) use a different value type.
 * 
 * When used by other Windows Runtime APIs and their signatures, values are often passed as the [IPropertyValue](ipropertyvalue.md) interface rather than as the PropertyValue type.
 * 
 * In addition to representing the value itself, PropertyValue defines utility methods that populate a PropertyValue instance. Calling these utility methods from app code is uncommon. The methods create a boxed value, and in this aspect a PropertyValue instance functions similarly to the **VARIANT** concept from Component Object Model (COM). Each method has a matched method that creates an array of values as opposed to a single value.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class PropertyValue extends IInspectable {
;@region Static Methods
    /**
     * Creates an empty property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createempty
     */
    static CreateEmpty() {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateEmpty()
    }

    /**
     * Creates a property value from a byte.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint8
     */
    static CreateUInt8(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt8(value)
    }

    /**
     * Creates a property value from an integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint16
     */
    static CreateInt16(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt16(value)
    }

    /**
     * Creates a property value from an unsigned integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint16
     */
    static CreateUInt16(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt16(value)
    }

    /**
     * Creates a property value from an integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint32
     */
    static CreateInt32(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt32(value)
    }

    /**
     * Creates a property value from an unsigned integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint32
     */
    static CreateUInt32(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt32(value)
    }

    /**
     * Creates a property value from an integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint64
     */
    static CreateInt64(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt64(value)
    }

    /**
     * Creates a property value from an unsigned integer.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint64
     */
    static CreateUInt64(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt64(value)
    }

    /**
     * Creates a property value from a floating-point value.
     * @param {Float} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createsingle
     */
    static CreateSingle(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateSingle(value)
    }

    /**
     * Creates a property value from a floating-point value.
     * @param {Float} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createdouble
     */
    static CreateDouble(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateDouble(value)
    }

    /**
     * Creates a property value from a Unicode character.
     * @param {Integer} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createchar16
     */
    static CreateChar16(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateChar16(value)
    }

    /**
     * Creates a property value from a Boolean value.
     * @param {Boolean} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createboolean
     */
    static CreateBoolean(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateBoolean(value)
    }

    /**
     * Creates a property value from a string.
     * @param {HSTRING} value The string to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createstring
     */
    static CreateString(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateString(value)
    }

    /**
     * Supplies the property value representation of an inspectable object. Since an object is a reference type, it is also a valid property value and does not need to be boxed. Instead, this method returns the object provided without modification. An object can be set as a property value without first calling this method.
     * @param {IInspectable} value The object to store in the property value. The value must be non-null.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createinspectable
     */
    static CreateInspectable(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInspectable(value)
    }

    /**
     * Creates a property value from a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid).
     * @param {Guid} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createguid
     */
    static CreateGuid(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateGuid(value)
    }

    /**
     * Creates a property value from a date and time value.
     * @param {DateTime} value The value to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createdatetime
     */
    static CreateDateTime(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateDateTime(value)
    }

    /**
     * Creates a property value from a time interval.
     * @param {TimeSpan} value The time interval to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createtimespan
     */
    static CreateTimeSpan(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateTimeSpan(value)
    }

    /**
     * Creates a property value from a point structure.
     * @param {POINT} value The structure to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createpoint
     */
    static CreatePoint(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreatePoint(value)
    }

    /**
     * Creates a property value from a size structure.
     * @param {SIZE} value The structure to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createsize
     */
    static CreateSize(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateSize(value)
    }

    /**
     * Creates a property value from a rectangle structure.
     * @param {RECT} value The structure to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createrect
     */
    static CreateRect(value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateRect(value)
    }

    /**
     * Creates a property value from an array of bytes.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint8array
     */
    static CreateUInt8Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt8Array(value_length, value)
    }

    /**
     * Creates a property value from an array of integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint16array
     */
    static CreateInt16Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt16Array(value_length, value)
    }

    /**
     * Creates a property value from an array of unsigned integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint16array
     */
    static CreateUInt16Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt16Array(value_length, value)
    }

    /**
     * Creates a property value from an array of integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint32array
     */
    static CreateInt32Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt32Array(value_length, value)
    }

    /**
     * Creates a property value from an array of unsigned integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint32array
     */
    static CreateUInt32Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt32Array(value_length, value)
    }

    /**
     * Creates a property value from an array of integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createint64array
     */
    static CreateInt64Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInt64Array(value_length, value)
    }

    /**
     * Creates a property value from an array of unsigned integers.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createuint64array
     */
    static CreateUInt64Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateUInt64Array(value_length, value)
    }

    /**
     * Creates a property value from an array of floating-point values.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createsinglearray
     */
    static CreateSingleArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateSingleArray(value_length, value)
    }

    /**
     * Creates a property value from an array of floating-point values.
     * @param {Integer} value_length 
     * @param {Pointer<Float>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createdoublearray
     */
    static CreateDoubleArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateDoubleArray(value_length, value)
    }

    /**
     * Creates a property value from an array of Unicode characters.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createchar16array
     */
    static CreateChar16Array(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateChar16Array(value_length, value)
    }

    /**
     * Creates a property value from an array of Boolean values.
     * @param {Integer} value_length 
     * @param {Pointer<Boolean>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createbooleanarray
     */
    static CreateBooleanArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateBooleanArray(value_length, value)
    }

    /**
     * Creates a property value from an array of strings.
     * @param {Integer} value_length 
     * @param {Pointer<HSTRING>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createstringarray
     */
    static CreateStringArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateStringArray(value_length, value)
    }

    /**
     * Creates a property value from an array of inspectable objects.
     * @param {Integer} value_length 
     * @param {Pointer<IInspectable>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createinspectablearray
     */
    static CreateInspectableArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateInspectableArray(value_length, value)
    }

    /**
     * Creates a property value from an array of [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)s.
     * @param {Integer} value_length 
     * @param {Pointer<Guid>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createguidarray
     */
    static CreateGuidArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateGuidArray(value_length, value)
    }

    /**
     * Creates a property value from an array of date and time values.
     * @param {Integer} value_length 
     * @param {Pointer<DateTime>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createdatetimearray
     */
    static CreateDateTimeArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateDateTimeArray(value_length, value)
    }

    /**
     * Creates a property value from an array of time intervals.
     * @param {Integer} value_length 
     * @param {Pointer<TimeSpan>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createtimespanarray
     */
    static CreateTimeSpanArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateTimeSpanArray(value_length, value)
    }

    /**
     * Creates a property value from an array of point structures.
     * @param {Integer} value_length 
     * @param {Pointer<POINT>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createpointarray
     */
    static CreatePointArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreatePointArray(value_length, value)
    }

    /**
     * Creates a property value from an array of size structures.
     * @param {Integer} value_length 
     * @param {Pointer<SIZE>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createsizearray
     */
    static CreateSizeArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateSizeArray(value_length, value)
    }

    /**
     * Creates a property value from an array of rectangle structures.
     * @param {Integer} value_length 
     * @param {Pointer<RECT>} value The array to store in the property value.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertyvalue.createrectarray
     */
    static CreateRectArray(value_length, value) {
        if (!PropertyValue.HasProp("__IPropertyValueStatics")) {
            activatableClassId := HSTRING.Create("Windows.Foundation.PropertyValue")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyValueStatics.IID)
            PropertyValue.__IPropertyValueStatics := IPropertyValueStatics(factoryPtr)
        }

        return PropertyValue.__IPropertyValueStatics.CreateRectArray(value_length, value)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
