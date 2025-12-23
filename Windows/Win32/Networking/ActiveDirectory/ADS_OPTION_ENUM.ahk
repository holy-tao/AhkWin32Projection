#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the options that can be retrieved or set with the IADsObjectOptions.GetOption and IADsObjectOptions.SetOption methods.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_option_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_OPTION_ENUM extends Win32Enum{

    /**
     * Gets a <b>VT_BSTR</b> that contains the host name of the server for the current binding 
     *       to this object. This option is not supported by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsobjectoptions-setoption">IADsObjectOptions.SetOption</a> method.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_SERVERNAME => 0

    /**
     * Gets or sets a <b>VT_I4</b> value that indicates how referral chasing is performed in a 
     *       query. This option can contain one of  the 
     *       values defined by the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_chase_referrals_enum">ADS_CHASE_REFERRALS_ENUM</a> 
     *       enumeration.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_REFERRALS => 1

    /**
     * Gets or sets a <b>VT_I4</b> value that indicates the page size in a paged search.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_PAGE_SIZE => 2

    /**
     * Gets or sets a <b>VT_I4</b> value that controls the security descriptor data that can be 
     *       read on the object. This option can contain any combination of the values defined in the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_security_info_enum">ADS_SECURITY_INFO_ENUM</a> enumeration.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_SECURITY_MASK => 3

    /**
     * Gets a <b>VT_I4</b> value that determines if mutual authentication is performed by the 
     *       SSPI layer. If the returned option value contains the <b>ISC_RET_MUTUAL_AUTH</b> flag, 
     *       defined in Sspi.h, then mutual authentication has been performed. If the returned option value does not contain 
     *       the <b>ISC_RET_MUTUAL_AUTH</b> flag, then mutual authentication has not been performed. For 
     *       more information about mutual authentication, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/sspi">SSPI</a>. This 
     *       option is not supported by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsobjectoptions-setoption">IADsObjectOptions.SetOption</a> method.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_MUTUAL_AUTH_STATUS => 4

    /**
     * Enables the effective quota and used quota of a security principal to be read. This option takes a 
     *        <b>VT_BSTR</b> value that contains the security principal that the quotas can be read for. 
     *        If the security principal string is zero length or the  value is a <b>VT_EMPTY</b> value, 
     *        the security principal is the currently logged on user. This option is only supported by the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsobjectoptions-setoption">IADsObjectOptions.SetOption</a> method.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_QUOTA => 5

    /**
     * Retrieves or sets a <b>VT_I4</b> value that contains the port number that ADSI uses to 
     *        establish a connection when the password is set or changed. By default, ADSI uses port 636 to establish a 
     *        connection to set or change the password.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_PASSWORD_PORTNUMBER => 6

    /**
     * Retrieves or sets a <b>VT_I4</b> value that specifies the password encoding method. 
     *        This option can contain one of the values defined in the 
     *        <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_password_encoding_enum">ADS_PASSWORD_ENCODING_ENUM</a> 
     *        enumeration.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_PASSWORD_METHOD => 7

    /**
     * Contains  a <b>VT_BOOL</b> value that specifies if attribute value change operations 
     *          should be accumulated. By default, when an attribute value is modified more than one time, the previous value 
     *          change operation is overwritten by the more recent operation. If this option is set to 
     *          <b>VARIANT_TRUE</b>, each attribute value change operation is accumulated in the cache. 
     *          When the attribute value updates are committed to the server with the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-setinfo">IADs.SetInfo</a> method, each individual accumulated 
     *          operation is sent to the server.
     * 
     * When this option has been set to <b>VARIANT_TRUE</b>, it cannot be reset to 
     *          <b>VARIANT_FALSE</b> for the lifetime of the ADSI object. To reset this option, all 
     *          references to the ADSI object must be released and the object must be bound to again. When the object is bound 
     *          to again, this option will be set to <b>VARIANT_FALSE</b> by default.
     * 
     * This option only affects attribute values modified with the 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-putex">IADs.PutEx</a> and 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadspropertylist-putpropertyitem">IADsPropertyList.PutPropertyItem</a> 
     *          methods. This option is ignored by the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-put">IADs.Put</a> method.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_ACCUMULATIVE_MODIFICATION => 8

    /**
     * If this option is set on the object, no lookups will be performed (either during the retrieval or during 
     *        modification). This option affects the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iads">IADs</a> and 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspropertylist">IADsPropertyList</a> interfaces. It is also applicable 
     *        when retrieving the effective quota usage of a particular user.
     * @type {Integer (Int32)}
     */
    static ADS_OPTION_SKIP_SID_LOOKUP => 9
}
