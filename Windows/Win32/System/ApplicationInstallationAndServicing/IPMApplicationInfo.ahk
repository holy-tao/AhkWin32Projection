#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMApplicationInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMApplicationInfo
     * @type {Guid}
     */
    static IID => Guid("{50afb58a-438c-4088-9789-f8c4899829c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProductID", "get_InstanceID", "get_OfferID", "get_DefaultTask", "get_AppTitle", "get_IconPath", "get_NotificationState", "get_AppInstallType", "get_State", "get_IsRevoked", "get_UpdateAvailable", "get_InstallDate", "get_IsUninstallable", "get_IsThemable", "get_IsTrial", "get_InstallPath", "get_DataRoot", "get_Genre", "get_Publisher", "get_Author", "get_Description", "get_Version", "get_InvocationInfo", "get_AppPlatMajorVersion", "get_AppPlatMinorVersion", "get_PublisherID", "get_IsMultiCore", "get_SID", "get_AppPlatMajorVersionLightUp", "get_AppPlatMinorVersionLightUp", "set_UpdateAvailable", "set_NotificationState", "set_IconPath", "set_UninstallableState", "get_IsPinableOnKidZone", "get_IsOriginallyPreInstalled", "get_IsInstallOnSD", "get_IsOptoutOnSD", "get_IsOptoutBackupRestore", "set_EnterpriseDisabled", "set_EnterpriseUninstallable", "get_EnterpriseDisabled", "get_EnterpriseUninstallable", "get_IsVisibleOnAppList", "get_IsInboxApp", "get_StorageID", "get_StartAppBlob", "get_IsMovable", "get_DeploymentAppEnumerationHubFilter", "get_ModifiedDate", "get_IsOriginallyRestored", "get_ShouldDeferMdilBind", "get_IsFullyPreInstall", "set_IsMdilMaintenanceNeeded", "set_Title"]

    /**
     * 
     * @returns {Guid} 
     */
    get_ProductID() {
        pProductID := Guid()
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return pProductID
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceID() {
        pInstanceID := Guid()
        result := ComCall(4, this, "ptr", pInstanceID, "HRESULT")
        return pInstanceID
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_OfferID() {
        pOfferID := Guid()
        result := ComCall(5, this, "ptr", pOfferID, "HRESULT")
        return pOfferID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultTask 
     * @returns {HRESULT} 
     */
    get_DefaultTask(pDefaultTask) {
        result := ComCall(6, this, "ptr", pDefaultTask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppTitle 
     * @returns {HRESULT} 
     */
    get_AppTitle(pAppTitle) {
        result := ComCall(7, this, "ptr", pAppTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppIconPath 
     * @returns {HRESULT} 
     */
    get_IconPath(pAppIconPath) {
        result := ComCall(8, this, "ptr", pAppIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_NotificationState() {
        result := ComCall(9, this, "int*", &pIsNotified := 0, "HRESULT")
        return pIsNotified
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppInstallType() {
        result := ComCall(10, this, "int*", &pAppInstallType := 0, "HRESULT")
        return pAppInstallType
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(12, this, "int*", &pIsRevoked := 0, "HRESULT")
        return pIsRevoked
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_UpdateAvailable() {
        result := ComCall(13, this, "int*", &pIsUpdateAvailable := 0, "HRESULT")
        return pIsUpdateAvailable
    }

    /**
     * 
     * @returns {FILETIME} 
     */
    get_InstallDate() {
        pInstallDate := FILETIME()
        result := ComCall(14, this, "ptr", pInstallDate, "HRESULT")
        return pInstallDate
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsUninstallable() {
        result := ComCall(15, this, "int*", &pIsUninstallable := 0, "HRESULT")
        return pIsUninstallable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsThemable() {
        result := ComCall(16, this, "int*", &pIsThemable := 0, "HRESULT")
        return pIsThemable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsTrial() {
        result := ComCall(17, this, "int*", &pIsTrial := 0, "HRESULT")
        return pIsTrial
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallPath 
     * @returns {HRESULT} 
     */
    get_InstallPath(pInstallPath) {
        result := ComCall(18, this, "ptr", pInstallPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRoot 
     * @returns {HRESULT} 
     */
    get_DataRoot(pDataRoot) {
        result := ComCall(19, this, "ptr", pDataRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(21, this, "ptr", pPublisher, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     */
    get_Author(pAuthor) {
        result := ComCall(22, this, "ptr", pAuthor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(23, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     */
    get_Version(pVersion) {
        result := ComCall(24, this, "ptr", pVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(25, this, "ptr", pImageUrn, "ptr", pParameters, "HRESULT")
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
        result := ComCall(28, this, "ptr", pPublisherID, "HRESULT")
        return pPublisherID
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMultiCore() {
        result := ComCall(29, this, "int*", &pIsMultiCore := 0, "HRESULT")
        return pIsMultiCore
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSID 
     * @returns {HRESULT} 
     */
    get_SID(pSID) {
        result := ComCall(30, this, "ptr", pSID, "HRESULT")
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
        result := ComCall(33, this, "int", IsUpdateAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsNotified 
     * @returns {HRESULT} 
     */
    set_NotificationState(IsNotified) {
        result := ComCall(34, this, "int", IsNotified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AppIconPath 
     * @returns {HRESULT} 
     */
    set_IconPath(AppIconPath) {
        AppIconPath := AppIconPath is String ? BSTR.Alloc(AppIconPath).Value : AppIconPath

        result := ComCall(35, this, "ptr", AppIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_UninstallableState(IsUninstallable) {
        result := ComCall(36, this, "int", IsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsPinableOnKidZone() {
        result := ComCall(37, this, "int*", &pIsPinable := 0, "HRESULT")
        return pIsPinable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOriginallyPreInstalled() {
        result := ComCall(38, this, "int*", &pIsPreinstalled := 0, "HRESULT")
        return pIsPreinstalled
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInstallOnSD() {
        result := ComCall(39, this, "int*", &pIsInstallOnSD := 0, "HRESULT")
        return pIsInstallOnSD
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptoutOnSD() {
        result := ComCall(40, this, "int*", &pIsOptoutOnSD := 0, "HRESULT")
        return pIsOptoutOnSD
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOptoutBackupRestore() {
        result := ComCall(41, this, "int*", &pIsOptoutBackupRestore := 0, "HRESULT")
        return pIsOptoutBackupRestore
    }

    /**
     * 
     * @param {BOOL} IsDisabled 
     * @returns {HRESULT} 
     */
    set_EnterpriseDisabled(IsDisabled) {
        result := ComCall(42, this, "int", IsDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_EnterpriseUninstallable(IsUninstallable) {
        result := ComCall(43, this, "int", IsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_EnterpriseDisabled() {
        result := ComCall(44, this, "int*", &IsDisabled := 0, "HRESULT")
        return IsDisabled
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_EnterpriseUninstallable() {
        result := ComCall(45, this, "int*", &IsUninstallable := 0, "HRESULT")
        return IsUninstallable
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsVisibleOnAppList() {
        result := ComCall(46, this, "int*", &pIsVisible := 0, "HRESULT")
        return pIsVisible
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsInboxApp() {
        result := ComCall(47, this, "int*", &pIsInboxApp := 0, "HRESULT")
        return pIsInboxApp
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_StorageID() {
        pStorageID := Guid()
        result := ComCall(48, this, "ptr", pStorageID, "HRESULT")
        return pStorageID
    }

    /**
     * 
     * @param {Pointer<PM_STARTAPPBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartAppBlob(pBlob) {
        result := ComCall(49, this, "ptr", pBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsMovable() {
        result := ComCall(50, this, "int*", &pIsMovable := 0, "HRESULT")
        return pIsMovable
    }

    /**
     * 
     * @returns {Integer} 
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
        result := ComCall(52, this, "ptr", pModifiedDate, "HRESULT")
        return pModifiedDate
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsOriginallyRestored() {
        result := ComCall(53, this, "int*", &pIsRestored := 0, "HRESULT")
        return pIsRestored
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_ShouldDeferMdilBind() {
        result := ComCall(54, this, "int*", &pfDeferMdilBind := 0, "HRESULT")
        return pfDeferMdilBind
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_IsFullyPreInstall() {
        result := ComCall(55, this, "int*", &pfIsFullyPreInstall := 0, "HRESULT")
        return pfIsFullyPreInstall
    }

    /**
     * 
     * @param {BOOL} fIsMdilMaintenanceNeeded 
     * @returns {HRESULT} 
     */
    set_IsMdilMaintenanceNeeded(fIsMdilMaintenanceNeeded) {
        result := ComCall(56, this, "int", fIsMdilMaintenanceNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} AppTitle 
     * @returns {HRESULT} 
     */
    set_Title(AppTitle) {
        AppTitle := AppTitle is String ? BSTR.Alloc(AppTitle).Value : AppTitle

        result := ComCall(57, this, "ptr", AppTitle, "HRESULT")
        return result
    }
}
