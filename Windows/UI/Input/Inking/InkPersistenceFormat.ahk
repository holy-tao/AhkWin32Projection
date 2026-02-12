#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the formats for saving ink input.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpersistenceformat
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPersistenceFormat extends Win32Enum{

    /**
     * Ink is saved as a GIF file with embedded Ink Serialized Format (ISF) format data.
     * @type {Integer (Int32)}
     */
    static GifWithEmbeddedIsf => 0

    /**
     * Ink is saved as Ink Serialized Format (ISF) format data.
     * @type {Integer (Int32)}
     */
    static Isf => 1
}
