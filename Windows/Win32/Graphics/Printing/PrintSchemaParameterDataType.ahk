#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PrintSchemaParameterDataType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaParameterDataType_Integer => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaParameterDataType_NumericString => 1

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaParameterDataType_String => 2
}
