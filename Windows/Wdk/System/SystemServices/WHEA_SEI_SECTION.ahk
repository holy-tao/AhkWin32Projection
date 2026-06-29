#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_SEI_SECTION {
    #StructPack 8

    Esr : UInt32

    Far : Int64

}
