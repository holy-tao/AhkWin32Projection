#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICredentialProviderCredential.ahk

/**
 * Extends the ICredentialProviderCredential interface by adding a method that retrieves the security identifier (SID) of a user. The credential is associated with that user and can be grouped under the user's tile.
 * @remarks
 * 
  * This class is required for creating a V2 credential provider. V2 credential providers provide a personalized log on experience for the user. This occurs by the credential provider telling the Logon UI what sign in options are available for a user. It is recommended that new credential providers should be V2 credential providers. 
  * 
  * In order to create an <b>ICredentialProviderCredential2</b> instance, a valid SID needs to be returned by the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential2-getusersid">GetUserSid</a> function. Valid is defined by the returned SID being for one of the users currently enumerated by the Logon UI.
  * 
  * A useful tool for getting the available users and determining which ones you want to associate with is the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruserarray">ICredentialProviderUserArray</a> object. This object contains a list of <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruser">ICredentialProviderUser</a> objects that can be queried to gain information about the users that will be enumerated. For example you could gain the user's SID or username using <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruser-getstringvalue">GetStringValue</a> with a passed in parameter of <b>PKEY_Identity_PrimarySid</b> or <b>PKEY_Identity_USerName</b> respectively. You can even filter the results using <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovideruserarray-setproviderfilter">SetProviderFilter</a> to only display a subset of available users.
  * 
  * Using the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovideruserarray">ICredentialProviderUserArray</a> is optional, but it is a convenient way to get the necessary information to make valid SID values. In order to get a list of users that will be enumerated by the Logon UI, implement the <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nn-credentialprovider-icredentialprovidersetuserarray">ICredentialProviderSetUserArray</a> interface to get the <b>ICredentialProviderUserArray</b> object from <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidersetuserarray-setuserarray">SetUserArray</a>. Logon UI calls <b>SetUserArray</b> before <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovider-getcredentialcount">GetCredentialCount</a>, so the <b>ICredentialProviderUserArray</b> object is ready when a credential provider is about to return credentials.
  * 
  * A V2 credential provider  is represented by an icon displayed underneath the "Sign-in options" link. In order to provide an icon for your credential provider, define a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_TYPE</a> of  <b>CPFT_TILE_IMAGE</b> in the credential itself. Then make sure the <i>guidFieldType</i> of the  <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a> is set to <b>CPFG_CREDENTIAL_PROVIDER_LOGO</b>. The recommended size for an icon is 72 by 72 pixels.
  * 
  * Similar to specifying an icon for your credential provider, you can also specify a text string to identify your credential provider. This string appears in a pop-up window when a user hovers over the icon. To do this, define a <a href="https://docs.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_TYPE</a> of  <b>CPFT_SMALL_TEXT</b> in the credential itself. Then make sure the <i>guidFieldType</i> of the  <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor">CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR</a> is set to <b>CPFG_CREDENTIAL_PROVIDER_LABEL</b>. This string should supplement the credential provider icon described above and be descriptive enough that users understand what it is. For example, the picture password provider's description is "Picture Password".
  * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * Implement this interface to associate credential tiles with specific user tiles in the Logon UI.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidercredential2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredential2 extends ICredentialProviderCredential{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderCredential2
     * @type {Guid}
     */
    static IID => Guid("{fd672c54-40ea-4d6e-9b49-cfb1a7507bd7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserSid"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredential2-getusersid
     */
    GetUserSid() {
        result := ComCall(20, this, "ptr*", &sid := 0, "HRESULT")
        return sid
    }
}
