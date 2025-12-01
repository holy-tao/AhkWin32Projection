#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about specific addresses that a host should listen on.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ns-wsdbase-wsd_config_addresses
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_CONFIG_ADDRESSES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wsdbase/nn-wsdbase-iwsdaddress">IWSDAddress</a> interfaces.
     * 
     * If <i>pszLocalId</i> contains a logical address, the resulting behavior is a mapping between the logical address and a specific set of physical addresses (instead of a mapping between the logical address and a default physical address).
     * @type {Pointer<IWSDAddress>}
     */
    addresses {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of items in the <b>addresses</b> array.
     * @type {Integer}
     */
    dwAddressCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
