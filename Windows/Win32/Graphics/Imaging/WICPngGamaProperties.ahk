#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the Portable Network Graphics (PNG) gAMA chunk metadata properties.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicpnggamaproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICPngGamaProperties extends Win32Enum{

    /**
     * [VT_UI4] Indicates the gamma value.
     * @type {Integer (Int32)}
     */
    static WICPngGamaGamma => 1
}
