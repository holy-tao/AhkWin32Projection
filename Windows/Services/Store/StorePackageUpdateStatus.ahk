#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk

/**
 * Provides status info for a package that is associated with a download or installation request.
 * @remarks
 * To request the download or install of a package, use the [RequestDownloadAndInstallStorePackagesAsync](storecontext_requestdownloadandinstallstorepackagesasync_1733414901.md), [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md), or [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md) methods of the [StoreContext](storecontext.md) class. The method that you assign to handle [Progress](../windows.foundation/iasyncoperationwithprogress_2_progress.md) notifications for the request receives a **StorePackageUpdateStatus** object.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdatestatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageUpdateStatus extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The family name of the package that is being downloaded or installed.
     * @type {HSTRING}
     */
    PackageFamilyName{
        get {
            if(!this.HasProp("__PackageFamilyName"))
                this.__PackageFamilyName := HSTRING(0, this)
            return this.__PackageFamilyName
        }
    }

    /**
     * The size of the package that is being downloaded, in bytes. This is an estimate, and it might change during the download process.
     * @type {Integer}
     */
    PackageDownloadSizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of bytes that have been downloaded.
     * @type {Integer}
     */
    PackageBytesDownloaded {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The download (or download and install) progress of the current package, represented by a value from 0.0 to 1.0. When you use [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md) to download packages, this value increases from 0.0 to 1.0 during the download of each package. When you use [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) to download *and* install packages in a single operation, this value increases from 0.0 to 0.8 during the download of each package, and then it increases from 0.8 to 1.0 during the install phase.
     * @type {Float}
     */
    PackageDownloadProgress {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }

    /**
     * The current progress of all package downloads in the request, represented by a value from 0.0 to 1.0.
     * @type {Float}
     */
    TotalDownloadProgress {
        get => NumGet(this, 32, "double")
        set => NumPut("double", value, this, 32)
    }

    /**
     * A [StorePackageUpdateState](storepackageupdatestate.md) value that indicates the state of the package that is being downloaded or installed.
     * @type {Integer}
     */
    PackageUpdateState {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
