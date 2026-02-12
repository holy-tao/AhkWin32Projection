#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProvisioningAgent.ahk
#Include .\IProvisioningAgentStaticMethods.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an agent that provisions connectivity and subscription information with a network provider.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisioningagent
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ProvisioningAgent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProvisioningAgent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProvisioningAgent.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a provisioning agent for the mobile device associated with the supplied network account ID.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {HSTRING} networkAccountId The network account ID to use to select the corresponding mobile broadband device to use for the provisioning agent.
     * @returns {ProvisioningAgent} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisioningagent.createfromnetworkaccountid
     */
    static CreateFromNetworkAccountId(networkAccountId) {
        if (!ProvisioningAgent.HasProp("__IProvisioningAgentStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ProvisioningAgent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProvisioningAgentStaticMethods.IID)
            ProvisioningAgent.__IProvisioningAgentStaticMethods := IProvisioningAgentStaticMethods(factoryPtr)
        }

        return ProvisioningAgent.__IProvisioningAgentStaticMethods.CreateFromNetworkAccountId(networkAccountId)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Creates a new instance of a [ProvisioningAgent](provisioningagent.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.ProvisioningAgent")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Provisions a device for network connectivity asynchronously, based on the supplied XML document.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * You can retrieve the results of the provisioning attempt using the [ProvisionResultsXml](provisionfromxmldocumentresults_provisionresultsxml.md) method when the provisioning attempt has completed.
     * 
     * ProvisionFromXmlDocumentAsync returns critical errors as HRESULTs that are then translated into exceptions. The most common HRESULTs returned are listed below:<table>
     *    <tr><th>Name</th><th>HRESULT</th><th>Description</th></tr>
     *    <tr><td>E_ACCESSDENIED</td><td>0x80070005L</td><td>Caller is an operator app, but attempted to provision a different operator’s profiles</td></tr>
     *    <tr><td>PROVCORE_E_XML_MALFORMED</td><td>0x82170001</td><td>Provisioning file is not well-formed XML</td></tr>
     *    <tr><td>PROVCORE_E_XML_INVALID</td><td>0x82170002</td><td>Provisioning file does not conform to schema</td></tr>
     *    <tr><td>PROVCORE_E_XML_SIGNATURE_INVALID</td><td>0x82170003</td><td>Provisioning file signature is invalid</td></tr>
     *    <tr><td>PROVCORE_E_XML_SIGNATURE_UNTRUSTED</td><td>0x82170004</td><td>Signing certificate is not chained to a trusted root CA</td></tr>
     *    <tr><td>PROVCORE_E_XML_DIGEST_INVALID</td><td>0x82170005</td><td>Provisioning file was modified after being signed</td></tr>
     *    <tr><td>PROVCORE_E_XML_SIGNER_UNTRUSTED</td><td>0x82170006</td><td>User did not approve provisioning from this certificate.</td></tr>
     *    <tr><td>PROVCORE_E_NO_LEAF_CERT</td><td>0x82170007</td><td>No leaf certificate was included in XML signature</td></tr>
     *    <tr><td>PROVCORE_E_SIGNING_CERTIFICATE_INVALID_FOR_SIGNING</td><td>0x8217000D</td><td>Signing certificate does not meet requirements (Extended Validation, digital signature usage)</td></tr>
     *    <tr><td>PROVCORE_E_XML_MISSING_SIGNATURE</td><td>0x8217000E</td><td>XML was not signed (and caller was not a mobile broadband operator app)</td></tr>
     * </table>
     * @param {HSTRING} provisioningXmlDocument An instance of [CarrierControlSchema](/uwp/schemas/mobilebroadbandschema/carriercontrolschema/schema-root) that contains the network connectivity provisioning information.
     * @returns {IAsyncOperation<ProvisionFromXmlDocumentResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisioningagent.provisionfromxmldocumentasync
     */
    ProvisionFromXmlDocumentAsync(provisioningXmlDocument) {
        if (!this.HasProp("__IProvisioningAgent")) {
            if ((queryResult := this.QueryInterface(IProvisioningAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisioningAgent := IProvisioningAgent(outPtr)
        }

        return this.__IProvisioningAgent.ProvisionFromXmlDocumentAsync(provisioningXmlDocument)
    }

    /**
     * Retrieves cost and plan information associated with the mobile broadband profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {Integer} mediaType_ The media type that the profile belongs to.
     * @param {HSTRING} profileName The name of the profile that the cost will be applied to.
     * @returns {ProvisionedProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisioningagent.getprovisionedprofile
     */
    GetProvisionedProfile(mediaType_, profileName) {
        if (!this.HasProp("__IProvisioningAgent")) {
            if ((queryResult := this.QueryInterface(IProvisioningAgent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisioningAgent := IProvisioningAgent(outPtr)
        }

        return this.__IProvisioningAgent.GetProvisionedProfile(mediaType_, profileName)
    }

;@endregion Instance Methods
}
