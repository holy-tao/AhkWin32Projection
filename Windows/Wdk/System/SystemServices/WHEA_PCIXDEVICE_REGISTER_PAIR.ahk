#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIXDEVICE_REGISTER_PAIR {
    #StructPack 8

    Register : Int64

    Data : Int64

}
