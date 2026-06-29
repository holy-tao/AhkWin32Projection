#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct CO_ADDRESS_LIST {
    #StructPack 8

    NumberOfAddressesAvailable : UInt32

    NumberOfAddresses : UInt32

    AddressList : IntPtr

}
