#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct AD_GUARANTEED {
    #StructPack 4

    CTotal : UInt32

    DTotal : UInt32

    CSum : UInt32

    DSum : UInt32

}
