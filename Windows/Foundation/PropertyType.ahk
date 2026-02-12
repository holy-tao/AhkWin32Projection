#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies property value types.
 * @remarks
 * This enumeration is used as a value by [IPropertyValue.Type](ipropertyvalue_type.md) and [BitmapTypedValue.Type](../windows.graphics.imaging/bitmaptypedvalue_type.md).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.propertytype
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class PropertyType extends Win32Enum{

    /**
     * No type is specified.
     * @type {Integer (Int32)}
     */
    static Empty => 0

    /**
     * A byte.
     * @type {Integer (Int32)}
     */
    static UInt8 => 1

    /**
     * A signed 16-bit (2-byte) integer.
     * @type {Integer (Int32)}
     */
    static Int16 => 2

    /**
     * An unsigned 16-bit (2-byte) integer.
     * @type {Integer (Int32)}
     */
    static UInt16 => 3

    /**
     * A signed 32-bit (4-byte) integer.
     * @type {Integer (Int32)}
     */
    static Int32 => 4

    /**
     * An unsigned 32-bit (4-byte) integer.
     * @type {Integer (Int32)}
     */
    static UInt32 => 5

    /**
     * A signed 64-bit (8-byte) integer.
     * @type {Integer (Int32)}
     */
    static Int64 => 6

    /**
     * An unsigned 64-bit (8-byte) integer.
     * @type {Integer (Int32)}
     */
    static UInt64 => 7

    /**
     * A signed 32-bit (4-byte) floating-point number.
     * @type {Integer (Int32)}
     */
    static Single => 8

    /**
     * A signed 64-bit (8-byte) floating-point number.
     * @type {Integer (Int32)}
     */
    static Double => 9

    /**
     * An unsigned 16-bit (2-byte) code point.
     * @type {Integer (Int32)}
     */
    static Char16 => 10

    /**
     * A value that can be only true or false.
     * @type {Integer (Int32)}
     */
    static Boolean => 11

    /**
     * A Windows Runtime  [HSTRING](/windows/desktop/WinRT/hstring).
     * @type {Integer (Int32)}
     */
    static String => 12

    /**
     * An object implementing the [IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable) interface.
     * @type {Integer (Int32)}
     */
    static Inspectable => 13

    /**
     * An instant in time, typically expressed as a date and time of day.
     * @type {Integer (Int32)}
     */
    static DateTime => 14

    /**
     * A time interval.
     * @type {Integer (Int32)}
     */
    static TimeSpan => 15

    /**
     * A globally unique identifier.
     * @type {Integer (Int32)}
     */
    static Guid => 16

    /**
     * An ordered pair of floating-point x- and y-coordinates that defines a point in a two-dimensional plane.
     * @type {Integer (Int32)}
     */
    static Point => 17

    /**
     * An ordered pair of float-point numbers that specify a height and width.
     * @type {Integer (Int32)}
     */
    static Size => 18

    /**
     * A set of four floating-point numbers that represent the location and size of a rectangle.
     * @type {Integer (Int32)}
     */
    static Rect => 19

    /**
     * A type not specified in this enumeration.
     * @type {Integer (Int32)}
     */
    static OtherType => 20

    /**
     * An array of [Byte](/dotnet/api/system.byte?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static UInt8Array => 1025

    /**
     * An array of [Int16](/dotnet/api/system.int16?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static Int16Array => 1026

    /**
     * An array of [UInt16](/dotnet/api/system.uint16?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static UInt16Array => 1027

    /**
     * An array of [Int32](/dotnet/api/system.int32?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static Int32Array => 1028

    /**
     * An array of [UInt32](/dotnet/api/system.uint32?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static UInt32Array => 1029

    /**
     * An array of [Int64](/dotnet/api/system.int64?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static Int64Array => 1030

    /**
     * An array of [UInt64](/dotnet/api/system.uint64?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static UInt64Array => 1031

    /**
     * An array of [Single](/dotnet/api/system.single?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static SingleArray => 1032

    /**
     * An array of [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static DoubleArray => 1033

    /**
     * An array of [Char](/dotnet/api/system.char?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static Char16Array => 1034

    /**
     * An array of [Boolean](/dotnet/api/system.boolean?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static BooleanArray => 1035

    /**
     * An array of [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static StringArray => 1036

    /**
     * An array of **Inspectable** values.
     * @type {Integer (Int32)}
     */
    static InspectableArray => 1037

    /**
     * An array of [DateTime](datetime.md) values.
     * @type {Integer (Int32)}
     */
    static DateTimeArray => 1038

    /**
     * An array of [TimeSpan](timespan.md) values.
     * @type {Integer (Int32)}
     */
    static TimeSpanArray => 1039

    /**
     * An array of [Guid](/dotnet/api/system.guid?view=dotnet-uwp-10.0&preserve-view=true) values.
     * @type {Integer (Int32)}
     */
    static GuidArray => 1040

    /**
     * An array of [Point](point.md) structures.
     * @type {Integer (Int32)}
     */
    static PointArray => 1041

    /**
     * An array of [Size](size.md) structures.
     * @type {Integer (Int32)}
     */
    static SizeArray => 1042

    /**
     * An array of [Rect](rect.md) structures.
     * @type {Integer (Int32)}
     */
    static RectArray => 1043

    /**
     * An array of an unspecified type.
     * @type {Integer (Int32)}
     */
    static OtherTypeArray => 1044
}
