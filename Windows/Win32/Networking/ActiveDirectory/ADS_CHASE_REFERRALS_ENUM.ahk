#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_CHASE_REFERRALS_ENUM enumeration specifies if, and how, referral chasing occurs.
 * @remarks
 * 
 * Use the constants of this enumeration to set up search preferences for referral chasing. The action amounts to assigning the appropriate fields of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_searchpref_info">ADS_SEARCHPREF_INFO</a> structure with elements of the <b>ADS_CHASE_REFERRALS_ENUM</b> and  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_searchpref_enum">ADS_SEARCHPREF_ENUM</a> enumerations. The values of this enumeration can also be used with  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsobjectoptions">IADsObjectOptions</a> to specify whether referral chasing should take place when enumerating the objects under a container object.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsnametranslate">IADsNameTranslate</a> interface has a partial implementation of <b>ADS_CHASE_REFERRALS_ENUM</b> through the <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsnametranslate-property-methods">ChaseReferral</a> property. If the <b>ChaseReferral</b> property is set to zero (0), it is the same as specifying <b>ADS_CHASE_REFERRALS_NEVER</b> (0). If a nonzero value is used, it is the same as specifying <b>ADS_CHASE_REFERRALS_ALWAYS</b> (0x60). <b>IADsNameTranslate</b> does not implement the <b>ADS_CHASE_REFERRALS_SUBORDINATE</b> (0x20) or <b>ADS_CHASE_REFERRALS_EXTERNAL</b> (0x40) options.
 * 
 * The ADSI LDAP provider supports external referrals for paged searches, but does not support subordinate referrals during paging.
 * 
 * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numerical constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should make explicit declarations of such constants, as done here, in your VBScript applications.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_chase_referrals_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_CHASE_REFERRALS_ENUM{

    /**
     * The client should never chase the referred-to server. Setting this option prevents a client from contacting other servers in a referral process.
     * @type {Integer (Int32)}
     */
    static ADS_CHASE_REFERRALS_NEVER => 0

    /**
     * The client chases only subordinate referrals which are a subordinate naming context in a directory tree. For example, if the base search is requested for "DC=Fabrikam,DC=Com", and the server returns a result set and a referral of "DC=Sales,DC=Fabrikam,DC=Com" on the AdbSales server, the client can contact the AdbSales server to continue the search. The ADSI LDAP provider always turns off this flag for paged searches.
     * @type {Integer (Int32)}
     */
    static ADS_CHASE_REFERRALS_SUBORDINATE => 32

    /**
     * The client chases external referrals. For example, a client requests server A to perform a search for "DC=Fabrikam,DC=Com". However, server A does not contain the object, but knows that an independent server, B, owns it. It then refers the client to server B.
     * @type {Integer (Int32)}
     */
    static ADS_CHASE_REFERRALS_EXTERNAL => 64

    /**
     * Referrals are chased for either the subordinate or external type.
     * @type {Integer (Int32)}
     */
    static ADS_CHASE_REFERRALS_ALWAYS => 96
}
