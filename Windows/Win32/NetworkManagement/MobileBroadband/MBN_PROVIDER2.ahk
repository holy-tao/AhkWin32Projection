#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MBN_PROVIDER.ahk" { MBN_PROVIDER }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MBN_CELLULAR_CLASS.ahk" { MBN_CELLULAR_CLASS }

/**
 * The MBN_PROVIDER2 structure represents a network service provider. It is used by many of the provider-specific methods of the IMbnMultiCarrier interface and provides an extension to MBN_PROVIDER to support multi-carrier.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_provider2
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PROVIDER2 {
    #StructPack 8

    /**
     * Contains a single-carrier <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_provider">MBN_PROVIDER</a> structure.
     */
    provider : MBN_PROVIDER

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_cellular_class">MBN_CELLULAR_CLASS</a> that specifies which cellular class the provider uses.
     */
    cellularClass : MBN_CELLULAR_CLASS

    /**
     * Contains the signal quality received by the device as defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsignal-getsignalstrength">GetSignalStrength</a>.
     */
    signalStrength : UInt32

    /**
     * Contains the signal error rate as defined by <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsignal-getsignalerror">GetSignalError</a>.
     */
    signalError : UInt32

}
