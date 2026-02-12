#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProvisionFromXmlDocumentResults.ahk
#Include ..\..\..\Guid.ahk

/**
 * The results object returned to the application when the provisioning operation has completed.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionfromxmldocumentresults
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ProvisionFromXmlDocumentResults extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProvisionFromXmlDocumentResults

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProvisionFromXmlDocumentResults.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Determines whether all elements specified in the provisioning XML were applied.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionfromxmldocumentresults.allelementsprovisioned
     * @type {Boolean} 
     */
    AllElementsProvisioned {
        get => this.get_AllElementsProvisioned()
    }

    /**
     * Indicates which elements in the provisioning profile could not be successfully provisioned.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * Calling ProvisionResultsXml when no provisioning file has been submitted will result in an error. When the file was submitted, but not processed due to signature issues, only the [Signature](/uwp/schemas/mobilebroadbandschema/resultsschema/element-signature) element of [ResultsSchema](/uwp/schemas/mobilebroadbandschema/resultsschema/schema-root) will be present. If [ProvisionFromXmlDocumentAsync](provisioningagent_provisionfromxmldocumentasync_1872273253.md) returned an error, [ResultsSchema](/uwp/schemas/mobilebroadbandschema/resultsschema/schema-root) will indicate “Failure” at the file level in the [CarrierProvisioningResult](/uwp/schemas/mobilebroadbandschema/resultsschema/element-carrierprovisioningresult) element, with the error code specified. If the file was valid, but errors occurred while acting on it, [ResultsSchema](/uwp/schemas/mobilebroadbandschema/resultsschema/schema-root) will coalesce errors, listing the error code at the highest level at which it applies to all sections underneath. If errors are coalesced to a higher level, the lower levels are not included. For example, if all WLAN profiles failed for the same reason, this reason will be shown as an attribute of the [WLANProfiles](/uwp/schemas/mobilebroadbandschema/resultsschema/element-wlanprofiles) node. If different profiles failed for different reasons, then each profile will be enumerated and indicate success or failure with the error code specified. In cases where multiple adapters are present, a success on any adapter should be represented as success, even if the profile failed to apply to other adapters. If a profile failed to apply to all adapters, [ResultsSchema](/uwp/schemas/mobilebroadbandschema/resultsschema/schema-root) will contain at least one of the error codes, but will not enumerate all errors which occurred on various adapters.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionfromxmldocumentresults.provisionresultsxml
     * @type {HSTRING} 
     */
    ProvisionResultsXml {
        get => this.get_ProvisionResultsXml()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllElementsProvisioned() {
        if (!this.HasProp("__IProvisionFromXmlDocumentResults")) {
            if ((queryResult := this.QueryInterface(IProvisionFromXmlDocumentResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisionFromXmlDocumentResults := IProvisionFromXmlDocumentResults(outPtr)
        }

        return this.__IProvisionFromXmlDocumentResults.get_AllElementsProvisioned()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProvisionResultsXml() {
        if (!this.HasProp("__IProvisionFromXmlDocumentResults")) {
            if ((queryResult := this.QueryInterface(IProvisionFromXmlDocumentResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisionFromXmlDocumentResults := IProvisionFromXmlDocumentResults(outPtr)
        }

        return this.__IProvisionFromXmlDocumentResults.get_ProvisionResultsXml()
    }

;@endregion Instance Methods
}
