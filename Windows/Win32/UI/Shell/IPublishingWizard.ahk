#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWizardExtension.ahk

/**
 * Exposes methods for working with the Online Print Wizard, the Web Publishing Wizard, and the Add Network Place Wizard. In Windows Vista, IPublishingWizard no longer supports the Web Publishing Wizard or Online Print Wizard.
 * @remarks
 * 
 * The Online Print Wizard is a wizard for ordering prints of photos online. The use of <b>IPublishingWizard</b> to work with the Online Print Wizard is no longer supported in Windows Vista.
 * 
 * The Add Network Place Wizard allows the user to create a shortcut to network resources in My Network Places (in Windows XP) or Computer (in Windows Vista).
 * 
 * The Windows Shell supplies a <a href="https://docs.microsoft.com/windows/desktop/shell/scriptable-shell-objects-roadmap">Publishing Wizard object</a> that implements <b>IPublishingWizard</b> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-iwizardextension">IWizardExtension</a>. The methods of <b>IPublishingWizard</b> are used to initialize the type of the wizard, set certain attributes of the wizard, and retrieve a transfer manifest. The methods of <b>IWizardExtension</b> are used to retrieve the extension pages that make up the body of the selected wizard. To instantiate the <b>Publishing Wizard object</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> and use the class identifier (CLSID) CLSID_PublishingWizard and IID_IPublishingWizard as the REFIID.
 * 
 * 
 * ```cpp
 * IPublishingWizard *pPublish = NULL;
 * 
 * HRESULT hr = CoCreateInstance(CLSID_PublishingWizard, 
 *                               NULL,
 *                               CLSCTX_INPROC_SERVER, 
 *                               IID_IPublishingWizard, 
 *                               (LPVOID*)&pPublish);
 * 
 * ```
 * 
 * 
 * Once the <a href="https://docs.microsoft.com/windows/desktop/shell/scriptable-shell-objects-roadmap">Publishing Wizard object</a> has been instantiated, call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ipublishingwizard-initialize">IPublishingWizard::Initialize</a> to initialize the <b>Publishing Wizard object</b>.
 * 
 * <div class="alert"><b>Note</b>  The examples below will not work on Windows Vista since the <b>IPublishingWizard</b> methods no longer support the Online Printing Wizard in Windows Vista.</div>
 * <div> </div>
 * 
 * ```cpp
 * // Initializing the Online Print Wizard
 *                     
 * hr = pPublish->Initialize(pDataObject,
 *                           SHPWHF_NOFILESELECTOR,
 *                           L"InternetPhotoPrinting");
 *                           
 * // pDataObject: A data object that represents files or folders to transfer.
 * // SHPWHF_NOFILESELECTOR: This flag must be set.
 * // L"InternetPhotoPrinting": Display the Online Print Wizard.
 * 
 * ```
 * 
 * 
 * Note that <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ipublishingwizard-initialize">IPublishingWizard::Initialize</a> does not actually display the wizard. In order to display the Online Print Wizard, you must create a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure and then modify its <i>phpage</i> member to include the array of <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetpagea_v2">PROPSHEETPAGE</a> handles returned by <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iwizardextension-addpages">IWizardExtension::AddPages</a>. <b>IWizardExtension::AddPages</b> is implemented by the same <a href="https://docs.microsoft.com/windows/desktop/shell/scriptable-shell-objects-roadmap">Publishing Wizard object</a> that implements <b>IPublishingWizard</b>.
 * 
 * If displaying the Online Print Wizard, the PSH_NOMARGIN flag should be set in the <i>dwFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure that contains the extension pages.
 * 
 * In addition to the extension pages retrieved from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-iwizardextension-addpages">IWizardExtension::AddPages</a>, the <i>phpage</i> array should include a start page, a cancel page, and a finish page, provided by your application. When the user backs out of or cancels the extension, or when the extension finishes displaying its pages, the extension then communicates to the wizard that it must navigate out of the stack of extension pages to one of these application-provided pages. Your application must supply an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-iwizardsite">IWizardSite</a> that handles this communication. The <b>IPublishingWizard</b> object's site must be set to your <b>IWizardSite</b> implementation. The <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iunknown_setsite">IUnknown_SetSite</a> function can be used to set the site. Once your application has specified the wizard settings using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ipublishingwizard-initialize">IPublishingWizard::Initialize</a>, properly populated the <i>phpage</i> member of a <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure, and set the site to an implementation of <b>IWizardSite</b>, the wizard may be displayed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/prsht/nf-prsht-propertysheeta">PropertySheet</a> function.
 * 
 * 
 * ```cpp
 * // This is example code demonstrating how to populate a PROPSHEETHEADER
 * structure and use it to display the Online Print Wizard.
 * This sample assumes that the PublishingWizard object has already
 * been instantiated and initialized elsewhere in the application. 
 * 
 * // Define the number of wizard pages that we expect to get from 
 * // the Publishing Wizard object. 
 * // The Online Print Wizard provides 6 predefined pages in Windows Vista,
 * // but provided 9 in Windows XP. 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ipublishingwizard
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPublishingWizard extends IWizardExtension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPublishingWizard
     * @type {Guid}
     */
    static IID => Guid("{aa9198bb-ccec-472d-beed-19a4f6733f7a}")

    /**
     * The class identifier for PublishingWizard
     * @type {Guid}
     */
    static CLSID => Guid("{6b33163c-76a5-4b6c-bf21-45de9cd503a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetTransferManifest"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDataObject} pdo 
     * @param {Integer} dwOptions 
     * @param {PWSTR} pszServiceScope 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pdo, dwOptions, pszServiceScope) {
        pszServiceScope := pszServiceScope is String ? StrPtr(pszServiceScope) : pszServiceScope

        result := ComCall(6, this, "ptr", pdo, "uint", dwOptions, "ptr", pszServiceScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrFromTransfer 
     * @param {Pointer<IXMLDOMDocument>} pdocManifest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ipublishingwizard-gettransfermanifest
     */
    GetTransferManifest(phrFromTransfer, pdocManifest) {
        phrFromTransferMarshal := phrFromTransfer is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, phrFromTransferMarshal, phrFromTransfer, "ptr*", pdocManifest, "HRESULT")
        return result
    }
}
