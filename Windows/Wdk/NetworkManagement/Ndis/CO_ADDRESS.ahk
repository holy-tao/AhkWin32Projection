#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_ADDRESS {
    #StructPack 4

    AddressSize : UInt32

    Address : Int8[1]

}
