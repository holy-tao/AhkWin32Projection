#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * The MBN_PROVIDER structure represents a network service provider.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_provider
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_PROVIDER {
    #StructPack 8

    /**
     * Contains the provider ID.  For GSM networks, this string is a concatenation of a 3-digit mobile country code (MCC) and a 2- or 3-digit mobile network code (MNC).  For CDMA networks, this string is a 5-digit SID.  The maximum length of this string is defined by <b>MBN_PROVIDERID_LEN</b> from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_provider_constants">MBN_PROVIDER_CONSTANTS</a>.  The caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    providerID : BSTR

    /**
     * Contains a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_provider_state">MBN_PROVIDER_STATE</a> values that represent the provider state.
     */
    providerState : UInt32

    /**
     * Contains the provider name.  The contents of this member should be ignored when setting the preferred provider list.  The maximum length of this string is defined by <b>MBN_PROVIDERNAME_LEN</b> from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_provider_constants">MBN_PROVIDER_CONSTANTS</a>.  The string can be empty.  The caller must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    providerName : BSTR

    /**
     * Contains a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_data_class">MBN_DATA_CLASS</a> values that indicate which data services are applicable or available for transfer.  This member should be ignored when queried for the home provider.
     */
    dataClass : UInt32

}
