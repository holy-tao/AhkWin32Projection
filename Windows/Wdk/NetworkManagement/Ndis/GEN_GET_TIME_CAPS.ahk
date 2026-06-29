#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct GEN_GET_TIME_CAPS {
    #StructPack 4

    Flags : UInt32

    ClockPrecision : UInt32

}
