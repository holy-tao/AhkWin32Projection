#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify text prediction options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textpredictionoptions
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextPredictionOptions extends Win32BitflagEnum{

    /**
     * Indicates that neither corrections nor predictions should be retrieved.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Indicates that predictions should be retrieved.
     * @type {Integer (UInt32)}
     */
    static Predictions => 1

    /**
     * Indicates that corrections should be retrieved.
     * @type {Integer (UInt32)}
     */
    static Corrections => 2
}
