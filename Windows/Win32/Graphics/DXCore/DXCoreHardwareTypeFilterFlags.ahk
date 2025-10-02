#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreHardwareTypeFilterFlags{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GPU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ComputeAccelerator => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NPU => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MediaAccelerator => 8
}
