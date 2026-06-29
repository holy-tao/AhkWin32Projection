#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_SPECIFIC_PARAMETERS {
    #StructPack 4

    ParamType : UInt32

    Length : UInt32

    Parameters : Int8[1]

}
