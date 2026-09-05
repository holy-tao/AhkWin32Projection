#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSCTL_GROUP_CODES enumeration (msclus.h) enumerates group control codes.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusctl_group_codes
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSCTL_GROUP_CODES extends Win32Enum {

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-unknown">CLUSCTL_GROUP_UNKNOWN</a>.
     * Native name: CLUSCTL_GROUP_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 50331648

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-characteristics">CLUSCTL_GROUP_GET_CHARACTERISTICS</a>.
     * Native name: CLUSCTL_GROUP_GET_CHARACTERISTICS
     * @type {Integer (Int32)}
     */
    static GET_CHARACTERISTICS => 50331653

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-flags">CLUSCTL_GROUP_GET_FLAGS</a>.
     * Native name: CLUSCTL_GROUP_GET_FLAGS
     * @type {Integer (Int32)}
     */
    static GET_FLAGS => 50331657

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-name">CLUSCTL_GROUP_GET_NAME</a>.
     * Native name: CLUSCTL_GROUP_GET_NAME
     * @type {Integer (Int32)}
     */
    static GET_NAME => 50331689

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-id">CLUSCTL_GROUP_GET_ID</a>.
     * Native name: CLUSCTL_GROUP_GET_ID
     * @type {Integer (Int32)}
     */
    static GET_ID => 50331705

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-common-properties">CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_ENUM_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_COMMON_PROPERTIES => 50331729

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-common-properties">CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_GET_RO_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_COMMON_PROPERTIES => 50331733

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-properties">CLUSCTL_GROUP_GET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_GET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTIES => 50331737

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-common-properties">CLUSCTL_GROUP_SET_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_SET_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_COMMON_PROPERTIES => 54526046

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-common-properties">CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_VALIDATE_COMMON_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_COMMON_PROPERTIES => 50331745

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-enum-private-properties">CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_ENUM_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static ENUM_PRIVATE_PROPERTIES => 50331769

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-ro-private-properties">CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_GET_RO_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_RO_PRIVATE_PROPERTIES => 50331773

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-properties">CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_GET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTIES => 50331777

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-set-private-properties">CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_SET_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static SET_PRIVATE_PROPERTIES => 54526086

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-validate-private-properties">CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES</a>.
     * Native name: CLUSCTL_GROUP_VALIDATE_PRIVATE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static VALIDATE_PRIVATE_PROPERTIES => 50331785

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-query-delete">CLUSCTL_GROUP_QUERY_DELETE</a>.
     * Native name: CLUSCTL_GROUP_QUERY_DELETE
     * @type {Integer (Int32)}
     */
    static QUERY_DELETE => 50332089

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-common-property-fmts">CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_GROUP_GET_COMMON_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_COMMON_PROPERTY_FMTS => 50331749

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-private-property-fmts">CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS</a>.
     * Native name: CLUSCTL_GROUP_GET_PRIVATE_PROPERTY_FMTS
     * @type {Integer (Int32)}
     */
    static GET_PRIVATE_PROPERTY_FMTS => 50331789

    /**
     * See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-failure-info">CLUSCTL_GROUP_GET_FAILURE_INFO</a>.
     * Native name: CLUSCTL_GROUP_GET_FAILURE_INFO
     * @type {Integer (Int32)}
     */
    static GET_FAILURE_INFO => 50331673

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/clusctl-group-get-last-move-time">CLUSCTL_GROUP_GET_LAST_MOVE_TIME</a>.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This control code is not available until Windows Server 2016.
     * Native name: CLUSCTL_GROUP_GET_LAST_MOVE_TIME
     * @type {Integer (Int32)}
     */
    static GET_LAST_MOVE_TIME => 50332377

    /**
     * Native name: CLUSCTL_GROUP_SET_CCF_FROM_MASTER
     * @type {Integer (Int32)}
     */
    static SET_CCF_FROM_MASTER => 54537606
}
