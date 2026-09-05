#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class PrintSchemaParameterDataType extends Win32Enum {

    /**
     * Native name: PrintSchemaParameterDataType_Integer
     * @type {Integer (Int32)}
     */
    static Integer => 0

    /**
     * Native name: PrintSchemaParameterDataType_NumericString
     * @type {Integer (Int32)}
     */
    static NumericString => 1

    /**
     * Native name: PrintSchemaParameterDataType_String
     * @type {Integer (Int32)}
     */
    static String => 2
}
