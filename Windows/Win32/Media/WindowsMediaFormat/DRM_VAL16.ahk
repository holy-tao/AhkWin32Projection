#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRM_VAL16 structure is used by some DRM-related methods for passing 128-bit device identification values.
 * @remarks
 * This structure is used to store the device serial number for network devices, such as set-top boxes.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_val16
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class DRM_VAL16 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Array of <b>BYTE</b> values that contains a 128-bit value. Data is stored with the high-order byte in the lowest address (big-endian).
     * @type {Array<Byte>}
     */
    val{
        get {
            if(!this.HasProp("__valProxyArray"))
                this.__valProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__valProxyArray
        }
    }
}
