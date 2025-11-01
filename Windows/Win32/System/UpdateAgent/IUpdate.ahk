#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_title
     */
    get_Title(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_autoselectonwebsites
     */
    get_AutoSelectOnWebSites(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_bundledupdates
     */
    get_BundledUpdates(retval) {
        result := ComCall(9, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_canrequiresource
     */
    get_CanRequireSource(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICategoryCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_categories
     */
    get_Categories(retval) {
        result := ComCall(11, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deadline
     */
    get_Deadline(retval) {
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentavailable
     */
    get_DeltaCompressedContentAvailable(retval) {
        result := ComCall(13, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentpreferred
     */
    get_DeltaCompressedContentPreferred(retval) {
        result := ComCall(14, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_description
     */
    get_Description(retval) {
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulaaccepted
     */
    get_EulaAccepted(retval) {
        result := ComCall(16, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulatext
     */
    get_EulaText(retval) {
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_handlerid
     */
    get_HandlerID(retval) {
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateIdentity>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_identity
     */
    get_Identity(retval) {
        result := ComCall(19, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IImageInformation>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_image
     */
    get_Image(retval) {
        result := ComCall(20, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationBehavior>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_installationbehavior
     */
    get_InstallationBehavior(retval) {
        result := ComCall(21, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isbeta
     */
    get_IsBeta(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isdownloaded
     */
    get_IsDownloaded(retval) {
        result := ComCall(23, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ishidden
     */
    get_IsHidden(retval) {
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-put_ishidden
     */
    put_IsHidden(value) {
        result := ComCall(25, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isinstalled
     */
    get_IsInstalled(retval) {
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ismandatory
     */
    get_IsMandatory(retval) {
        result := ComCall(27, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isuninstallable
     */
    get_IsUninstallable(retval) {
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_languages
     */
    get_Languages(retval) {
        result := ComCall(29, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_lastdeploymentchangetime
     */
    get_LastDeploymentChangeTime(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(30, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_maxdownloadsize
     */
    get_MaxDownloadSize(retval) {
        result := ComCall(31, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_mindownloadsize
     */
    get_MinDownloadSize(retval) {
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_moreinfourls
     */
    get_MoreInfoUrls(retval) {
        result := ComCall(33, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_msrcseverity
     */
    get_MsrcSeverity(retval) {
        result := ComCall(34, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedcpuspeed
     */
    get_RecommendedCpuSpeed(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace
     */
    get_RecommendedHardDiskSpace(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory
     */
    get_RecommendedMemory(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_releasenotes
     */
    get_ReleaseNotes(retval) {
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_securitybulletinids
     */
    get_SecurityBulletinIDs(retval) {
        result := ComCall(39, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supersededupdateids
     */
    get_SupersededUpdateIDs(retval) {
        result := ComCall(40, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supporturl
     */
    get_SupportUrl(retval) {
        result := ComCall(41, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_type
     */
    get_Type(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationnotes
     */
    get_UninstallationNotes(retval) {
        result := ComCall(43, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInstallationBehavior>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationbehavior
     */
    get_UninstallationBehavior(retval) {
        result := ComCall(44, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationsteps
     */
    get_UninstallationSteps(retval) {
        result := ComCall(45, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStringCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_kbarticleids
     */
    get_KBArticleIDs(retval) {
        result := ComCall(46, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-accepteula
     */
    AcceptEula() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deploymentaction
     */
    get_DeploymentAction(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} path 
     * @param {VARIANT_BOOL} toExtractCabFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-copyfromcache
     */
    CopyFromCache(path, toExtractCabFiles) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(49, this, "ptr", path, "short", toExtractCabFiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadpriority
     */
    get_DownloadPriority(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(50, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUpdateDownloadContentCollection>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadcontents
     */
    get_DownloadContents(retval) {
        result := ComCall(51, this, "ptr*", retval, "HRESULT")
        return result
    }
}
