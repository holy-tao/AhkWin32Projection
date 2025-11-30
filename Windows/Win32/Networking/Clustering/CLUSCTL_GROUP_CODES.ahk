#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates groupcontrol codes.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusctl_group_codes
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSCTL_GROUP_CODES extends Win32Enum{

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-unknown">CLUSCTL_GROUP_UNKNOWN</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_UNKNOWN => 50331648

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-characteristics">CLUSCTL_GROUP_GET_CHARACTERISTICS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_CHARACTERISTICS => 50331653

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-flags">CLUSCTL_GROUP_GET_FLAGS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_FLAGS => 50331657

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-name">CLUSCTL_GROUP_GET_NAME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_NAME => 50331689

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-id">CLUSCTL_GROUP_GET_ID</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_ID => 50331705

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-common-properties">CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES => 50331729

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-common-properties">CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES => 50331733

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-properties">CLUSCTL_GROUP_GET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_COMMON_PROPERTIES => 50331737

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-common-properties">CLUSCTL_GROUP_SET_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_SET_COMMON_PROPERTIES => 54526046

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-common-properties">CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES => 50331745

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-private-properties">CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES => 50331769

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-private-properties">CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES => 50331773

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-properties">CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES => 50331777

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-private-properties">CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES => 54526086

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-private-properties">CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES => 50331785

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-query-delete">CLUSCTL_GROUP_QUERY_DELETE</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_QUERY_DELETE => 50332089

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-property-fmts">CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS => 50331749

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-property-fmts">CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS => 50331789

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-failure-info">CLUSCTL_GROUP_GET_FAILURE_INFO</a>.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_FAILURE_INFO => 50331673

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-last-move-time">CLUSCTL_GROUP_GET_LAST_MOVE_TIME</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available until Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_GET_LAST_MOVE_TIME => 50332377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSCTL_GROUP_SET_CCF_FROM_MASTER => 54537606
}
