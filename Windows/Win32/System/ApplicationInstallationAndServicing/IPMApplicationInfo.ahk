#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pInstanceID 
     * @returns {HRESULT} 
     */
    get_InstanceID(pInstanceID) {
        result := ComCall(4, this, "ptr", pInstanceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pOfferID 
     * @returns {HRESULT} 
     */
    get_OfferID(pOfferID) {
        result := ComCall(5, this, "ptr", pOfferID, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pIsNotified 
     * @returns {HRESULT} 
     */
    get_NotificationState(pIsNotified) {
        result := ComCall(9, this, "ptr", pIsNotified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAppInstallType 
     * @returns {HRESULT} 
     */
    get_AppInstallType(pAppInstallType) {
        pAppInstallTypeMarshal := pAppInstallType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pAppInstallTypeMarshal, pAppInstallType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pStateMarshal, pState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRevoked 
     * @returns {HRESULT} 
     */
    get_IsRevoked(pIsRevoked) {
        result := ComCall(12, this, "ptr", pIsRevoked, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsUpdateAvailable 
     * @returns {HRESULT} 
     */
    get_UpdateAvailable(pIsUpdateAvailable) {
        result := ComCall(13, this, "ptr", pIsUpdateAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pInstallDate 
     * @returns {HRESULT} 
     */
    get_InstallDate(pInstallDate) {
        result := ComCall(14, this, "ptr", pInstallDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsUninstallable 
     * @returns {HRESULT} 
     */
    get_IsUninstallable(pIsUninstallable) {
        result := ComCall(15, this, "ptr", pIsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsThemable 
     * @returns {HRESULT} 
     */
    get_IsThemable(pIsThemable) {
        result := ComCall(16, this, "ptr", pIsThemable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsTrial 
     * @returns {HRESULT} 
     */
    get_IsTrial(pIsTrial) {
        result := ComCall(17, this, "ptr", pIsTrial, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pGenre 
     * @returns {HRESULT} 
     */
    get_Genre(pGenre) {
        pGenreMarshal := pGenre is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pGenreMarshal, pGenre, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pMajorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMajorVersion(pMajorVer) {
        pMajorVerMarshal := pMajorVer is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, pMajorVerMarshal, pMajorVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMinorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMinorVersion(pMinorVer) {
        pMinorVerMarshal := pMinorVer is VarRef ? "char*" : "ptr"

        result := ComCall(27, this, pMinorVerMarshal, pMinorVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pPublisherID 
     * @returns {HRESULT} 
     */
    get_PublisherID(pPublisherID) {
        result := ComCall(28, this, "ptr", pPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsMultiCore 
     * @returns {HRESULT} 
     */
    get_IsMultiCore(pIsMultiCore) {
        result := ComCall(29, this, "ptr", pIsMultiCore, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pMajorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMajorVersionLightUp(pMajorVer) {
        pMajorVerMarshal := pMajorVer is VarRef ? "char*" : "ptr"

        result := ComCall(31, this, pMajorVerMarshal, pMajorVer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMinorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMinorVersionLightUp(pMinorVer) {
        pMinorVerMarshal := pMinorVer is VarRef ? "char*" : "ptr"

        result := ComCall(32, this, pMinorVerMarshal, pMinorVer, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pIsPinable 
     * @returns {HRESULT} 
     */
    get_IsPinableOnKidZone(pIsPinable) {
        result := ComCall(37, this, "ptr", pIsPinable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsPreinstalled 
     * @returns {HRESULT} 
     */
    get_IsOriginallyPreInstalled(pIsPreinstalled) {
        result := ComCall(38, this, "ptr", pIsPreinstalled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInstallOnSD 
     * @returns {HRESULT} 
     */
    get_IsInstallOnSD(pIsInstallOnSD) {
        result := ComCall(39, this, "ptr", pIsInstallOnSD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsOptoutOnSD 
     * @returns {HRESULT} 
     */
    get_IsOptoutOnSD(pIsOptoutOnSD) {
        result := ComCall(40, this, "ptr", pIsOptoutOnSD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsOptoutBackupRestore 
     * @returns {HRESULT} 
     */
    get_IsOptoutBackupRestore(pIsOptoutBackupRestore) {
        result := ComCall(41, this, "ptr", pIsOptoutBackupRestore, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} IsDisabled 
     * @returns {HRESULT} 
     */
    get_EnterpriseDisabled(IsDisabled) {
        result := ComCall(44, this, "ptr", IsDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsUninstallable 
     * @returns {HRESULT} 
     */
    get_EnterpriseUninstallable(IsUninstallable) {
        result := ComCall(45, this, "ptr", IsUninstallable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsVisible 
     * @returns {HRESULT} 
     */
    get_IsVisibleOnAppList(pIsVisible) {
        result := ComCall(46, this, "ptr", pIsVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInboxApp 
     * @returns {HRESULT} 
     */
    get_IsInboxApp(pIsInboxApp) {
        result := ComCall(47, this, "ptr", pIsInboxApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pStorageID 
     * @returns {HRESULT} 
     */
    get_StorageID(pStorageID) {
        result := ComCall(48, this, "ptr", pStorageID, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} pIsMovable 
     * @returns {HRESULT} 
     */
    get_IsMovable(pIsMovable) {
        result := ComCall(50, this, "ptr", pIsMovable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} HubType 
     * @returns {HRESULT} 
     */
    get_DeploymentAppEnumerationHubFilter(HubType) {
        HubTypeMarshal := HubType is VarRef ? "int*" : "ptr"

        result := ComCall(51, this, HubTypeMarshal, HubType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pModifiedDate 
     * @returns {HRESULT} 
     */
    get_ModifiedDate(pModifiedDate) {
        result := ComCall(52, this, "ptr", pModifiedDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRestored 
     * @returns {HRESULT} 
     */
    get_IsOriginallyRestored(pIsRestored) {
        result := ComCall(53, this, "ptr", pIsRestored, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDeferMdilBind 
     * @returns {HRESULT} 
     */
    get_ShouldDeferMdilBind(pfDeferMdilBind) {
        result := ComCall(54, this, "ptr", pfDeferMdilBind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsFullyPreInstall 
     * @returns {HRESULT} 
     */
    get_IsFullyPreInstall(pfIsFullyPreInstall) {
        result := ComCall(55, this, "ptr", pfIsFullyPreInstall, "HRESULT")
        return result
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
