#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the JSON value type of a [JsonValue](jsonvalue.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonvaluetype
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonValueType extends Win32Enum{

    /**
     * The [JsonValue](jsonvalue.md) object is Null.
     * @type {Integer (Int32)}
     */
    static Null => 0

    /**
     * The [JsonValue](jsonvalue.md) object is a **Boolean**.
     * @type {Integer (Int32)}
     */
    static Boolean => 1

    /**
     * The [JsonValue](jsonvalue.md) object is a **Double**.
     * @type {Integer (Int32)}
     */
    static Number => 2

    /**
     * The [JsonValue](jsonvalue.md) object is a **String**.
     * @type {Integer (Int32)}
     */
    static String => 3

    /**
     * The [JsonValue](jsonvalue.md) object is an Array.
     * @type {Integer (Int32)}
     */
    static Array => 4

    /**
     * The [JsonValue](jsonvalue.md) object is an Object.
     * @type {Integer (Int32)}
     */
    static Object => 5
}
