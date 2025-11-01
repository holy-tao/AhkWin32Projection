#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method that enables the credential provider framework to determine whether you've made a customization to a field's option in a logon or credential UI.
 * @remarks
 * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * Implement this interface if your credential provider overrides the default field options through <a href="https://docs.microsoft.com/windows/desktop/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialevents2-setfieldoptions">ICredentialProviderCredentialEvents2::SetFieldOptions</a>. This enables the credential provider framework to determine the field options that you've specified .
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//credentialprovider/nn-credentialprovider-icredentialprovidercredentialwithfieldoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICredentialProviderCredentialWithFieldOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialProviderCredentialWithFieldOptions
     * @type {Guid}
     */
    static IID => Guid("{dbc6fb30-c843-49e3-a645-573e6f39446a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFieldOptions"]

    /**
     * 
     * @param {Integer} fieldID 
     * @param {Pointer<Integer>} options 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/credentialprovider/nf-credentialprovider-icredentialprovidercredentialwithfieldoptions-getfieldoptions
     */
    GetFieldOptions(fieldID, options) {
        result := ComCall(3, this, "uint", fieldID, "int*", options, "HRESULT")
        return result
    }
}
