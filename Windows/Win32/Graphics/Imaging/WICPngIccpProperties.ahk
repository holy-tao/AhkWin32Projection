#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the Portable Network Graphics (PNG) iCCP chunk metadata properties.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicpngiccpproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngIccpProperties{

    /**
     * [VT_LPSTR] Indicates the International Color Consortium (ICC) profile name.
     * @type {Integer (Int32)}
     */
    static WICPngIccpProfileName => 1

    /**
     * [VT_VECTOR \| VT_UI1] Indicates the embedded ICC profile.
     * @type {Integer (Int32)}
     */
    static WICPngIccpProfileData => 2
}
