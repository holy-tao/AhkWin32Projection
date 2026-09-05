#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to get or set the width or height of a monitor's display area.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_size_type
 * @namespace Windows.Win32.Devices.Display
 */
class MC_SIZE_TYPE extends Win32Enum {

    /**
     * Width.
     * Native name: MC_WIDTH
     * @type {Integer (Int32)}
     */
    static WIDTH => 0

    /**
     * Height.
     * Native name: MC_HEIGHT
     * @type {Integer (Int32)}
     */
    static HEIGHT => 1
}
