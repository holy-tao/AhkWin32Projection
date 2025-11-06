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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_title
     */
    get_Title() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_autoselectonwebsites
     */
    get_AutoSelectOnWebSites() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_bundledupdates
     */
    get_BundledUpdates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_canrequiresource
     */
    get_CanRequireSource() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {ICategoryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_categories
     */
    get_Categories() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return ICategoryCollection(retval)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deadline
     */
    get_Deadline() {
        retval := VARIANT()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentavailable
     */
    get_DeltaCompressedContentAvailable() {
        result := ComCall(13, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deltacompressedcontentpreferred
     */
    get_DeltaCompressedContentPreferred() {
        result := ComCall(14, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_description
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulaaccepted
     */
    get_EulaAccepted() {
        result := ComCall(16, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_eulatext
     */
    get_EulaText() {
        retval := BSTR()
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_handlerid
     */
    get_HandlerID() {
        retval := BSTR()
        result := ComCall(18, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateIdentity} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_identity
     */
    get_Identity() {
        result := ComCall(19, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateIdentity(retval)
    }

    /**
     * 
     * @returns {IImageInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_image
     */
    get_Image() {
        result := ComCall(20, this, "ptr*", &retval := 0, "HRESULT")
        return IImageInformation(retval)
    }

    /**
     * 
     * @returns {IInstallationBehavior} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_installationbehavior
     */
    get_InstallationBehavior() {
        result := ComCall(21, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isbeta
     */
    get_IsBeta() {
        result := ComCall(22, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isdownloaded
     */
    get_IsDownloaded() {
        result := ComCall(23, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ishidden
     */
    get_IsHidden() {
        result := ComCall(24, this, "short*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isinstalled
     */
    get_IsInstalled() {
        result := ComCall(26, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_ismandatory
     */
    get_IsMandatory() {
        result := ComCall(27, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_isuninstallable
     */
    get_IsUninstallable() {
        result := ComCall(28, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_languages
     */
    get_Languages() {
        result := ComCall(29, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_lastdeploymentchangetime
     */
    get_LastDeploymentChangeTime() {
        result := ComCall(30, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_maxdownloadsize
     */
    get_MaxDownloadSize() {
        retval := DECIMAL()
        result := ComCall(31, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_mindownloadsize
     */
    get_MinDownloadSize() {
        retval := DECIMAL()
        result := ComCall(32, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_moreinfourls
     */
    get_MoreInfoUrls() {
        result := ComCall(33, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_msrcseverity
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedharddiskspace
     */
    get_RecommendedHardDiskSpace() {
        result := ComCall(36, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_recommendedmemory
     */
    get_RecommendedMemory() {
        result := ComCall(37, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_releasenotes
     */
    get_ReleaseNotes() {
        retval := BSTR()
        result := ComCall(38, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_securitybulletinids
     */
    get_SecurityBulletinIDs() {
        result := ComCall(39, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supersededupdateids
     */
    get_SupersededUpdateIDs() {
        result := ComCall(40, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_supporturl
     */
    get_SupportUrl() {
        retval := BSTR()
        result := ComCall(41, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_type
     */
    get_Type() {
        result := ComCall(42, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationnotes
     */
    get_UninstallationNotes() {
        retval := BSTR()
        result := ComCall(43, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IInstallationBehavior} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationbehavior
     */
    get_UninstallationBehavior() {
        result := ComCall(44, this, "ptr*", &retval := 0, "HRESULT")
        return IInstallationBehavior(retval)
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_uninstallationsteps
     */
    get_UninstallationSteps() {
        result := ComCall(45, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * 
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_kbarticleids
     */
    get_KBArticleIDs() {
        result := ComCall(46, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_deploymentaction
     */
    get_DeploymentAction() {
        result := ComCall(48, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadpriority
     */
    get_DownloadPriority() {
        result := ComCall(50, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {IUpdateDownloadContentCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate-get_downloadcontents
     */
    get_DownloadContents() {
        result := ComCall(51, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadContentCollection(retval)
    }
}
