#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The set of supported data rates.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_rate_set
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_RATE_SET extends Win32Struct
{
    static sizeof => 256

    static packingSize => 4

    /**
     * The length, in bytes, of <b>usRateSet</b>.
     * @type {Integer}
     */
    uRateSetLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of supported data transfer rates. DOT11_RATE_SET_MAX_LENGTH  is defined in windot11.h to have a value of 126.
     * 
     * Each supported data transfer rate is stored as a USHORT. The first bit of the USHORT specifies whether the rate is a basic rate. A <i>basic rate</i> is the data transfer rate that all stations in a basic service set (BSS) can use to receive frames from the wireless medium. If the rate is a basic rate, the first bit of the USHORT is set to 1.
     * 
     * To calculate the data transfer rate in Mbps for an arbitrary array entry rateSet[i], use the following equation:
     * 
     * <c>rate_in_mbps = (rateSet[i] &amp; 0x7FFF) * 0.5</c>
     * @type {Array<UInt16>}
     */
    usRateSet{
        get {
            if(!this.HasProp("__usRateSetProxyArray"))
                this.__usRateSetProxyArray := Win32FixedArray(this.ptr + 4, 126, Primitive, "ushort")
            return this.__usRateSetProxyArray
        }
    }
}
