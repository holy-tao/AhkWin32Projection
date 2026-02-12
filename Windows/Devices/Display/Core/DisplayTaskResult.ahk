#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayTaskResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents multiple pieces of feedback/info regarding the state of a presentation request, and what you should do about it. A **DisplayTaskResult** object is returned from [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskresult
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTaskResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayTaskResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayTaskResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the most recent call to [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskresult.presentstatus
     * @type {Integer} 
     */
    PresentStatus {
        get => this.get_PresentStatus()
    }

    /**
     * Gets a value representing the number of presents that have been requested on a given [DisplayTaskPool](displaytaskpool.md).
     * @remarks
     * The value returned increments monotonically by 1 on every call to [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md) for a given [DisplayTaskPool](displaytaskpool.md), irrespective of whether the **TryExecuteTask** returned [DisplayPresentStatus.Succeeded](displaypresentstatus.md) in [DisplayTaskResult.PresentStatus](displaytaskresult_presentstatus.md).
     * 
     * The only scenario where **PresentId** won't be incremented is where you call **TryExecuteTask** with invalid parameters, and DirectDisplay runtime validation fails before it calls into the kernel. In those cases, **TryExecuteTask** will fail right away, and return an HRESULT. For a new [DisplayTaskPool](displaytaskpool.md) object, **PresentId** will be reset to 0, and the very first **TryExecuteTask** will return a **PresentId** equal to 1.
     * 
     * One of the common usages of **PresentId** is that you can use it to put a wait on a fence used as an input to [DisplayTask.SetSignal](displaytask_setsignal_711490548.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskresult.presentid
     * @type {Integer} 
     */
    PresentId {
        get => this.get_PresentId()
    }

    /**
     * Gets the current status of the [DisplaySource](displaysource.md) immediately before [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md) returns.
     * @remarks
     * You can also obtain a [DisplaySourceStatus](displaysourcestatus.md) (representing the status of a display source) by accessing the standalone [DisplaySource.Status](displaysource_status.md) property.
     * 
     * Status is returned for [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md) in order to provide a complete picture of the system state that potentially affected the last-requested present.
     * 
     * When [DisplayTaskResult.PresentStatus](displaytaskresult_presentstatus.md) returns a value pointing to a **DisplaySource**, the **SourceStatus** property is useful for determining different error conditions hit by **TryExecuteTask** due to **DisplaySource**. Your DirectDisplay client should also register for the [DisplaySource.StatusChanged](displaysource_statuschanged.md) event. That's because the status of a **DisplaySource** can also change asynchronously to **TryExecuteTask**, and it will give you an indication about when to retry **TryExecuteTask**.
     * 
     * One common usage of **SourceStatus** is when **TryExecuteTask** returns **SourceStatusPreventedPresent** in **PresentStatus**. In that case if the **SourceStatus** is **PoweredOff**, then that specifies a scenario where the most recent present was not queued in the graphics scheduler since the physical display path is considered powered off from the kernel's perspective. You should then look out for the **DisplaySourceStatus** change event, and check when the display is powered on again, and then resume calling **TryExecuteTask**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskresult.sourcestatus
     * @type {Integer} 
     */
    SourceStatus {
        get => this.get_SourceStatus()
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
    get_PresentStatus() {
        if (!this.HasProp("__IDisplayTaskResult")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskResult := IDisplayTaskResult(outPtr)
        }

        return this.__IDisplayTaskResult.get_PresentStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentId() {
        if (!this.HasProp("__IDisplayTaskResult")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskResult := IDisplayTaskResult(outPtr)
        }

        return this.__IDisplayTaskResult.get_PresentId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceStatus() {
        if (!this.HasProp("__IDisplayTaskResult")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskResult := IDisplayTaskResult(outPtr)
        }

        return this.__IDisplayTaskResult.get_SourceStatus()
    }

;@endregion Instance Methods
}
