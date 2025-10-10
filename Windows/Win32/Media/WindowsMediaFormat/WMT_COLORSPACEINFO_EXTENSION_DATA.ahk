#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMT_COLORSPACEINFO_EXTENSION_DATA structure contains information about the color format of output video samples. It is used as the value for the WM_SampleExtensionGUID_ColorSpaceInfo data unit extension.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_colorspaceinfo_extension_data
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_COLORSPACEINFO_EXTENSION_DATA extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * Specifies the chromaticity coordinates of the color primaries.
     * @type {Integer}
     */
    ucColorPrimaries {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the opto-electronic transfer characteristics of the source picture.
     * @type {Integer}
     */
    ucColorTransferChar {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the matrix coefficients used to derive Y, Cb, and Cr signals from the color primaries.
     * @type {Integer}
     */
    ucColorMatrixCoef {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
