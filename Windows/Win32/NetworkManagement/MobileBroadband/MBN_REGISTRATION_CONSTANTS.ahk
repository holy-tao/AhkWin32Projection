#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_REGISTRATION_CONSTANTS enumerated type contains specific values used by IMbnRegistration interface operations.
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_registration_constants
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_REGISTRATION_CONSTANTS extends Win32Enum{

    /**
     * The maximum string size of the <i>roamingText</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistration-getroamingtext">GetRoamingText</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface.
     * @type {Integer (Int32)}
     */
    static MBN_ROAMTEXT_LEN => 64

    /**
     * Indicates an unknown provider ID in the <i>providerID</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnregistration-getproviderid">GetProviderID</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnregistration">IMbnRegistration</a> interface.
     * @type {Integer (Int32)}
     */
    static MBN_CDMA_DEFAULT_PROVIDER_ID => 0
}
