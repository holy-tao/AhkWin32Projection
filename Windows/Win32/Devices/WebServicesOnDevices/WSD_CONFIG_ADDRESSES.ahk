#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IWSDAddress.ahk" { IWSDAddress }

/**
 * Information about specific addresses that a host should listen on.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ns-wsdbase-wsd_config_addresses
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_CONFIG_ADDRESSES {
    #StructPack 8

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interfaces.
     * 
     * If <i>pszLocalId</i> contains a logical address, the resulting behavior is a mapping between the logical address and a specific set of physical addresses (instead of a mapping between the logical address and a default physical address).
     */
    addresses : IWSDAddress.Ptr

    /**
     * The number of items in the <b>addresses</b> array.
     */
    dwAddressCount : UInt32

}
