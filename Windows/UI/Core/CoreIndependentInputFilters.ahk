#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported filtering criteria for certain input device types.
 * @remarks
 * Device types are specified in [CoreInputDeviceTypes](coreinputdevicetypes.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreindependentinputfilters
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreIndependentInputFilters extends Win32BitflagEnum{

    /**
     * No filters applied.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Filter on mouse button input.
     * @type {Integer (UInt32)}
     */
    static MouseButton => 1

    /**
     * Filter on mouse wheel input.
     * @type {Integer (UInt32)}
     */
    static MouseWheel => 2

    /**
     * Filter on mouse hover input.
     * @type {Integer (UInt32)}
     */
    static MouseHover => 4

    /**
     * Filter on pen input with barrel button engaged.
     * @type {Integer (UInt32)}
     */
    static PenWithBarrel => 8

    /**
     * Filter on pen input when inverted, typically for an eraser.
     * @type {Integer (UInt32)}
     */
    static PenInverted => 16
}
