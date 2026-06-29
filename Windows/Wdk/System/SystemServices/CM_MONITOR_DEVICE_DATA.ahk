#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_MONITOR_DEVICE_DATA {
    #StructPack 2

    Version : UInt16

    Revision : UInt16

    HorizontalScreenSize : UInt16

    VerticalScreenSize : UInt16

    HorizontalResolution : UInt16

    VerticalResolution : UInt16

    HorizontalDisplayTimeLow : UInt16

    HorizontalDisplayTime : UInt16

    HorizontalDisplayTimeHigh : UInt16

    HorizontalBackPorchLow : UInt16

    HorizontalBackPorch : UInt16

    HorizontalBackPorchHigh : UInt16

    HorizontalFrontPorchLow : UInt16

    HorizontalFrontPorch : UInt16

    HorizontalFrontPorchHigh : UInt16

    HorizontalSyncLow : UInt16

    HorizontalSync : UInt16

    HorizontalSyncHigh : UInt16

    VerticalBackPorchLow : UInt16

    VerticalBackPorch : UInt16

    VerticalBackPorchHigh : UInt16

    VerticalFrontPorchLow : UInt16

    VerticalFrontPorch : UInt16

    VerticalFrontPorchHigh : UInt16

    VerticalSyncLow : UInt16

    VerticalSync : UInt16

    VerticalSyncHigh : UInt16

}
