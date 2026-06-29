#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_TVTUNER_CHANGE_INFO {
    #StructPack 4

    dwFlags : UInt32

    dwCountryCode : UInt32

    dwAnalogVideoStandard : UInt32

    dwChannel : UInt32

}
