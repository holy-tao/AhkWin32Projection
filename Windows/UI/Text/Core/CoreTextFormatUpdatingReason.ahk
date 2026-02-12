#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the set of state applied during text composition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingreason
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextFormatUpdatingReason extends Win32Enum{

    /**
     * The reason for the format updating is unknown.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The text is an unconverted composition string.
     * @type {Integer (Int32)}
     */
    static CompositionUnconverted => 1

    /**
     * The text is a converted composition string.
     * @type {Integer (Int32)}
     */
    static CompositionConverted => 2

    /**
     * The user has made a selection in the composition string and the text has been converted.
     * @type {Integer (Int32)}
     */
    static CompositionTargetUnconverted => 3

    /**
     * The user made a selection in the composition string, but the text has not yet been converted.
     * @type {Integer (Int32)}
     */
    static CompositionTargetConverted => 4
}
