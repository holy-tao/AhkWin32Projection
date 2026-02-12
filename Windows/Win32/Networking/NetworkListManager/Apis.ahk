#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\System\WinRT\Apis.ahk
#Include ..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NetworkListManager {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static NA_DomainAuthenticationFailed => "NA_DomainAuthenticationFailed"

    /**
     * @type {HSTRING}
     */
    static NA_NetworkClass => "NA_NetworkClass"

    /**
     * @type {HSTRING}
     */
    static NA_NameSetByPolicy => "NA_NameSetByPolicy"

    /**
     * @type {HSTRING}
     */
    static NA_IconSetByPolicy => "NA_IconSetByPolicy"

    /**
     * @type {HSTRING}
     */
    static NA_DescriptionSetByPolicy => "NA_DescriptionSetByPolicy"

    /**
     * @type {HSTRING}
     */
    static NA_CategorySetByPolicy => "NA_CategorySetByPolicy"

    /**
     * @type {HSTRING}
     */
    static NA_NameReadOnly => "NA_NameReadOnly"

    /**
     * @type {HSTRING}
     */
    static NA_IconReadOnly => "NA_IconReadOnly"

    /**
     * @type {HSTRING}
     */
    static NA_DescriptionReadOnly => "NA_DescriptionReadOnly"

    /**
     * @type {HSTRING}
     */
    static NA_CategoryReadOnly => "NA_CategoryReadOnly"

    /**
     * @type {HSTRING}
     */
    static NA_AllowMerge => "NA_AllowMerge"

    /**
     * @type {HSTRING}
     */
    static NA_InternetConnectivityV4 => "NA_InternetConnectivityV4"

    /**
     * @type {HSTRING}
     */
    static NA_InternetConnectivityV6 => "NA_InternetConnectivityV6"

    /**
     * @type {Integer (UInt32)}
     */
    static NLM_MAX_ADDRESS_LIST_SIZE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static NLM_UNKNOWN_DATAPLAN_STATUS => 4294967295
;@endregion Constants

;@region Methods
;@endregion Methods
}
