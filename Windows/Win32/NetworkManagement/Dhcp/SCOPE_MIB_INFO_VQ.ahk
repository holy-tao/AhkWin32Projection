#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct SCOPE_MIB_INFO_VQ {
    #StructPack 4

    Subnet : UInt32

    NumAddressesInuse : UInt32

    NumAddressesFree : UInt32

    NumPendingOffers : UInt32

    QtnNumLeases : UInt32

    QtnPctQtnLeases : UInt32

    QtnProbationLeases : UInt32

    QtnNonQtnLeases : UInt32

    QtnExemptLeases : UInt32

    QtnCapableClients : UInt32

}
