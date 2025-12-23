#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines video processing capabilities for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_device_caps
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_DEVICE_CAPS extends Win32Enum{

    /**
     * The device can blend video content in linear color space. Most video content is gamma corrected, resulting in nonlinear values. If the DXVA-HD device sets this flag, it means the device converts colors to linear space before blending, which produces better results.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_CAPS_LINEAR_SPACE => 1

    /**
     * The device supports the xvYCC color space for YCbCr data.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_CAPS_xvYCC => 2

    /**
     * The device can perform range conversion when the input and output are both RGB but use different color ranges (0-255 or 16-235, for 8-bit RGB).
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_CAPS_RGB_RANGE_CONVERSION => 4

    /**
     * The device can apply a matrix conversion to YCbCr values when the input and output are both YCbCr. For example, the driver can convert colors from BT.601 to BT.709.
     * @type {Integer (Int32)}
     */
    static DXVAHD_DEVICE_CAPS_YCbCr_MATRIX_CONVERSION => 8
}
