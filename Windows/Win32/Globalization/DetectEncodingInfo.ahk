#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct DetectEncodingInfo {
    #StructPack 4

    nLangID : UInt32

    nCodePage : UInt32

    nDocPercent : Int32

    nConfidence : Int32

}
