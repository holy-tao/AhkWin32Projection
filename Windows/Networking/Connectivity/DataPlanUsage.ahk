#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataPlanUsage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data plan specific data usage information for a connection.
 * @remarks
 * Retrieve this object from [ConnectionProfile.GetDataPlanStatus](connectionprofile_getdataplanstatus_2024938217.md). The
 * reported values reflect data that the operator exposes to Windows and can lag behind real-time traffic. Treat the
 * numbers as guidance instead of an absolute truth when deciding whether to throttle transfers.
 * 
 * > [!IMPORTANT]
 * > `DataPlanUsage` can be `null` even when `DataPlanStatus` is present. Guard for a missing value before reading
 * > `MegabytesUsed` to avoid null reference exceptions.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanusage
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DataPlanUsage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPlanUsage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPlanUsage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the total amount of data transferred, in megabytes, over the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanusage.megabytesused
     * @type {Integer} 
     */
    MegabytesUsed {
        get => this.get_MegabytesUsed()
    }

    /**
     * Gets a [DateTime](../windows.foundation/datetime.md) object indicating the date and time when the [MegabytesUsed](dataplanusage_megabytesused.md) property was last updated.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanusage.lastsynctime
     * @type {DateTime} 
     */
    LastSyncTime {
        get => this.get_LastSyncTime()
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
    get_MegabytesUsed() {
        if (!this.HasProp("__IDataPlanUsage")) {
            if ((queryResult := this.QueryInterface(IDataPlanUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanUsage := IDataPlanUsage(outPtr)
        }

        return this.__IDataPlanUsage.get_MegabytesUsed()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSyncTime() {
        if (!this.HasProp("__IDataPlanUsage")) {
            if ((queryResult := this.QueryInterface(IDataPlanUsage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanUsage := IDataPlanUsage(outPtr)
        }

        return this.__IDataPlanUsage.get_LastSyncTime()
    }

;@endregion Instance Methods
}
