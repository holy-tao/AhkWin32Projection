#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify whether a text provider supports selection and, if so, whether it supports a single, continuous selection or multiple, disjoint selections.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.supportedtextselection
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class SupportedTextSelection extends Win32Enum{

    /**
     * Does not support text selections.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Supports a single, continuous text selection.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * Supports multiple, disjoint text selections.
     * @type {Integer (Int32)}
     */
    static Multiple => 2
}
