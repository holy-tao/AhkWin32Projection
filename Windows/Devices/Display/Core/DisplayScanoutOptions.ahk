#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants specifying options for creating a [DisplayScanout](displayscanout.md) object (for example, by calling [DisplayDevice.CreateSimpleScanoutWithDirtyRectsAndOptions](displaydevice_createsimplescanoutwithdirtyrectsandoptions_569158796.md)).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayscanoutoptions
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayScanoutOptions extends Win32BitflagEnum{

    /**
     * Specifies no particular option.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Specifies that tearing is allowed, in order to update the underlying display transport at the lowest possible latency.
     * @type {Integer (UInt32)}
     */
    static AllowTearing => 2
}
