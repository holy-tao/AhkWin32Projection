#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOfflineMapPackageStartDownloadResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of an asynchronous request to queue the download of a map package onto the local system.
 * @remarks
 * This class doesn't represent the final result of a download. It represents the result of requesting the download to be queued. Downloads are queued even if the network isn't available. Download attempts run in the background. If you want to know when a download completes, and the package is fully available for use, handle the [StatusChanged](offlinemappackage_statuschanged.md) event of the [OfflineMapPackage](offlinemappackage.md). You can use the package offline when the [Status](offlinemappackage_status.md) property of the [OfflineMapPackage](offlinemappackage.md) has a value of **Downloaded**. Packages may take a while to download. You can test download times by using the **Offline Maps** page in system settings to manually download regions.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagestartdownloadresult
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackageStartDownloadResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOfflineMapPackageStartDownloadResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOfflineMapPackageStartDownloadResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of an asynchronous request to download a map package onto the local system.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackagestartdownloadresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IOfflineMapPackageStartDownloadResult")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackageStartDownloadResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackageStartDownloadResult := IOfflineMapPackageStartDownloadResult(outPtr)
        }

        return this.__IOfflineMapPackageStartDownloadResult.get_Status()
    }

;@endregion Instance Methods
}
