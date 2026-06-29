#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PM_TILE_HUBTYPE.ahk" { PM_TILE_HUBTYPE }
#Import ".\PM_STARTAPPBLOB.ahk" { PM_STARTAPPBLOB }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_APP_GENRE.ahk" { PM_APP_GENRE }
#Import ".\PM_APPLICATION_STATE.ahk" { PM_APPLICATION_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\PM_APPLICATION_INSTALL_TYPE.ahk" { PM_APPLICATION_INSTALL_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMApplicationInfo extends IUnknown {
    /**
     * The interface identifier for IPMApplicationInfo
     * @type {Guid}
     */
    static IID := Guid("{50afb58a-438c-4088-9789-f8c4899829c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMApplicationInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ProductID                         : IntPtr
        get_InstanceID                        : IntPtr
        get_OfferID                           : IntPtr
        get_DefaultTask                       : IntPtr
        get_AppTitle                          : IntPtr
        get_IconPath                          : IntPtr
        get_NotificationState                 : IntPtr
        get_AppInstallType                    : IntPtr
        get_State                             : IntPtr
        get_IsRevoked                         : IntPtr
        get_UpdateAvailable                   : IntPtr
        get_InstallDate                       : IntPtr
        get_IsUninstallable                   : IntPtr
        get_IsThemable                        : IntPtr
        get_IsTrial                           : IntPtr
        get_InstallPath                       : IntPtr
        get_DataRoot                          : IntPtr
        get_Genre                             : IntPtr
        get_Publisher                         : IntPtr
        get_Author                            : IntPtr
        get_Description                       : IntPtr
        get_Version                           : IntPtr
        get_InvocationInfo                    : IntPtr
        get_AppPlatMajorVersion               : IntPtr
        get_AppPlatMinorVersion               : IntPtr
        get_PublisherID                       : IntPtr
        get_IsMultiCore                       : IntPtr
        get_SID                               : IntPtr
        get_AppPlatMajorVersionLightUp        : IntPtr
        get_AppPlatMinorVersionLightUp        : IntPtr
        set_UpdateAvailable                   : IntPtr
        set_NotificationState                 : IntPtr
        set_IconPath                          : IntPtr
        set_UninstallableState                : IntPtr
        get_IsPinableOnKidZone                : IntPtr
        get_IsOriginallyPreInstalled          : IntPtr
        get_IsInstallOnSD                     : IntPtr
        get_IsOptoutOnSD                      : IntPtr
        get_IsOptoutBackupRestore             : IntPtr
        set_EnterpriseDisabled                : IntPtr
        set_EnterpriseUninstallable           : IntPtr
        get_EnterpriseDisabled                : IntPtr
        get_EnterpriseUninstallable           : IntPtr
        get_IsVisibleOnAppList                : IntPtr
        get_IsInboxApp                        : IntPtr
        get_StorageID                         : IntPtr
        get_StartAppBlob                      : IntPtr
        get_IsMovable                         : IntPtr
        get_DeploymentAppEnumerationHubFilter : IntPtr
        get_ModifiedDate                      : IntPtr
        get_IsOriginallyRestored              : IntPtr
        get_ShouldDeferMdilBind               : IntPtr
        get_IsFullyPreInstall                 : IntPtr
        set_IsMdilMaintenanceNeeded           : IntPtr
        set_Title                             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMApplicationInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    ProductID {
        get => this.get_ProductID()
    }

    /**
     * @type {Guid} 
     */
    InstanceID {
        get => this.get_InstanceID()
    }

    /**
     * @type {Guid} 
     */
    OfferID {
        get => this.get_OfferID()
    }

    /**
     */
    DefaultTask {
        get => this.get_DefaultTask()
    }

    /**
     */
    AppTitle {
        get => this.get_AppTitle()
    }

    /**
     */
    IconPath {
        get => this.get_IconPath()
    }

    /**
     * @type {BOOL} 
     */
    NotificationState {
        get => this.get_NotificationState()
    }

    /**
     * @type {PM_APPLICATION_INSTALL_TYPE} 
     */
    AppInstallType {
        get => this.get_AppInstallType()
    }

    /**
     * @type {PM_APPLICATION_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {BOOL} 
     */
    IsRevoked {
        get => this.get_IsRevoked()
    }

    /**
     * @type {BOOL} 
     */
    UpdateAvailable {
        get => this.get_UpdateAvailable()
    }

    /**
     * @type {FILETIME} 
     */
    InstallDate {
        get => this.get_InstallDate()
    }

    /**
     * @type {BOOL} 
     */
    IsUninstallable {
        get => this.get_IsUninstallable()
    }

    /**
     * @type {BOOL} 
     */
    IsThemable {
        get => this.get_IsThemable()
    }

    /**
     * @type {BOOL} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     */
    InstallPath {
        get => this.get_InstallPath()
    }

    /**
     */
    DataRoot {
        get => this.get_DataRoot()
    }

    /**
     * @type {PM_APP_GENRE} 
     */
    Genre {
        get => this.get_Genre()
    }

    /**
     */
    Publisher {
        get => this.get_Publisher()
    }

    /**
     */
    Author {
        get => this.get_Author()
    }

    /**
     */
    Description {
        get => this.get_Description()
    }

    /**
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Integer} 
     */
    AppPlatMajorVersion {
        get => this.get_AppPlatMajorVersion()
    }

    /**
     * @type {Integer} 
     */
    AppPlatMinorVersion {
        get => this.get_AppPlatMinorVersion()
    }

    /**
     * @type {Guid} 
     */
    PublisherID {
        get => this.get_PublisherID()
    }

    /**
     * @type {BOOL} 
     */
    IsMultiCore {
        get => this.get_IsMultiCore()
    }

    /**
     */
    SID {
        get => this.get_SID()
    }

    /**
     * @type {Integer} 
     */
    AppPlatMajorVersionLightUp {
        get => this.get_AppPlatMajorVersionLightUp()
    }

    /**
     * @type {Integer} 
     */
    AppPlatMinorVersionLightUp {
        get => this.get_AppPlatMinorVersionLightUp()
    }

    /**
     */
    UninstallableState {
    }

    /**
     * @type {BOOL} 
     */
    IsPinableOnKidZone {
        get => this.get_IsPinableOnKidZone()
    }

    /**
     * @type {BOOL} 
     */
    IsOriginallyPreInstalled {
        get => this.get_IsOriginallyPreInstalled()
    }

    /**
     * @type {BOOL} 
     */
    IsInstallOnSD {
        get => this.get_IsInstallOnSD()
    }

    /**
     * @type {BOOL} 
     */
    IsOptoutOnSD {
        get => this.get_IsOptoutOnSD()
    }

    /**
     * @type {BOOL} 
     */
    IsOptoutBackupRestore {
        get => this.get_IsOptoutBackupRestore()
    }

    /**
     * @type {BOOL} 
     */
    EnterpriseDisabled {
        get => this.get_EnterpriseDisabled()
    }

    /**
     * @type {BOOL} 
     */
    EnterpriseUninstallable {
        get => this.get_EnterpriseUninstallable()
    }

    /**
     * @type {BOOL} 
     */
    IsVisibleOnAppList {
        get => this.get_IsVisibleOnAppList()
    }

    /**
     * @type {BOOL} 
     */
    IsInboxApp {
        get => this.get_IsInboxApp()
    }

    /**
     * @type {Guid} 
     */
    StorageID {
        get => this.get_StorageID()
    }

    /**
     */
    StartAppBlob {
        get => this.get_StartAppBlob()
    }

    /**
     * @type {BOOL} 
     */
    IsMovable {
        get => this.get_IsMovable()
    }

    /**
     * @type {PM_TILE_HUBTYPE} 
     */
    DeploymentAppEnumerationHubFilter {
        get => this.get_DeploymentAppEnumerationHubFilter()
    }

    /**
     * @type {FILETIME} 
     */
    ModifiedDate {
        get => this.get_ModifiedDate()
    }

    /**
     * @type {BOOL} 
     */
    IsOriginallyRestored {
        get => this.get_IsOriginallyRestored()
    }

    /**
     * @type {BOOL} 
     */
    ShouldDeferMdilBind {
        get => this.get_ShouldDeferMdilBind()
    }

    /**
     * @type {BOOL} 
     */
    IsFullyPreInstall {
        get => this.get_IsFullyPreInstall()
    }

    /**
     */
    IsMdilMaintenanceNeeded {
    }

    /**
     */
    Title {
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, Guid.Ptr, pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceID() {
        pInstanceID := Guid()
        result := ComCall(4, this, Guid.Ptr, pInstanceID, "HRESULT")
        return pInstanceID
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_OfferID() {
        pOfferID := Guid()
        result := ComCall(5, this, Guid.Ptr, pOfferID, "HRESULT")
        return pOfferID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultTask 
     * @returns {HRESULT} 
     */
    get_DefaultTask(pDefaultTask) {
        result := ComCall(6, this, BSTR.Ptr, pDefaultTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppTitle 
     * @returns {HRESULT} 
     */
    get_AppTitle(pAppTitle) {
        result := ComCall(7, this, BSTR.Ptr, pAppTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppIconPath 
     * @returns {HRESULT} 
     */
    get_IconPath(pAppIconPath) {
        result := ComCall(8, this, BSTR.Ptr, pAppIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_NotificationState() {
        result := ComCall(9, this, BOOL.Ptr, &pIsNotified := 0, "HRESULT")
        return pIsNotified
    }

    /**
     * 
     * @returns {PM_APPLICATION_INSTALL_TYPE} 
     */
    get_AppInstallType() {
        result := ComCall(10, this, "int*", &pAppInstallType := 0, "HRESULT")
        return pAppInstallType
    }

    /**
     * 
     * @returns {PM_APPLICATION_STATE} 
     */
    get_State() {
        result := ComCall(11, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsRevoked() {
        result := ComCall(12, this, BOOL.Ptr, &pIsRevoked := 0, "HRESULT")
        return pIsRevoked
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_UpdateAvailable() {
        result := ComCall(13, this, BOOL.Ptr, &pIsUpdateAvailable := 0, "HRESULT")
        return pIsUpdateAvailable
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_InstallDate() {
        pInstallDate := FILETIME()
        result := ComCall(14, this, FILETIME.Ptr, pInstallDate, "HRESULT")
        return pInstallDate
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsUninstallable() {
        result := ComCall(15, this, BOOL.Ptr, &pIsUninstallable := 0, "HRESULT")
        return pIsUninstallable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsThemable() {
        result := ComCall(16, this, BOOL.Ptr, &pIsThemable := 0, "HRESULT")
        return pIsThemable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsTrial() {
        result := ComCall(17, this, BOOL.Ptr, &pIsTrial := 0, "HRESULT")
        return pIsTrial
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallPath 
     * @returns {HRESULT} 
     */
    get_InstallPath(pInstallPath) {
        result := ComCall(18, this, BSTR.Ptr, pInstallPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRoot 
     * @returns {HRESULT} 
     */
    get_DataRoot(pDataRoot) {
        result := ComCall(19, this, BSTR.Ptr, pDataRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PM_APP_GENRE} 
     */
    get_Genre() {
        result := ComCall(20, this, "int*", &pGenre := 0, "HRESULT")
        return pGenre
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPublisher 
     * @returns {HRESULT} 
     */
    get_Publisher(pPublisher) {
        result := ComCall(21, this, BSTR.Ptr, pPublisher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     */
    get_Author(pAuthor) {
        result := ComCall(22, this, BSTR.Ptr, pAuthor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(23, this, BSTR.Ptr, pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     */
    get_Version(pVersion) {
        result := ComCall(24, this, BSTR.Ptr, pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(25, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppPlatMajorVersion() {
        result := ComCall(26, this, "char*", &pMajorVer := 0, "HRESULT")
        return pMajorVer
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppPlatMinorVersion() {
        result := ComCall(27, this, "char*", &pMinorVer := 0, "HRESULT")
        return pMinorVer
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PublisherID() {
        pPublisherID := Guid()
        result := ComCall(28, this, Guid.Ptr, pPublisherID, "HRESULT")
        return pPublisherID
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMultiCore() {
        result := ComCall(29, this, BOOL.Ptr, &pIsMultiCore := 0, "HRESULT")
        return pIsMultiCore
    }

    /**
     * 
     * @param {Pointer<BSTR>} _pSID 
     * @returns {HRESULT} 
     */
    get_SID(_pSID) {
        result := ComCall(30, this, BSTR.Ptr, _pSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppPlatMajorVersionLightUp() {
        result := ComCall(31, this, "char*", &pMajorVer := 0, "HRESULT")
        return pMajorVer
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppPlatMinorVersionLightUp() {
        result := ComCall(32, this, "char*", &pMinorVer := 0, "HRESULT")
        return pMinorVer
    }

    /**
     * 
     * @param {BOOL} IsUpdateAvailable 
     * @returns {HRESULT} 
     */
    set_UpdateAvailable(IsUpdateAvailable) {
        result := ComCall(33, this, BOOL, IsUpdateAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsNotified 
     * @returns {HRESULT} 
     */
    set_NotificationState(IsNotified) {
        result := ComCall(34, this, BOOL, IsNotified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AppIconPath 
     * @returns {HRESULT} 
     */
    set_IconPath(AppIconPath) {
        AppIconPath := AppIconPath is String ? BSTR.Alloc(AppIconPath).Value : AppIconPath

        result := ComCall(35, this, BSTR, AppIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_UninstallableState(IsUninstallable) {
        result := ComCall(36, this, BOOL, IsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsPinableOnKidZone() {
        result := ComCall(37, this, BOOL.Ptr, &pIsPinable := 0, "HRESULT")
        return pIsPinable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOriginallyPreInstalled() {
        result := ComCall(38, this, BOOL.Ptr, &pIsPreinstalled := 0, "HRESULT")
        return pIsPreinstalled
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInstallOnSD() {
        result := ComCall(39, this, BOOL.Ptr, &pIsInstallOnSD := 0, "HRESULT")
        return pIsInstallOnSD
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptoutOnSD() {
        result := ComCall(40, this, BOOL.Ptr, &pIsOptoutOnSD := 0, "HRESULT")
        return pIsOptoutOnSD
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptoutBackupRestore() {
        result := ComCall(41, this, BOOL.Ptr, &pIsOptoutBackupRestore := 0, "HRESULT")
        return pIsOptoutBackupRestore
    }

    /**
     * 
     * @param {BOOL} IsDisabled 
     * @returns {HRESULT} 
     */
    set_EnterpriseDisabled(IsDisabled) {
        result := ComCall(42, this, BOOL, IsDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_EnterpriseUninstallable(IsUninstallable) {
        result := ComCall(43, this, BOOL, IsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_EnterpriseDisabled() {
        result := ComCall(44, this, BOOL.Ptr, &IsDisabled := 0, "HRESULT")
        return IsDisabled
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_EnterpriseUninstallable() {
        result := ComCall(45, this, BOOL.Ptr, &IsUninstallable := 0, "HRESULT")
        return IsUninstallable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsVisibleOnAppList() {
        result := ComCall(46, this, BOOL.Ptr, &pIsVisible := 0, "HRESULT")
        return pIsVisible
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInboxApp() {
        result := ComCall(47, this, BOOL.Ptr, &pIsInboxApp := 0, "HRESULT")
        return pIsInboxApp
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_StorageID() {
        pStorageID := Guid()
        result := ComCall(48, this, Guid.Ptr, pStorageID, "HRESULT")
        return pStorageID
    }

    /**
     * 
     * @param {Pointer<PM_STARTAPPBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartAppBlob(pBlob) {
        result := ComCall(49, this, PM_STARTAPPBLOB.Ptr, pBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMovable() {
        result := ComCall(50, this, BOOL.Ptr, &pIsMovable := 0, "HRESULT")
        return pIsMovable
    }

    /**
     * 
     * @returns {PM_TILE_HUBTYPE} 
     */
    get_DeploymentAppEnumerationHubFilter() {
        result := ComCall(51, this, "int*", &HubType := 0, "HRESULT")
        return HubType
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_ModifiedDate() {
        pModifiedDate := FILETIME()
        result := ComCall(52, this, FILETIME.Ptr, pModifiedDate, "HRESULT")
        return pModifiedDate
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOriginallyRestored() {
        result := ComCall(53, this, BOOL.Ptr, &pIsRestored := 0, "HRESULT")
        return pIsRestored
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ShouldDeferMdilBind() {
        result := ComCall(54, this, BOOL.Ptr, &pfDeferMdilBind := 0, "HRESULT")
        return pfDeferMdilBind
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsFullyPreInstall() {
        result := ComCall(55, this, BOOL.Ptr, &pfIsFullyPreInstall := 0, "HRESULT")
        return pfIsFullyPreInstall
    }

    /**
     * 
     * @param {BOOL} fIsMdilMaintenanceNeeded 
     * @returns {HRESULT} 
     */
    set_IsMdilMaintenanceNeeded(fIsMdilMaintenanceNeeded) {
        result := ComCall(56, this, BOOL, fIsMdilMaintenanceNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AppTitle 
     * @returns {HRESULT} 
     */
    set_Title(AppTitle) {
        AppTitle := AppTitle is String ? BSTR.Alloc(AppTitle).Value : AppTitle

        result := ComCall(57, this, BSTR, AppTitle, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMApplicationInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ProductID := CallbackCreate(GetMethod(implObj, "get_ProductID"), flags, 2)
        this.vtbl.get_InstanceID := CallbackCreate(GetMethod(implObj, "get_InstanceID"), flags, 2)
        this.vtbl.get_OfferID := CallbackCreate(GetMethod(implObj, "get_OfferID"), flags, 2)
        this.vtbl.get_DefaultTask := CallbackCreate(GetMethod(implObj, "get_DefaultTask"), flags, 2)
        this.vtbl.get_AppTitle := CallbackCreate(GetMethod(implObj, "get_AppTitle"), flags, 2)
        this.vtbl.get_IconPath := CallbackCreate(GetMethod(implObj, "get_IconPath"), flags, 2)
        this.vtbl.get_NotificationState := CallbackCreate(GetMethod(implObj, "get_NotificationState"), flags, 2)
        this.vtbl.get_AppInstallType := CallbackCreate(GetMethod(implObj, "get_AppInstallType"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_IsRevoked := CallbackCreate(GetMethod(implObj, "get_IsRevoked"), flags, 2)
        this.vtbl.get_UpdateAvailable := CallbackCreate(GetMethod(implObj, "get_UpdateAvailable"), flags, 2)
        this.vtbl.get_InstallDate := CallbackCreate(GetMethod(implObj, "get_InstallDate"), flags, 2)
        this.vtbl.get_IsUninstallable := CallbackCreate(GetMethod(implObj, "get_IsUninstallable"), flags, 2)
        this.vtbl.get_IsThemable := CallbackCreate(GetMethod(implObj, "get_IsThemable"), flags, 2)
        this.vtbl.get_IsTrial := CallbackCreate(GetMethod(implObj, "get_IsTrial"), flags, 2)
        this.vtbl.get_InstallPath := CallbackCreate(GetMethod(implObj, "get_InstallPath"), flags, 2)
        this.vtbl.get_DataRoot := CallbackCreate(GetMethod(implObj, "get_DataRoot"), flags, 2)
        this.vtbl.get_Genre := CallbackCreate(GetMethod(implObj, "get_Genre"), flags, 2)
        this.vtbl.get_Publisher := CallbackCreate(GetMethod(implObj, "get_Publisher"), flags, 2)
        this.vtbl.get_Author := CallbackCreate(GetMethod(implObj, "get_Author"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
        this.vtbl.get_AppPlatMajorVersion := CallbackCreate(GetMethod(implObj, "get_AppPlatMajorVersion"), flags, 2)
        this.vtbl.get_AppPlatMinorVersion := CallbackCreate(GetMethod(implObj, "get_AppPlatMinorVersion"), flags, 2)
        this.vtbl.get_PublisherID := CallbackCreate(GetMethod(implObj, "get_PublisherID"), flags, 2)
        this.vtbl.get_IsMultiCore := CallbackCreate(GetMethod(implObj, "get_IsMultiCore"), flags, 2)
        this.vtbl.get_SID := CallbackCreate(GetMethod(implObj, "get_SID"), flags, 2)
        this.vtbl.get_AppPlatMajorVersionLightUp := CallbackCreate(GetMethod(implObj, "get_AppPlatMajorVersionLightUp"), flags, 2)
        this.vtbl.get_AppPlatMinorVersionLightUp := CallbackCreate(GetMethod(implObj, "get_AppPlatMinorVersionLightUp"), flags, 2)
        this.vtbl.set_UpdateAvailable := CallbackCreate(GetMethod(implObj, "set_UpdateAvailable"), flags, 2)
        this.vtbl.set_NotificationState := CallbackCreate(GetMethod(implObj, "set_NotificationState"), flags, 2)
        this.vtbl.set_IconPath := CallbackCreate(GetMethod(implObj, "set_IconPath"), flags, 2)
        this.vtbl.set_UninstallableState := CallbackCreate(GetMethod(implObj, "set_UninstallableState"), flags, 2)
        this.vtbl.get_IsPinableOnKidZone := CallbackCreate(GetMethod(implObj, "get_IsPinableOnKidZone"), flags, 2)
        this.vtbl.get_IsOriginallyPreInstalled := CallbackCreate(GetMethod(implObj, "get_IsOriginallyPreInstalled"), flags, 2)
        this.vtbl.get_IsInstallOnSD := CallbackCreate(GetMethod(implObj, "get_IsInstallOnSD"), flags, 2)
        this.vtbl.get_IsOptoutOnSD := CallbackCreate(GetMethod(implObj, "get_IsOptoutOnSD"), flags, 2)
        this.vtbl.get_IsOptoutBackupRestore := CallbackCreate(GetMethod(implObj, "get_IsOptoutBackupRestore"), flags, 2)
        this.vtbl.set_EnterpriseDisabled := CallbackCreate(GetMethod(implObj, "set_EnterpriseDisabled"), flags, 2)
        this.vtbl.set_EnterpriseUninstallable := CallbackCreate(GetMethod(implObj, "set_EnterpriseUninstallable"), flags, 2)
        this.vtbl.get_EnterpriseDisabled := CallbackCreate(GetMethod(implObj, "get_EnterpriseDisabled"), flags, 2)
        this.vtbl.get_EnterpriseUninstallable := CallbackCreate(GetMethod(implObj, "get_EnterpriseUninstallable"), flags, 2)
        this.vtbl.get_IsVisibleOnAppList := CallbackCreate(GetMethod(implObj, "get_IsVisibleOnAppList"), flags, 2)
        this.vtbl.get_IsInboxApp := CallbackCreate(GetMethod(implObj, "get_IsInboxApp"), flags, 2)
        this.vtbl.get_StorageID := CallbackCreate(GetMethod(implObj, "get_StorageID"), flags, 2)
        this.vtbl.get_StartAppBlob := CallbackCreate(GetMethod(implObj, "get_StartAppBlob"), flags, 2)
        this.vtbl.get_IsMovable := CallbackCreate(GetMethod(implObj, "get_IsMovable"), flags, 2)
        this.vtbl.get_DeploymentAppEnumerationHubFilter := CallbackCreate(GetMethod(implObj, "get_DeploymentAppEnumerationHubFilter"), flags, 2)
        this.vtbl.get_ModifiedDate := CallbackCreate(GetMethod(implObj, "get_ModifiedDate"), flags, 2)
        this.vtbl.get_IsOriginallyRestored := CallbackCreate(GetMethod(implObj, "get_IsOriginallyRestored"), flags, 2)
        this.vtbl.get_ShouldDeferMdilBind := CallbackCreate(GetMethod(implObj, "get_ShouldDeferMdilBind"), flags, 2)
        this.vtbl.get_IsFullyPreInstall := CallbackCreate(GetMethod(implObj, "get_IsFullyPreInstall"), flags, 2)
        this.vtbl.set_IsMdilMaintenanceNeeded := CallbackCreate(GetMethod(implObj, "set_IsMdilMaintenanceNeeded"), flags, 2)
        this.vtbl.set_Title := CallbackCreate(GetMethod(implObj, "set_Title"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ProductID)
        CallbackFree(this.vtbl.get_InstanceID)
        CallbackFree(this.vtbl.get_OfferID)
        CallbackFree(this.vtbl.get_DefaultTask)
        CallbackFree(this.vtbl.get_AppTitle)
        CallbackFree(this.vtbl.get_IconPath)
        CallbackFree(this.vtbl.get_NotificationState)
        CallbackFree(this.vtbl.get_AppInstallType)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_IsRevoked)
        CallbackFree(this.vtbl.get_UpdateAvailable)
        CallbackFree(this.vtbl.get_InstallDate)
        CallbackFree(this.vtbl.get_IsUninstallable)
        CallbackFree(this.vtbl.get_IsThemable)
        CallbackFree(this.vtbl.get_IsTrial)
        CallbackFree(this.vtbl.get_InstallPath)
        CallbackFree(this.vtbl.get_DataRoot)
        CallbackFree(this.vtbl.get_Genre)
        CallbackFree(this.vtbl.get_Publisher)
        CallbackFree(this.vtbl.get_Author)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.get_InvocationInfo)
        CallbackFree(this.vtbl.get_AppPlatMajorVersion)
        CallbackFree(this.vtbl.get_AppPlatMinorVersion)
        CallbackFree(this.vtbl.get_PublisherID)
        CallbackFree(this.vtbl.get_IsMultiCore)
        CallbackFree(this.vtbl.get_SID)
        CallbackFree(this.vtbl.get_AppPlatMajorVersionLightUp)
        CallbackFree(this.vtbl.get_AppPlatMinorVersionLightUp)
        CallbackFree(this.vtbl.set_UpdateAvailable)
        CallbackFree(this.vtbl.set_NotificationState)
        CallbackFree(this.vtbl.set_IconPath)
        CallbackFree(this.vtbl.set_UninstallableState)
        CallbackFree(this.vtbl.get_IsPinableOnKidZone)
        CallbackFree(this.vtbl.get_IsOriginallyPreInstalled)
        CallbackFree(this.vtbl.get_IsInstallOnSD)
        CallbackFree(this.vtbl.get_IsOptoutOnSD)
        CallbackFree(this.vtbl.get_IsOptoutBackupRestore)
        CallbackFree(this.vtbl.set_EnterpriseDisabled)
        CallbackFree(this.vtbl.set_EnterpriseUninstallable)
        CallbackFree(this.vtbl.get_EnterpriseDisabled)
        CallbackFree(this.vtbl.get_EnterpriseUninstallable)
        CallbackFree(this.vtbl.get_IsVisibleOnAppList)
        CallbackFree(this.vtbl.get_IsInboxApp)
        CallbackFree(this.vtbl.get_StorageID)
        CallbackFree(this.vtbl.get_StartAppBlob)
        CallbackFree(this.vtbl.get_IsMovable)
        CallbackFree(this.vtbl.get_DeploymentAppEnumerationHubFilter)
        CallbackFree(this.vtbl.get_ModifiedDate)
        CallbackFree(this.vtbl.get_IsOriginallyRestored)
        CallbackFree(this.vtbl.get_ShouldDeferMdilBind)
        CallbackFree(this.vtbl.get_IsFullyPreInstall)
        CallbackFree(this.vtbl.set_IsMdilMaintenanceNeeded)
        CallbackFree(this.vtbl.set_Title)
    }
}
