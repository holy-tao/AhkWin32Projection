#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of distribution point to retrieve information about when calling DRMGetIssuanceLicenseInfo.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drm_distribution_point_info
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_DISTRIBUTION_POINT_INFO{

    /**
     * Retrieves information about the default end-user license acquisition URL contained in the issuance license. Use this constant to retrieve information about the silent intranet URL. The following example shows a license acquisition URL.
 * 
 * ```xml
 * <DISTRIBUTIONPOINT>
 *   <OBJECT type="License-Acquisition-URL">
 *     <ID type="MS-GUID">
 *        {0045FD50-383B-43AA-90A4-ED013CD0CFE5}
 *     </ID>
 *     <NAME>Contoso Licensing Authority</NAME>
 *     <ADDRESS type="URL">
 *         http://Contoso.com/_wmcs/licensing
 *     </ADDRESS>
 *   </OBJECT>
 * </DISTRIBUTIONPOINT>
 * ```
     * @type {Integer (Int32)}
     */
    static DRM_DISTRIBUTION_POINT_LICENSE_ACQUISITION => 0

    /**
     * Retrieves information about the issuance license signing service URL contained in the issuance license. The following example shows a signing service URL.
 * 
 * ```xml
 * <DISTRIBUTIONPOINT>
 *   <OBJECT type="Publishing-URL">
 *     <ID type="MS-GUID">{9A23D98E-4449-4ba5-812A-F30808F3CB16}</ID> 
 *     <NAME>Publishing Point</NAME> 
 *     <ADDRESS type="URL">HTTP://petx64a526/_wmcs/licensing</ADDRESS> 
 *   </OBJECT>
 * </DISTRIBUTIONPOINT>
 * ```
     * @type {Integer (Int32)}
     */
    static DRM_DISTRIBUTION_POINT_PUBLISHING => 1

    /**
     * Retrieves information about the nonsilent end-user license acquisition URL in the issuance license.
 * 
 * >[!Note]
 * >Beginning with RMS 1.0 SP1, nonsilent license acquisition is no longer supported.
 * 
 * ```xml
 * <DISTRIBUTIONPOINT>
 *   <OBJECT type="Referral-Info">
 *     <ID type="MS-GUID">{81C42010-208A-4ABA-BAB6-C3C60F06DD5F}</ID>
 *     <NAME>Contoso Credit Card Splash Page</NAME>
 *     <ADDRESS type="URL">
 *        https://www.contoso.com/CreditCardOffers.htm
 *     </ADDRESS>
 *   </OBJECT>
 * </DISTRIBUTIONPOINT>
 * ```
     * @type {Integer (Int32)}
     */
    static DRM_DISTRIBUTION_POINT_REFERRAL_INFO => 2
}
