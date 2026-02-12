#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies user input modalities. These values can be combined.
 * @remarks
 * Additional input device type filters are specified in [CoreIndependentInputFilters](coreindependentinputfilters.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreinputdevicetypes
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputDeviceTypes extends Win32BitflagEnum{

    /**
     * No input.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Expose touch input events.
     * @type {Integer (UInt32)}
     */
    static Touch => 1

    /**
     * Expose pen input events.
     * @type {Integer (UInt32)}
     */
    static Pen => 2

    /**
     * Expose mouse input events.
     * @type {Integer (UInt32)}
     */
    static Mouse => 4
}
