#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_SCAN_CAPABILTIES {
    #StructPack 8

    lResult : Int32

    ul64AnalogStandardsSupported : Int64

}
