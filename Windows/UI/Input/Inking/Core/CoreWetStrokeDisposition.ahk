#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the pre-rendered state ([Disposition](corewetstrokeupdateeventargs_disposition.md)) of the "wet" ink stroke.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokedisposition
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreWetStrokeDisposition extends Win32Enum{

    /**
     * Ink stroke is underway.
     * @type {Integer (Int32)}
     */
    static Inking => 0

    /**
     * Ink stroke is to be completed.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * Ink stroke is to be canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 2
}
