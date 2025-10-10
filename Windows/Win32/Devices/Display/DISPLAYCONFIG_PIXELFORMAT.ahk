#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DISPLAYCONFIG_PIXELFORMAT enumeration specifies pixel format in various bits per pixel (BPP) values.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ne-wingdi-displayconfig_pixelformat
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_PIXELFORMAT{

    /**
     * Indicates 8 BPP format.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_PIXELFORMAT_8BPP => 1

    /**
     * Indicates 16 BPP format.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_PIXELFORMAT_16BPP => 2

    /**
     * Indicates 24 BPP format.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_PIXELFORMAT_24BPP => 3

    /**
     * Indicates 32 BPP format.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_PIXELFORMAT_32BPP => 4

    /**
     * Indicates that the current display is not an 8, 16, 24, or 32 BPP GDI desktop mode. For example, a call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> function returns DISPLAYCONFIG_PIXELFORMAT_NONGDI if a DirectX application previously set the desktop to A2R10G10B10 format. A call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a> function fails if any pixel formats for active paths are set to DISPLAYCONFIG_PIXELFORMAT_NONGDI.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_PIXELFORMAT_NONGDI => 5
}
