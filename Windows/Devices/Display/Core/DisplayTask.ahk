#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayTask.ahk
#Include .\IDisplayTask2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a set of operations that can be queued and executed atomically by display hardware.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytask
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTask extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayTask

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayTask.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets this [DisplayTask](displaytask.md) to present content to a source using the parameters specified by a [DisplayScanout](displayscanout.md) when executed.
     * @param {DisplayScanout} scanout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytask.setscanout
     */
    SetScanout(scanout) {
        if (!this.HasProp("__IDisplayTask")) {
            if ((queryResult := this.QueryInterface(IDisplayTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTask := IDisplayTask(outPtr)
        }

        return this.__IDisplayTask.SetScanout(scanout)
    }

    /**
     * Sets the operations for this [DisplayTask](displaytask.md) to occur once the specified GPU fence is signaled with the specified value.
     * @param {DisplayFence} readyFence A [DisplayFence](displayfence.md) object representing the GPU fence to wait on before performing this task's operations.
     * @param {Integer} readyFenceValue The value of the GPU fence to wait on.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytask.setwait
     */
    SetWait(readyFence, readyFenceValue) {
        if (!this.HasProp("__IDisplayTask")) {
            if ((queryResult := this.QueryInterface(IDisplayTask.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTask := IDisplayTask(outPtr)
        }

        return this.__IDisplayTask.SetWait(readyFence, readyFenceValue)
    }

    /**
     * Creates a fence as part of the presentation pipeline, which will be signaled at a specified point in time by the graphics scheduler. You can **SetSignal** multiple times to provide fences for multiple events for the primary buffer that's part of the current present.
     * 
     * The fence value that is signaled is the value that's returned from [DisplayTaskPool.TryExecuteTask](/uwp/api/windows.devices.display.core.displaytaskpool.tryexecutetask) in the [DisplayTaskResult.PresentId](/uwp/api/windows.devices.display.core.displaytaskresult.presentid) property (it's very probable that it will increase by 1 with each Present).
     * @remarks
     * Synchronizing between rendering to, and presentation of, a given set of primary buffers avoids front-buffer rendering.
     * @param {Integer} signalKind A [DisplayTaskSignalKind](displaytasksignalkind.md) value specfying what kind of fence to use.
     * 
     * **OnPresentFlipAway**. This fence is signaled once the primary buffer it was attached to is no longer being scanned out by the GPU. The most common use of the *FlipAway* fence will be for apps to queue GPU render work on a given primary buffer, and put the render work behind a *FlipAway* fence to make sure that the primary buffer is free to render, and is not being actively scanned out by the GPU. This helps avoid any FBR (front buffer rendering), while still allowing the app to queue multiple render work in advance.
     * 
     * **OnPresentFlipTo**. This fence is signaled once the primary buffer it was attached to becomes the current primary buffer being scanned out by the GPU. The most common use of *FlipTo* fences is for the app to get stats about the presentation pipeline. For example, your app can calculate using this fence the latency between present submission, and present reaching the physical display. Another example is for your app to know which of the presents that the app requested actually made it to the physical display.
     * @param {DisplayFence} fence A [DisplayFence](displayfence.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytask.setsignal
     */
    SetSignal(signalKind, fence) {
        if (!this.HasProp("__IDisplayTask2")) {
            if ((queryResult := this.QueryInterface(IDisplayTask2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTask2 := IDisplayTask2(outPtr)
        }

        return this.__IDisplayTask2.SetSignal(signalKind, fence)
    }

;@endregion Instance Methods
}
