#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_COLORSPACEINFO_EXTENSION_DATA structure contains information about the color format of output video samples. It is used as the value for the WM_SampleExtensionGUID_ColorSpaceInfo data unit extension.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_colorspaceinfo_extension_data
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_COLORSPACEINFO_EXTENSION_DATA {
    #StructPack 1

    /**
     * Specifies the chromaticity coordinates of the color primaries.
     */
    ucColorPrimaries : Int8

    /**
     * Specifies the opto-electronic transfer characteristics of the source picture.
     */
    ucColorTransferChar : Int8

    /**
     * Specifies the matrix coefficients used to derive Y, Cb, and Cr signals from the color primaries.
     */
    ucColorMatrixCoef : Int8

}
