#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateCollection.ahk
#Include .\ICategoryCollection.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IUpdateIdentity.ahk
#Include .\IImageInformation.ahk
#Include .\IInstallationBehavior.ahk
#Include .\IStringCollection.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include .\IUpdateDownloadContentCollection.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @remarks
 * 
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_bundledupdates">BundledUpdates</a> property contains an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatecollection">IUpdateCollection</a>, some properties and methods of the update may only be available on the bundled updates, for example, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_downloadcontents">DownloadContents</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-copyfromcache">CopyFromCache</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdate
     * @type {Guid}
     */
    static IID => Guid("{6a92b07a-d821-4682-b423-5c805022cc4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Title", "get_AutoSelectOnWebSites", "get_BundledUpdates", "get_CanRequireSource", "get_Categories", "get_Deadline", "get_DeltaCompressedContentAvailable", "get_DeltaCompressedContentPreferred", "get_Description", "get_EulaAccepted", "get_EulaText", "get_HandlerID", "get_Identity", "get_Image", "get_InstallationBehavior", "get_IsBeta", "get_IsDownloaded", "get_IsHidden", "put_IsHidden", "get_IsInstalled", "get_IsMandatory", "get_IsUninstallable", "get_Languages", "get_LastDeploymentChangeTime", "get_MaxDownloadSize", "get_MinDownloadSize", "get_MoreInfoUrls", "get_MsrcSeverity", "get_RecommendedCpuSpeed", "get_RecommendedHardDiskSpace", "get_RecommendedMemory", "get_ReleaseNotes", "get_SecurityBulletinIDs", "get_SupersededUpdateIDs", "get_SupportUrl", "get_Type", "get_UninstallationNotes", "get_UninstallationBehavior", "get_UninstallationSteps", "get_KBArticleIDs", "AcceptEula", "get_DeploymentAction", "CopyFromCache", "get_DownloadPriority", "get_DownloadContents"]

    /**
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoSelectOnWebSites {
        get => this.get_AutoSelectOnWebSites()
    }

    /**
     * @type {IUpdateCollection} 
     */
    BundledUpdates {
        get => this.get_BundledUpdates()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    CanRequireSource {
        get => this.get_CanRequireSource()
    }

    /**
     * @type {ICategoryCollection} 
     */
    Categories {
        get => this.get_Categories()
    }

    /**
     * @type {VARIANT} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DeltaCompressedContentAvailable {
        get => this.get_DeltaCompressedContentAvailable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DeltaCompressedContentPreferred {
        get => this.get_DeltaCompressedContentPreferred()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EulaAccepted {
        get => this.get_EulaAccepted()
    }

    /**
     * @type {BSTR} 
     */
    EulaText {
        get => this.get_EulaText()
    }

    /**
     * @type {BSTR} 
     */
    HandlerID {
        get => this.get_HandlerID()
    }

    /**
     * @type {IUpdateIdentity} 
     */
    Identity {
        get => this.get_Identity()
    }

    /**
     * @type {IImageInformation} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * @type {IInstallationBehavior} 
     */
    InstallationBehavior {
        get => this.get_InstallationBehavior()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsBeta {
        get => this.get_IsBeta()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsDownloaded {
        get => this.get_IsDownloaded()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsHidden {
        get => this.get_IsHidden()
        set => this.put_IsHidden(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsInstalled {
        get => this.get_IsInstalled()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsMandatory {
        get => this.get_IsMandatory()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsUninstallable {
        get => this.get_IsUninstallable()
    }

    /**
     * @type {IStringCollection} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {Float} 
     */
    LastDeploymentChangeTime {
        get => this.get_LastDeploymentChangeTime()
    }

    /**
     * @type {DECIMAL} 
     */
    MaxDownloadSize {
        get => this.get_MaxDownloadSize()
    }

    /**
     * @type {DECIMAL} 
     */
    MinDownloadSize {
        get => this.get_MinDownloadSize()
    }

    /**
     * @type {IStringCollection} 
     */
    MoreInfoUrls {
        get => this.get_MoreInfoUrls()
    }

    /**
     * @type {BSTR} 
     */
    MsrcSeverity {
        get => this.get_MsrcSeverity()
    }

    /**
     * @type {Integer} 
     */
    RecommendedCpuSpeed {
        get => this.get_RecommendedCpuSpeed()
    }

    /**
     * @type {Integer} 
     */
    RecommendedHardDiskSpace {
        get => this.get_RecommendedHardDiskSpace()
    }

    /**
     * @type {Integer} 
     */
    RecommendedMemory {
        get => this.get_RecommendedMemory()
    }

    /**
     * @type {BSTR} 
     */
    ReleaseNotes {
        get => this.get_ReleaseNotes()
    }

    /**
     * @type {IStringCollection} 
     */
    SecurityBulletinIDs {
        get => this.get_SecurityBulletinIDs()
    }

    /**
     * @type {IStringCollection} 
     */
    SupersededUpdateIDs {
        get => this.get_SupersededUpdateIDs()
    }

    /**
     * @type {BSTR} 
     */
    SupportUrl {
        get => this.get_SupportUrl()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    UninstallationNotes {
        get => this.get_UninstallationNotes()
    }

    /**
     * @type {IInstallationBehavior} 
     */
    UninstallationBehavior {
        get => this.get_UninstallationBehavior()
    }

    /**
     * @type {IStringCollection} 
     */
    UninstallationSteps {
        get => this.get_UninstallationSteps()
    }

    /**
     * @type {IStringCollection} 
     */
    KBArticleIDs {
        get => this.get_KBArticleIDs()
    }

    /**
     * @type {Integer} 
     */
    DeploymentAction {
        get => this.get_DeploymentAction()
    }

    /**
     * @type {Integer} 
     */
    DownloadPriority {
        get => this.get_DownloadPriority()
    }

    /**
     * @type {IUpdateDownloadContentCollection} 
     */
    DownloadContents {
        get => this.get_DownloadContents()
    }

    /**
     * Gets the localized title of the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_title
     */
    get_Title() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the update is flagged to be automatically selected by Windows Update.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_autoselectonwebsites
     */
    get_AutoSelectOnWebSites() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains information about the ordered list of the bundled updates for the update.
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_bundledupdates
     */
    get_BundledUpdates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets a Boolean value that indicates whether the source media of the update is required for installation or uninstallation.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_canrequiresource
     */
    get_CanRequireSource() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a collection of categories to which the update belongs.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that  this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that was used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is  not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * Because there is a <b>Categories</b> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> and a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a>, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depend on the WUA object that owns the <b>ICategory</b> interface. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdate</b>, it follows the localization rules of <b>IUpdate</b>. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdateHistoryEntry2</b>, it follows the localization rules of <b>IUpdateHistoryEntry2</b>.
     * 
     * 
     * @returns {ICategoryCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_categories
     */
    get_Categories() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * Gets the date by which the update must be installed.
     * @remarks
     * 
     * In COM, if the update has a deadline, the return value is of type VT_DATE and contains a DATE value that specifies the deadline. Otherwise, the return value is of type VT_EMPTY.
     * 
     * In the Microsoft .NET Framework, the return value is <b>NULL</b> if the update has no deadline.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_deadline
     */
    get_Deadline() {
        retval := VARIANT()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether delta-compressed content is available on a server for the update.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_deltacompressedcontentavailable
     */
    get_DeltaCompressedContentAvailable() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether to prefer delta-compressed content during the download and install or uninstall of the update if delta-compressed content is available.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_deltacompressedcontentpreferred
     */
    get_DeltaCompressedContentPreferred() {
        result := ComCall(14, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the localized description of the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the Microsoft Software License Terms that are associated with the update are accepted for the computer.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_eulaaccepted
     */
    get_EulaAccepted() {
        result := ComCall(16, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the full localized text of the Microsoft Software License Terms that are associated with the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_eulatext
     */
    get_EulaText() {
        retval := BSTR()
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the install handler of the update.
     * @remarks
     * 
     * The valid values for the <b>HandlerID</b> property include the following:
     * 
     * <ul>
     * <li>The Command Line Installation Handlerhttp://schemas.microsoft.com/msus/2002/12/UpdateHandlers/CommandLineInstallation
     * 
     * </li>
     * <li>The Inf Based Installation Handlerhttp://schemas.microsoft.com/msus/2002/12/UpdateHandlers/InfBasedInstallation
     * 
     * </li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/Msi/windows-installer-portal">Windows Installer</a> Installation Handlerhttp://schemas.microsoft.com/msus/2002/12/UpdateHandlers/WindowsInstaller
     * 
     * </li>
     * <li>The Package Installer for Microsoft Windows Operating Systems and Windows Components (update.exe) Installation Handlerhttp://schemas.microsoft.com/msus/2002/12/UpdateHandlers/WindowsPatch
     * 
     * </li>
     * <li>The Component Based Servicing (CBS) Handlerhttp://schemas.microsoft.com/msus/2002/12/UpdateHandlers/Cbs
     * 
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_handlerid
     */
    get_HandlerID() {
        retval := BSTR()
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the unique identifier of the update.
     * @returns {IUpdateIdentity} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_identity
     */
    get_Identity() {
        result := ComCall(19, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * Gets an interface that contains information about an image that is associated with the update.
     * @returns {IImageInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_image
     */
    get_Image() {
        result := ComCall(20, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * Gets an interface that contains the installation options of the update.
     * @returns {IInstallationBehavior} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_installationbehavior
     */
    get_InstallationBehavior() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * Gets a Boolean value that indicates whether the update is a beta release.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_isbeta
     */
    get_IsBeta() {
        result := ComCall(22, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether all the update content is cached on the computer.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_isdownloaded
     */
    get_IsDownloaded() {
        result := ComCall(23, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is hidden by a user.
     * @remarks
     * 
     * An attempt to mark a mandatory update as hidden causes an error.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_ishidden
     */
    get_IsHidden() {
        result := ComCall(24, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is hidden by a user.
     * @remarks
     * 
     * An attempt to mark a mandatory update as hidden causes an error.
     * 
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-put_ishidden
     */
    put_IsHidden(value) {
        result := ComCall(25, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the update is installed on a computer when the search is performed.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_isinstalled
     */
    get_IsInstalled() {
        result := ComCall(26, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the installation of the update is mandatory.
     * @remarks
     * 
     * If you try to mark a mandatory update as hidden, an error occurs.
     * 
     * Mandatory updates are updates to the Windows Update Agent (WUA) infrastructure. WUA may not require all mandatory updates to continue operating. However, these updates frequently improve performance or increase the number of products that WUA can offer.  We recommend that you install all mandatory updates.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_ismandatory
     */
    get_IsMandatory() {
        result := ComCall(27, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a user can uninstall the update from a computer.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_isuninstallable
     */
    get_IsUninstallable() {
        result := ComCall(28, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the languages that are supported by the update.
     * @remarks
     * 
     * This property refers to the language of the update itself.  The language that is used for the title and description of the update is not necessarily the language of the update itself.
     * 
     * 
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_languages
     */
    get_Languages() {
        result := ComCall(29, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the last published date of the update, in Coordinated Universal Time (UTC) date and time, on the server that deploys the update.
     * @remarks
     * 
     * On computers that are running Windows XP, the <b>LastDeploymentChangeTime</b> property retrieves the same date and time that are retrieved by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms750903(v=vs.85)">CreationDate</a> property  of the <b>IUpdateApproval</b> interface. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms750903(v=vs.85)">CreationDate</a> property is used on computers that are running Windows Server 2003.
     * 
     * 
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_lastdeploymentchangetime
     */
    get_LastDeploymentChangeTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the maximum download size of the update.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_mindownloadsize">MinDownloadSize</a> property of an update is always downloaded.  However, the <b>MaxDownloadSize</b> property is not always downloaded. The <b>MaxDownloadSize</b> property is downloaded based on the configuration of the computer that receives the update.
     * 
     * 
     * @returns {DECIMAL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_maxdownloadsize
     */
    get_MaxDownloadSize() {
        retval := DECIMAL()
        result := ComCall(31, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the minimum download size of the update.
     * @remarks
     * 
     * The <b>MinDownloadSize</b> property of an update is always downloaded.  However, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_maxdownloadsize">MaxDownloadSize</a> property is not always downloaded. The <b>MaxDownloadSize</b> property is downloaded based on the configuration of the computer that receives the update.
     * 
     * 
     * @returns {DECIMAL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_mindownloadsize
     */
    get_MinDownloadSize() {
        retval := DECIMAL()
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of language-specific strings that specify the hyperlinks to more information about the update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_moreinfourls
     */
    get_MoreInfoUrls() {
        result := ComCall(33, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the Microsoft Security Response Center severity rating of the update.
     * @remarks
     * 
     * The following ratings are the possible severity ratings of a security issue that is fixed by an update. These ratings were revised by the Microsoft Security Response Center in November 2002.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Term</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="Critical"></a><a id="critical"></a><a id="CRITICAL"></a>Critical
     * 
     * </td>
     * <td width="60%">
     * A security issue whose exploitation could allow the propagation of an Internet worm without user action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="Important"></a><a id="important"></a><a id="IMPORTANT"></a>Important
     * 
     * </td>
     * <td width="60%">
     * A security issue whose exploitation could result in compromise of the confidentiality, integrity, or availability of users' data, or of the integrity or availability of processing resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="Moderate"></a><a id="moderate"></a><a id="MODERATE"></a>Moderate
     * 
     * </td>
     * <td width="60%">
     * Exploitation is mitigated to a significant degree by factors such as default configuration, auditing, or difficulty of exploitation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <a id="Low"></a><a id="low"></a><a id="LOW"></a>Low
     * 
     * </td>
     * <td width="60%">
     * A security issue whose exploitation is extremely difficult, or whose impact is minimal.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_msrcseverity
     */
    get_MsrcSeverity() {
        retval := BSTR()
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedcpuspeed
     */
    get_RecommendedCpuSpeed() {
        result := ComCall(35, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the recommended free space that should be available on the hard disk before you install the update. The free space is specified in megabytes (MB).
     * @remarks
     * 
     * The following properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface return 0 (zero) when the information is not available:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedcpuspeed">RecommendedCpuSpeed</a>
     * </li>
     * <li><b>RecommendedHardDiskSpace</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory">RecommendedMemory</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace
     */
    get_RecommendedHardDiskSpace() {
        result := ComCall(36, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the recommended physical memory size that should be available in your computer before you install the update. The physical memory size is specified in megabytes (MB).
     * @remarks
     * 
     * The following properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface return 0 (zero) when the information is not available:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedcpuspeed">RecommendedCpuSpeed</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace">RecommendedHardDiskSpace</a>
     * </li>
     * <li><b>RecommendedMemory</b></li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_recommendedmemory
     */
    get_RecommendedMemory() {
        result := ComCall(37, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the localized release notes for the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_releasenotes
     */
    get_ReleaseNotes() {
        retval := BSTR()
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of string values that contain the security bulletin IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_securitybulletinids
     */
    get_SecurityBulletinIDs() {
        result := ComCall(39, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a collection of update identifiers. This collection of identifiers specifies the updates that are superseded by the update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_supersededupdateids
     */
    get_SupersededUpdateIDs() {
        result := ComCall(40, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a hyperlink to the language-specific support information for the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR()
        result := ComCall(41, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the type of the update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_type
     */
    get_Type() {
        result := ComCall(42, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the uninstallation notes for the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR()
        result := ComCall(43, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the uninstallation options for the update.
     * @returns {IInstallationBehavior} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_uninstallationbehavior
     */
    get_UninstallationBehavior() {
        result := ComCall(44, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * Gets an interface that contains the uninstallation steps for the update.
     * @remarks
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * 
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(45, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a collection of Microsoft Knowledge Base article IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_kbarticleids
     */
    get_KBArticleIDs() {
        result := ComCall(46, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Accepts the Microsoft Software License Terms that are associated with Windows Update.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * (This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface has been locked down.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_EULA_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Microsoft Software License Terms for the update could not be located.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-accepteula
     */
    AcceptEula() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * Gets the action for which the update is deployed.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_deploymentaction
     */
    get_DeploymentAction() {
        result := ComCall(48, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Copies the contents of an update to a specified path.
     * @param {BSTR} path The path of the location where the update contents are to be copied.
     * @param {VARIANT_BOOL} toExtractCabFiles Reserved for future use. 
     * 
     * You must set <i>toExtractCabFiles</i> to <b>VARIANT_TRUE</b> or <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * (This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface has been locked down.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_EULAS_DECLINED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Microsoft Software License Terms are not accepted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DM_NOTDOWNLOADED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The files are not downloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_DM_INCORRECTFILEHASH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file hash verification failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COR_E_DIRECTORYNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory could not be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_PATHNOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A file or directory could not be located.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-copyfromcache
     */
    CopyFromCache(path, toExtractCabFiles) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(49, this, "ptr", path, "short", toExtractCabFiles, "HRESULT")
        return result
    }

    /**
     * Gets the suggested download priority of the update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_downloadpriority
     */
    get_DownloadPriority() {
        result := ComCall(50, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets file information about the download contents of the update.
     * @returns {IUpdateDownloadContentCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate-get_downloadcontents
     */
    get_DownloadContents() {
        result := ComCall(51, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadContentCollection(retval)
    }
}
