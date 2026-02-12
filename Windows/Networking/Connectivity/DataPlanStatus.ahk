#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataPlanStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents current data plan status (limits, usage, cycle metadata) for a connection profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class DataPlanStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataPlanStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataPlanStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [DataPlanUsage](dataplanusage.md) object that indicates the amount of data transferred over the connection, in megabytes, and the last time this value was refreshed.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.dataplanusage
     * @type {DataPlanUsage} 
     */
    DataPlanUsage {
        get => this.get_DataPlanUsage()
    }

    /**
     * Gets a value indicating the maximum data transfer allowance for a connection within each billing cycle, as defined by the data plan.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.datalimitinmegabytes
     * @type {IReference<Integer>} 
     */
    DataLimitInMegabytes {
        get => this.get_DataLimitInMegabytes()
    }

    /**
     * Gets a value indicating the nominal rate of the inbound data transfer occurring on the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.inboundbitspersecond
     * @type {IReference<Integer>} 
     */
    InboundBitsPerSecond {
        get => this.get_InboundBitsPerSecond()
    }

    /**
     * Gets a value indicating the nominal rate of the outbound data transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.outboundbitspersecond
     * @type {IReference<Integer>} 
     */
    OutboundBitsPerSecond {
        get => this.get_OutboundBitsPerSecond()
    }

    /**
     * Gets a value indicating the date and time of the next billing cycle.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.nextbillingcycle
     * @type {IReference<DateTime>} 
     */
    NextBillingCycle {
        get => this.get_NextBillingCycle()
    }

    /**
     * Gets a value indicates the maximum size of a transfer that is allowed without user consent on a metered network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.dataplanstatus.maxtransfersizeinmegabytes
     * @type {IReference<Integer>} 
     */
    MaxTransferSizeInMegabytes {
        get => this.get_MaxTransferSizeInMegabytes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPlanUsage} 
     */
    get_DataPlanUsage() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_DataPlanUsage()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DataLimitInMegabytes() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_DataLimitInMegabytes()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_InboundBitsPerSecond() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_InboundBitsPerSecond()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OutboundBitsPerSecond() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_OutboundBitsPerSecond()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_NextBillingCycle() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_NextBillingCycle()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_MaxTransferSizeInMegabytes() {
        if (!this.HasProp("__IDataPlanStatus")) {
            if ((queryResult := this.QueryInterface(IDataPlanStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataPlanStatus := IDataPlanStatus(outPtr)
        }

        return this.__IDataPlanStatus.get_MaxTransferSizeInMegabytes()
    }

;@endregion Instance Methods
}
