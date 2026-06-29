#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCESVC_INFO_TYPE enumeration is used by PFSCE_QUERY_INFO and PFSCE_SET_INFO to indicate the type of information requested from or passed to the security database. It can be one of the following values.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ne-scesvc-scesvc_info_type
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The data is configuration information.
     * @type {Integer (Int32)}
     */
    static SceSvcConfigurationInfo => 0

    /**
     * The data is merged policy information.
     * @type {Integer (Int32)}
     */
    static SceSvcMergedPolicyInfo => 1

    /**
     * The data is analysis information.
     * @type {Integer (Int32)}
     */
    static SceSvcAnalysisInfo => 2

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static SceSvcInternalUse => 3
}
