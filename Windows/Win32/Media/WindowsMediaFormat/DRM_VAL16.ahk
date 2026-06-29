#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRM_VAL16 structure is used by some DRM-related methods for passing 128-bit device identification values.
 * @remarks
 * This structure is used to store the device serial number for network devices, such as set-top boxes.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-drm_val16
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct DRM_VAL16 {
    #StructPack 1

    /**
     * Array of <b>BYTE</b> values that contains a 128-bit value. Data is stored with the high-order byte in the lowest address (big-endian).
     */
    val : Int8[16]

}
