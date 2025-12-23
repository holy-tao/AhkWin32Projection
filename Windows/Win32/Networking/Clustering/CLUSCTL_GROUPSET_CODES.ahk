#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSCTL_GROUPSET_CODES enumeration (msclus.h) enumerates groupset control codes used by the ClusterGroupSetControl function.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusctl_groupset_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_GROUPSET_CODES extends Win32Enum{

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-common-properties">CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_COMMON_PROPERTIES => 134217817

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-ro-common-properties">CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_RO_COMMON_PROPERTIES => 134217813

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-set-common-properties">CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_SET_COMMON_PROPERTIES => 138412126

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-groups">CLUSCTL_GROUPSET_GET_GROUPS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_GROUPS => 134229361

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-groups">CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_PROVIDER_GROUPS => 134229365

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-collection-get-provider-collections">CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_PROVIDER_GROUPSETS => 134229369

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-groups">CLUSCTL_GROUP_GET_PROVIDER_GROUPS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_PROVIDER_GROUPS => 134229373

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-provider-collections">CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_PROVIDER_GROUPSETS => 134229377

    /**
     * See CLCTL_GET_ID.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUPSET_GET_ID => 134217785
}
