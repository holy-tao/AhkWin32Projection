#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\MBN_PROVIDER.ahk

/**
 * The MBN_PROVIDER2 structure represents a network service provider. It is used by many of the provider-specific methods of the IMbnMultiCarrier interface and provides an extension to MBN_PROVIDER to support multi-carrier.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ns-mbnapi-mbn_provider2
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PROVIDER2 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Contains a single-carrier <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure.
     * @type {MBN_PROVIDER}
     */
    provider{
        get {
            if(!this.HasProp("__provider"))
                this.__provider := MBN_PROVIDER(this.ptr + 0)
            return this.__provider
        }
    }

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> that specifies which cellular class the provider uses.
     * @type {Integer}
     */
    cellularClass {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Contains the signal quality received by the device as defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsignal-getsignalstrength">GetSignalStrength</a>.
     * @type {Integer}
     */
    signalStrength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Contains the signal error rate as defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsignal-getsignalerror">GetSignalError</a>.
     * @type {Integer}
     */
    signalError {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
