#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines errors encountered while parsing JSON data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.json.jsonerrorstatus
 * @namespace Windows.Data.Json
 * @version WindowsRuntime 1.4
 */
class JsonErrorStatus extends Win32Enum{

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The string is invalid. It is possible the expressed value type of the JSON encapsulated data type does not match what is defined by [JsonValueType](jsonvaluetype.md).
     * @type {Integer (Int32)}
     */
    static InvalidJsonString => 1

    /**
     * The number is invalid. It is possible the expressed value type of the JSON encapsulated data type does not match what is defined by [JsonValueType](jsonvaluetype.md).
     * @type {Integer (Int32)}
     */
    static InvalidJsonNumber => 2

    /**
     * The specified [JsonValue](jsonvalue.md) cannot be found.
     * @type {Integer (Int32)}
     */
    static JsonValueNotFound => 3

    /**
     * This operation exceeds the internal limit of 1024 nested JSON objects.
     * @type {Integer (Int32)}
     */
    static ImplementationLimit => 4
}
