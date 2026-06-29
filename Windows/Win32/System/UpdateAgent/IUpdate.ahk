#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateIdentity.ahk" { IUpdateIdentity }
#Import ".\DeploymentAction.ahk" { DeploymentAction }
#Import ".\IInstallationBehavior.ahk" { IInstallationBehavior }
#Import ".\ICategoryCollection.ahk" { ICategoryCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IUpdateDownloadContentCollection.ahk" { IUpdateDownloadContentCollection }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\DownloadPriority.ahk" { DownloadPriority }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import ".\UpdateType.ahk" { UpdateType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IImageInformation.ahk" { IImageInformation }

/**
 * Contains the properties and methods that are available to an update. (IUpdate)
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_bundledupdates">BundledUpdates</a> property contains an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatecollection">IUpdateCollection</a>, some properties and methods of the update may only be available on the bundled updates, for example, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_downloadcontents">DownloadContents</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-copyfromcache">CopyFromCache</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdate
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdate extends IDispatch {
    /**
     * The interface identifier for IUpdate
     * @type {Guid}
     */
    static IID := Guid("{6a92b07a-d821-4682-b423-5c805022cc4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Title                           : IntPtr
        get_AutoSelectOnWebSites            : IntPtr
        get_BundledUpdates                  : IntPtr
        get_CanRequireSource                : IntPtr
        get_Categories                      : IntPtr
        get_Deadline                        : IntPtr
        get_DeltaCompressedContentAvailable : IntPtr
        get_DeltaCompressedContentPreferred : IntPtr
        get_Description                     : IntPtr
        get_EulaAccepted                    : IntPtr
        get_EulaText                        : IntPtr
        get_HandlerID                       : IntPtr
        get_Identity                        : IntPtr
        get_Image                           : IntPtr
        get_InstallationBehavior            : IntPtr
        get_IsBeta                          : IntPtr
        get_IsDownloaded                    : IntPtr
        get_IsHidden                        : IntPtr
        put_IsHidden                        : IntPtr
        get_IsInstalled                     : IntPtr
        get_IsMandatory                     : IntPtr
        get_IsUninstallable                 : IntPtr
        get_Languages                       : IntPtr
        get_LastDeploymentChangeTime        : IntPtr
        get_MaxDownloadSize                 : IntPtr
        get_MinDownloadSize                 : IntPtr
        get_MoreInfoUrls                    : IntPtr
        get_MsrcSeverity                    : IntPtr
        get_RecommendedCpuSpeed             : IntPtr
        get_RecommendedHardDiskSpace        : IntPtr
        get_RecommendedMemory               : IntPtr
        get_ReleaseNotes                    : IntPtr
        get_SecurityBulletinIDs             : IntPtr
        get_SupersededUpdateIDs             : IntPtr
        get_SupportUrl                      : IntPtr
        get_Type                            : IntPtr
        get_UninstallationNotes             : IntPtr
        get_UninstallationBehavior          : IntPtr
        get_UninstallationSteps             : IntPtr
        get_KBArticleIDs                    : IntPtr
        AcceptEula                          : IntPtr
        get_DeploymentAction                : IntPtr
        CopyFromCache                       : IntPtr
        get_DownloadPriority                : IntPtr
        get_DownloadContents                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdate.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {UpdateType} 
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
     * @type {DeploymentAction} 
     */
    DeploymentAction {
        get => this.get_DeploymentAction()
    }

    /**
     * @type {DownloadPriority} 
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
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_title
     */
    get_Title() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the update is flagged to be automatically selected by Windows Update.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_autoselectonwebsites
     */
    get_AutoSelectOnWebSites() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains information about the ordered list of the bundled updates for the update.
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_bundledupdates
     */
    get_BundledUpdates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets a Boolean value that indicates whether the source media of the update is required for installation or uninstallation.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_canrequiresource
     */
    get_CanRequireSource() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a collection of categories to which the update belongs.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that  this property returns is for the language that is specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that was used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface is  not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information  that   this property returns is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * Because there is a <b>Categories</b> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> and a <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatehistoryentry2-get_categories">Categories</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatehistoryentry2">IUpdateHistoryEntry2</a>, the information that is used by the localized properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-icategory">ICategory</a> interface depend on the WUA object that owns the <b>ICategory</b> interface. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdate</b>, it follows the localization rules of <b>IUpdate</b>. If the <b>ICategory</b> interface is returned from the <b>Categories</b> property of <b>IUpdateHistoryEntry2</b>, it follows the localization rules of <b>IUpdateHistoryEntry2</b>.
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_categories
     */
    get_Categories() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * Gets the date by which the update must be installed.
     * @remarks
     * In COM, if the update has a deadline, the return value is of type VT_DATE and contains a DATE value that specifies the deadline. Otherwise, the return value is of type VT_EMPTY.
     * 
     * In the Microsoft .NET Framework, the return value is <b>NULL</b> if the update has no deadline.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deadline
     */
    get_Deadline() {
        retval := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether delta-compressed content is available on a server for the update.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentavailable
     */
    get_DeltaCompressedContentAvailable() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether to prefer delta-compressed content during the download and install or uninstall of the update if delta-compressed content is available.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentpreferred
     */
    get_DeltaCompressedContentPreferred() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the localized description of the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_description
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the Microsoft Software License Terms that are associated with the update are accepted for the computer.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulaaccepted
     */
    get_EulaAccepted() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the full localized text of the Microsoft Software License Terms that are associated with the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulatext
     */
    get_EulaText() {
        retval := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the install handler of the update.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_handlerid
     */
    get_HandlerID() {
        retval := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the unique identifier of the update.
     * @returns {IUpdateIdentity} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_identity
     */
    get_Identity() {
        result := ComCall(19, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * Gets an interface that contains information about an image that is associated with the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * 
     * This API can return a null pointer as the output, even when the return value is S_OK.
     * @returns {IImageInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_image
     */
    get_Image() {
        result := ComCall(20, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * Gets an interface that contains the installation options of the update.
     * @remarks
     * If the current update represents a bundle, the <b>InstallationBehavior</b> property of the bundle will be determined by the <b>InstallationBehavior</b> property of the child updates of the bundle. This API can return a null pointer as the output, even when the return value is S_OK.
     * @returns {IInstallationBehavior} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_installationbehavior
     */
    get_InstallationBehavior() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * Gets a Boolean value that indicates whether the update is a beta release.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isbeta
     */
    get_IsBeta() {
        result := ComCall(22, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether all the update content is cached on the computer.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isdownloaded
     */
    get_IsDownloaded() {
        result := ComCall(23, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is hidden by a user. (Get)
     * @remarks
     * An attempt to mark a mandatory update as hidden causes an error.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ishidden
     */
    get_IsHidden() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is hidden by a user. (Put)
     * @remarks
     * An attempt to mark a mandatory update as hidden causes an error.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-put_ishidden
     */
    put_IsHidden(value) {
        result := ComCall(25, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the update is installed on a computer when the search is performed.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isinstalled
     */
    get_IsInstalled() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether the installation of the update is mandatory.
     * @remarks
     * If you try to mark a mandatory update as hidden, an error occurs.
     * 
     * Mandatory updates are updates to the Windows Update Agent (WUA) infrastructure. WUA may not require all mandatory updates to continue operating. However, these updates frequently improve performance or increase the number of products that WUA can offer.  We recommend that you install all mandatory updates.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ismandatory
     */
    get_IsMandatory() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether a user can uninstall the update from a computer.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isuninstallable
     */
    get_IsUninstallable() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the languages that are supported by the update.
     * @remarks
     * This property refers to the language of the update itself.  The language that is used for the title and description of the update is not necessarily the language of the update itself.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_languages
     */
    get_Languages() {
        result := ComCall(29, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the last published date of the update, in Coordinated Universal Time (UTC) date and time, on the server that deploys the update.
     * @remarks
     * On computers that are running Windows XP, the <b>LastDeploymentChangeTime</b> property retrieves the same date and time that are retrieved by the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms750903(v=vs.85)">CreationDate</a> property  of the <b>IUpdateApproval</b> interface. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ms750903(v=vs.85)">CreationDate</a> property is used on computers that are running Windows Server 2003.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_lastdeploymentchangetime
     */
    get_LastDeploymentChangeTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the maximum download size of the update.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_mindownloadsize">MinDownloadSize</a> property of an update is always downloaded.  However, the <b>MaxDownloadSize</b> property is not always downloaded. The <b>MaxDownloadSize</b> property is downloaded based on the configuration of the computer that receives the update.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_maxdownloadsize
     */
    get_MaxDownloadSize() {
        retval := DECIMAL()
        result := ComCall(31, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the minimum download size of the update.
     * @remarks
     * The <b>MinDownloadSize</b> property of an update is always downloaded.  However, the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_maxdownloadsize">MaxDownloadSize</a> property is not always downloaded. The <b>MaxDownloadSize</b> property is downloaded based on the configuration of the computer that receives the update.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_mindownloadsize
     */
    get_MinDownloadSize() {
        retval := DECIMAL()
        result := ComCall(32, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of language-specific strings that specify the hyperlinks to more information about the update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_moreinfourls
     */
    get_MoreInfoUrls() {
        result := ComCall(33, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets the Microsoft Security Response Center severity rating of the update.
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_msrcseverity
     */
    get_MsrcSeverity() {
        retval := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the recommended CPU speed used to install the update, in megahertz (MHz).
     * @remarks
     * The following properties of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface return 0 (zero) when the information is not available:
     * 
     * <ul>
     * <li><b>RecommendedCpuSpeed</b></li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace">RecommendedHardDiskSpace</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory">RecommendedMemory</a>
     * </li>
     * </ul>
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace
     */
    get_RecommendedHardDiskSpace() {
        result := ComCall(36, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the recommended physical memory size that should be available in your computer before you install the update. The physical memory size is specified in megabytes (MB).
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory
     */
    get_RecommendedMemory() {
        result := ComCall(37, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the localized release notes for the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_releasenotes
     */
    get_ReleaseNotes() {
        retval := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of string values that contain the security bulletin IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_securitybulletinids
     */
    get_SecurityBulletinIDs() {
        result := ComCall(39, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a collection of update identifiers. This collection of identifiers specifies the updates that are superseded by the update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supersededupdateids
     */
    get_SupersededUpdateIDs() {
        result := ComCall(40, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a hyperlink to the language-specific support information for the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR.Owned()
        result := ComCall(41, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the type of the update.
     * @returns {UpdateType} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_type
     */
    get_Type() {
        result := ComCall(42, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the uninstallation notes for the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property  of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains the uninstallation options for the update.
     * @remarks
     * This API can return a null pointer as the output, even when the return value is S_OK.
     * @returns {IInstallationBehavior} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationbehavior
     */
    get_UninstallationBehavior() {
        result := ComCall(44, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * Gets an interface that contains the uninstallation steps for the update.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is  created by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a> method, the information  that   this property returns is for the language that is  specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property. This is the <b>UserLocale</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a> interface of the session that is used to create <b>IUpdateSearcher</b>.
     * 
     * If a language preference is not specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession2-get_userlocale">UserLocale</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesession2">IUpdateSession2</a>, or if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface  is not  created by using <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher">IUpdateSession::CreateUpdateSearcher</a>, the information that is returned by  this property is for the default user interface (UI) language of the user. If the default UI language of the user is unavailable, Windows Update Agent (WUA) uses the default UI language of the computer.   If the default language of the computer is unavailable, WUA uses the language  that  the provider of the  update recommends.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(45, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Gets a collection of Microsoft Knowledge Base article IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_kbarticleids
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-accepteula
     */
    AcceptEula() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * Gets the action for which the update is deployed.
     * @returns {DeploymentAction} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deploymentaction
     */
    get_DeploymentAction() {
        result := ComCall(48, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Copies the contents of an update to a specified path.
     * @remarks
     * To copy bundled updates, call this method on the individual updates that are bundled in this update.
     * 
     * <div class="alert"><b>Note</b>  We don't recommend or support the use of the <b>IUpdate::CopyFromCache</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate2-copytocache">IUpdate2::CopyToCache</a> methods to move downloaded updates from one computer to another computer. When the Windows Update Agent (WUA) downloads an update, it might only download the portions of the update’s payload that are necessary for a particular client computer. The necessary portions of the update’s payload can often vary from one computer to another computer, even if the computers have similar hardware and software configurations. <b>IUpdate2::CopyToCache</b> only works if the provided files are an exact match for the files that Windows Update would have normally downloaded on that computer; if you called <b>IUpdate::CopyFromCache</b> to obtain the files on a different computer, the files are likely not to match the files that Windows Update would have normally downloaded so <b>IUpdate2::CopyToCache</b> might fail.</div>
     * <div> </div>
     * @param {BSTR} _path The path of the location where the update contents are to be copied.
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-copyfromcache
     */
    CopyFromCache(_path, toExtractCabFiles) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(49, this, BSTR, _path, VARIANT_BOOL, toExtractCabFiles, "HRESULT")
        return result
    }

    /**
     * Gets the suggested download priority of the update.
     * @returns {DownloadPriority} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadpriority
     */
    get_DownloadPriority() {
        result := ComCall(50, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets file information about the download contents of the update.
     * @returns {IUpdateDownloadContentCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadcontents
     */
    get_DownloadContents() {
        result := ComCall(51, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadContentCollection(retval)
    }

    Query(iid) {
        if (IUpdate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_AutoSelectOnWebSites := CallbackCreate(GetMethod(implObj, "get_AutoSelectOnWebSites"), flags, 2)
        this.vtbl.get_BundledUpdates := CallbackCreate(GetMethod(implObj, "get_BundledUpdates"), flags, 2)
        this.vtbl.get_CanRequireSource := CallbackCreate(GetMethod(implObj, "get_CanRequireSource"), flags, 2)
        this.vtbl.get_Categories := CallbackCreate(GetMethod(implObj, "get_Categories"), flags, 2)
        this.vtbl.get_Deadline := CallbackCreate(GetMethod(implObj, "get_Deadline"), flags, 2)
        this.vtbl.get_DeltaCompressedContentAvailable := CallbackCreate(GetMethod(implObj, "get_DeltaCompressedContentAvailable"), flags, 2)
        this.vtbl.get_DeltaCompressedContentPreferred := CallbackCreate(GetMethod(implObj, "get_DeltaCompressedContentPreferred"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_EulaAccepted := CallbackCreate(GetMethod(implObj, "get_EulaAccepted"), flags, 2)
        this.vtbl.get_EulaText := CallbackCreate(GetMethod(implObj, "get_EulaText"), flags, 2)
        this.vtbl.get_HandlerID := CallbackCreate(GetMethod(implObj, "get_HandlerID"), flags, 2)
        this.vtbl.get_Identity := CallbackCreate(GetMethod(implObj, "get_Identity"), flags, 2)
        this.vtbl.get_Image := CallbackCreate(GetMethod(implObj, "get_Image"), flags, 2)
        this.vtbl.get_InstallationBehavior := CallbackCreate(GetMethod(implObj, "get_InstallationBehavior"), flags, 2)
        this.vtbl.get_IsBeta := CallbackCreate(GetMethod(implObj, "get_IsBeta"), flags, 2)
        this.vtbl.get_IsDownloaded := CallbackCreate(GetMethod(implObj, "get_IsDownloaded"), flags, 2)
        this.vtbl.get_IsHidden := CallbackCreate(GetMethod(implObj, "get_IsHidden"), flags, 2)
        this.vtbl.put_IsHidden := CallbackCreate(GetMethod(implObj, "put_IsHidden"), flags, 2)
        this.vtbl.get_IsInstalled := CallbackCreate(GetMethod(implObj, "get_IsInstalled"), flags, 2)
        this.vtbl.get_IsMandatory := CallbackCreate(GetMethod(implObj, "get_IsMandatory"), flags, 2)
        this.vtbl.get_IsUninstallable := CallbackCreate(GetMethod(implObj, "get_IsUninstallable"), flags, 2)
        this.vtbl.get_Languages := CallbackCreate(GetMethod(implObj, "get_Languages"), flags, 2)
        this.vtbl.get_LastDeploymentChangeTime := CallbackCreate(GetMethod(implObj, "get_LastDeploymentChangeTime"), flags, 2)
        this.vtbl.get_MaxDownloadSize := CallbackCreate(GetMethod(implObj, "get_MaxDownloadSize"), flags, 2)
        this.vtbl.get_MinDownloadSize := CallbackCreate(GetMethod(implObj, "get_MinDownloadSize"), flags, 2)
        this.vtbl.get_MoreInfoUrls := CallbackCreate(GetMethod(implObj, "get_MoreInfoUrls"), flags, 2)
        this.vtbl.get_MsrcSeverity := CallbackCreate(GetMethod(implObj, "get_MsrcSeverity"), flags, 2)
        this.vtbl.get_RecommendedCpuSpeed := CallbackCreate(GetMethod(implObj, "get_RecommendedCpuSpeed"), flags, 2)
        this.vtbl.get_RecommendedHardDiskSpace := CallbackCreate(GetMethod(implObj, "get_RecommendedHardDiskSpace"), flags, 2)
        this.vtbl.get_RecommendedMemory := CallbackCreate(GetMethod(implObj, "get_RecommendedMemory"), flags, 2)
        this.vtbl.get_ReleaseNotes := CallbackCreate(GetMethod(implObj, "get_ReleaseNotes"), flags, 2)
        this.vtbl.get_SecurityBulletinIDs := CallbackCreate(GetMethod(implObj, "get_SecurityBulletinIDs"), flags, 2)
        this.vtbl.get_SupersededUpdateIDs := CallbackCreate(GetMethod(implObj, "get_SupersededUpdateIDs"), flags, 2)
        this.vtbl.get_SupportUrl := CallbackCreate(GetMethod(implObj, "get_SupportUrl"), flags, 2)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_UninstallationNotes := CallbackCreate(GetMethod(implObj, "get_UninstallationNotes"), flags, 2)
        this.vtbl.get_UninstallationBehavior := CallbackCreate(GetMethod(implObj, "get_UninstallationBehavior"), flags, 2)
        this.vtbl.get_UninstallationSteps := CallbackCreate(GetMethod(implObj, "get_UninstallationSteps"), flags, 2)
        this.vtbl.get_KBArticleIDs := CallbackCreate(GetMethod(implObj, "get_KBArticleIDs"), flags, 2)
        this.vtbl.AcceptEula := CallbackCreate(GetMethod(implObj, "AcceptEula"), flags, 1)
        this.vtbl.get_DeploymentAction := CallbackCreate(GetMethod(implObj, "get_DeploymentAction"), flags, 2)
        this.vtbl.CopyFromCache := CallbackCreate(GetMethod(implObj, "CopyFromCache"), flags, 3)
        this.vtbl.get_DownloadPriority := CallbackCreate(GetMethod(implObj, "get_DownloadPriority"), flags, 2)
        this.vtbl.get_DownloadContents := CallbackCreate(GetMethod(implObj, "get_DownloadContents"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_AutoSelectOnWebSites)
        CallbackFree(this.vtbl.get_BundledUpdates)
        CallbackFree(this.vtbl.get_CanRequireSource)
        CallbackFree(this.vtbl.get_Categories)
        CallbackFree(this.vtbl.get_Deadline)
        CallbackFree(this.vtbl.get_DeltaCompressedContentAvailable)
        CallbackFree(this.vtbl.get_DeltaCompressedContentPreferred)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_EulaAccepted)
        CallbackFree(this.vtbl.get_EulaText)
        CallbackFree(this.vtbl.get_HandlerID)
        CallbackFree(this.vtbl.get_Identity)
        CallbackFree(this.vtbl.get_Image)
        CallbackFree(this.vtbl.get_InstallationBehavior)
        CallbackFree(this.vtbl.get_IsBeta)
        CallbackFree(this.vtbl.get_IsDownloaded)
        CallbackFree(this.vtbl.get_IsHidden)
        CallbackFree(this.vtbl.put_IsHidden)
        CallbackFree(this.vtbl.get_IsInstalled)
        CallbackFree(this.vtbl.get_IsMandatory)
        CallbackFree(this.vtbl.get_IsUninstallable)
        CallbackFree(this.vtbl.get_Languages)
        CallbackFree(this.vtbl.get_LastDeploymentChangeTime)
        CallbackFree(this.vtbl.get_MaxDownloadSize)
        CallbackFree(this.vtbl.get_MinDownloadSize)
        CallbackFree(this.vtbl.get_MoreInfoUrls)
        CallbackFree(this.vtbl.get_MsrcSeverity)
        CallbackFree(this.vtbl.get_RecommendedCpuSpeed)
        CallbackFree(this.vtbl.get_RecommendedHardDiskSpace)
        CallbackFree(this.vtbl.get_RecommendedMemory)
        CallbackFree(this.vtbl.get_ReleaseNotes)
        CallbackFree(this.vtbl.get_SecurityBulletinIDs)
        CallbackFree(this.vtbl.get_SupersededUpdateIDs)
        CallbackFree(this.vtbl.get_SupportUrl)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_UninstallationNotes)
        CallbackFree(this.vtbl.get_UninstallationBehavior)
        CallbackFree(this.vtbl.get_UninstallationSteps)
        CallbackFree(this.vtbl.get_KBArticleIDs)
        CallbackFree(this.vtbl.AcceptEula)
        CallbackFree(this.vtbl.get_DeploymentAction)
        CallbackFree(this.vtbl.CopyFromCache)
        CallbackFree(this.vtbl.get_DownloadPriority)
        CallbackFree(this.vtbl.get_DownloadContents)
    }
}
