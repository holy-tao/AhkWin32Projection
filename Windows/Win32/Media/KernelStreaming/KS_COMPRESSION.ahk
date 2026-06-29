#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_COMPRESSION {
    #StructPack 4

    RatioNumerator : UInt32

    RatioDenominator : UInt32

    RatioConstantMargin : UInt32

}
