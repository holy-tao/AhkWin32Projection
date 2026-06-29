#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_AMD_EXTENDED_REGISTERS {
    #StructPack 8

    IPID : Int64

    SYND : Int64

    CONFIG : Int64

    DESTAT : Int64

    DEADDR : Int64

    MISC1 : Int64

    MISC2 : Int64

    MISC3 : Int64

    MISC4 : Int64

    RasCap : Int64

    Reserved : Int64[14]

}
