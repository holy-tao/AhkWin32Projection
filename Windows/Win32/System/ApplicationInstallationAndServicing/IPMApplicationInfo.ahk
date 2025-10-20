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
     * 
     * @param {Pointer<Guid>} pProductID 
     * @returns {HRESULT} 
     */
    get_ProductID(pProductID) {
        result := ComCall(3, this, "ptr", pProductID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pInstanceID 
     * @returns {HRESULT} 
     */
    get_InstanceID(pInstanceID) {
        result := ComCall(4, this, "ptr", pInstanceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pOfferID 
     * @returns {HRESULT} 
     */
    get_OfferID(pOfferID) {
        result := ComCall(5, this, "ptr", pOfferID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDefaultTask 
     * @returns {HRESULT} 
     */
    get_DefaultTask(pDefaultTask) {
        result := ComCall(6, this, "ptr", pDefaultTask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppTitle 
     * @returns {HRESULT} 
     */
    get_AppTitle(pAppTitle) {
        result := ComCall(7, this, "ptr", pAppTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAppIconPath 
     * @returns {HRESULT} 
     */
    get_IconPath(pAppIconPath) {
        result := ComCall(8, this, "ptr", pAppIconPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsNotified 
     * @returns {HRESULT} 
     */
    get_NotificationState(pIsNotified) {
        result := ComCall(9, this, "ptr", pIsNotified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAppInstallType 
     * @returns {HRESULT} 
     */
    get_AppInstallType(pAppInstallType) {
        result := ComCall(10, this, "int*", pAppInstallType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    get_State(pState) {
        result := ComCall(11, this, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRevoked 
     * @returns {HRESULT} 
     */
    get_IsRevoked(pIsRevoked) {
        result := ComCall(12, this, "ptr", pIsRevoked, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsUpdateAvailable 
     * @returns {HRESULT} 
     */
    get_UpdateAvailable(pIsUpdateAvailable) {
        result := ComCall(13, this, "ptr", pIsUpdateAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pInstallDate 
     * @returns {HRESULT} 
     */
    get_InstallDate(pInstallDate) {
        result := ComCall(14, this, "ptr", pInstallDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsUninstallable 
     * @returns {HRESULT} 
     */
    get_IsUninstallable(pIsUninstallable) {
        result := ComCall(15, this, "ptr", pIsUninstallable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsThemable 
     * @returns {HRESULT} 
     */
    get_IsThemable(pIsThemable) {
        result := ComCall(16, this, "ptr", pIsThemable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsTrial 
     * @returns {HRESULT} 
     */
    get_IsTrial(pIsTrial) {
        result := ComCall(17, this, "ptr", pIsTrial, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pInstallPath 
     * @returns {HRESULT} 
     */
    get_InstallPath(pInstallPath) {
        result := ComCall(18, this, "ptr", pInstallPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDataRoot 
     * @returns {HRESULT} 
     */
    get_DataRoot(pDataRoot) {
        result := ComCall(19, this, "ptr", pDataRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pGenre 
     * @returns {HRESULT} 
     */
    get_Genre(pGenre) {
        result := ComCall(20, this, "int*", pGenre, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pPublisher 
     * @returns {HRESULT} 
     */
    get_Publisher(pPublisher) {
        result := ComCall(21, this, "ptr", pPublisher, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pAuthor 
     * @returns {HRESULT} 
     */
    get_Author(pAuthor) {
        result := ComCall(22, this, "ptr", pAuthor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDescription 
     * @returns {HRESULT} 
     */
    get_Description(pDescription) {
        result := ComCall(23, this, "ptr", pDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVersion 
     * @returns {HRESULT} 
     */
    get_Version(pVersion) {
        result := ComCall(24, this, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(25, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pMajorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMajorVersion(pMajorVer) {
        result := ComCall(26, this, "char*", pMajorVer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pMinorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMinorVersion(pMinorVer) {
        result := ComCall(27, this, "char*", pMinorVer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pPublisherID 
     * @returns {HRESULT} 
     */
    get_PublisherID(pPublisherID) {
        result := ComCall(28, this, "ptr", pPublisherID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsMultiCore 
     * @returns {HRESULT} 
     */
    get_IsMultiCore(pIsMultiCore) {
        result := ComCall(29, this, "ptr", pIsMultiCore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSID 
     * @returns {HRESULT} 
     */
    get_SID(pSID) {
        result := ComCall(30, this, "ptr", pSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pMajorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMajorVersionLightUp(pMajorVer) {
        result := ComCall(31, this, "char*", pMajorVer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pMinorVer 
     * @returns {HRESULT} 
     */
    get_AppPlatMinorVersionLightUp(pMinorVer) {
        result := ComCall(32, this, "char*", pMinorVer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsUpdateAvailable 
     * @returns {HRESULT} 
     */
    set_UpdateAvailable(IsUpdateAvailable) {
        result := ComCall(33, this, "int", IsUpdateAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsNotified 
     * @returns {HRESULT} 
     */
    set_NotificationState(IsNotified) {
        result := ComCall(34, this, "int", IsNotified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} AppIconPath 
     * @returns {HRESULT} 
     */
    set_IconPath(AppIconPath) {
        AppIconPath := AppIconPath is String ? BSTR.Alloc(AppIconPath).Value : AppIconPath

        result := ComCall(35, this, "ptr", AppIconPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_UninstallableState(IsUninstallable) {
        result := ComCall(36, this, "int", IsUninstallable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsPinable 
     * @returns {HRESULT} 
     */
    get_IsPinableOnKidZone(pIsPinable) {
        result := ComCall(37, this, "ptr", pIsPinable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsPreinstalled 
     * @returns {HRESULT} 
     */
    get_IsOriginallyPreInstalled(pIsPreinstalled) {
        result := ComCall(38, this, "ptr", pIsPreinstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInstallOnSD 
     * @returns {HRESULT} 
     */
    get_IsInstallOnSD(pIsInstallOnSD) {
        result := ComCall(39, this, "ptr", pIsInstallOnSD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsOptoutOnSD 
     * @returns {HRESULT} 
     */
    get_IsOptoutOnSD(pIsOptoutOnSD) {
        result := ComCall(40, this, "ptr", pIsOptoutOnSD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsOptoutBackupRestore 
     * @returns {HRESULT} 
     */
    get_IsOptoutBackupRestore(pIsOptoutBackupRestore) {
        result := ComCall(41, this, "ptr", pIsOptoutBackupRestore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsDisabled 
     * @returns {HRESULT} 
     */
    set_EnterpriseDisabled(IsDisabled) {
        result := ComCall(42, this, "int", IsDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} IsUninstallable 
     * @returns {HRESULT} 
     */
    set_EnterpriseUninstallable(IsUninstallable) {
        result := ComCall(43, this, "int", IsUninstallable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsDisabled 
     * @returns {HRESULT} 
     */
    get_EnterpriseDisabled(IsDisabled) {
        result := ComCall(44, this, "ptr", IsDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} IsUninstallable 
     * @returns {HRESULT} 
     */
    get_EnterpriseUninstallable(IsUninstallable) {
        result := ComCall(45, this, "ptr", IsUninstallable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsVisible 
     * @returns {HRESULT} 
     */
    get_IsVisibleOnAppList(pIsVisible) {
        result := ComCall(46, this, "ptr", pIsVisible, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsInboxApp 
     * @returns {HRESULT} 
     */
    get_IsInboxApp(pIsInboxApp) {
        result := ComCall(47, this, "ptr", pIsInboxApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pStorageID 
     * @returns {HRESULT} 
     */
    get_StorageID(pStorageID) {
        result := ComCall(48, this, "ptr", pStorageID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PM_STARTAPPBLOB>} pBlob 
     * @returns {HRESULT} 
     */
    get_StartAppBlob(pBlob) {
        result := ComCall(49, this, "ptr", pBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsMovable 
     * @returns {HRESULT} 
     */
    get_IsMovable(pIsMovable) {
        result := ComCall(50, this, "ptr", pIsMovable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} HubType 
     * @returns {HRESULT} 
     */
    get_DeploymentAppEnumerationHubFilter(HubType) {
        result := ComCall(51, this, "int*", HubType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pModifiedDate 
     * @returns {HRESULT} 
     */
    get_ModifiedDate(pModifiedDate) {
        result := ComCall(52, this, "ptr", pModifiedDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsRestored 
     * @returns {HRESULT} 
     */
    get_IsOriginallyRestored(pIsRestored) {
        result := ComCall(53, this, "ptr", pIsRestored, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDeferMdilBind 
     * @returns {HRESULT} 
     */
    get_ShouldDeferMdilBind(pfDeferMdilBind) {
        result := ComCall(54, this, "ptr", pfDeferMdilBind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsFullyPreInstall 
     * @returns {HRESULT} 
     */
    get_IsFullyPreInstall(pfIsFullyPreInstall) {
        result := ComCall(55, this, "ptr", pfIsFullyPreInstall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fIsMdilMaintenanceNeeded 
     * @returns {HRESULT} 
     */
    set_IsMdilMaintenanceNeeded(fIsMdilMaintenanceNeeded) {
        result := ComCall(56, this, "int", fIsMdilMaintenanceNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} AppTitle 
     * @returns {HRESULT} 
     */
    set_Title(AppTitle) {
        AppTitle := AppTitle is String ? BSTR.Alloc(AppTitle).Value : AppTitle

        result := ComCall(57, this, "ptr", AppTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
