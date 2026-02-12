#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayTaskPool.ahk
#Include .\IDisplayTaskPool2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides methods to allocate and execute tasks on a [DisplayDevice](displaydevice.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskpool
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayTaskPool extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayTaskPool

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayTaskPool.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Creates a [DisplayTask](displaytask.md) object.
     * @returns {DisplayTask} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskpool.createtask
     */
    CreateTask() {
        if (!this.HasProp("__IDisplayTaskPool")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskPool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskPool := IDisplayTaskPool(outPtr)
        }

        return this.__IDisplayTaskPool.CreateTask()
    }

    /**
     * Queues a [DisplayTask](displaytask.md) for execution on the device. Tasks are executed asynchronously, so this method returns immediately.
     * 
     * > [!NOTE]
     * > **ExecuteTask** is deprecated in favor of [DisplayTaskPool.TryExecuteTask](displaytaskpool_tryexecutetask_474435703.md), which provides feedback about the state of the presentation request.
     * @param {DisplayTask} task The [DisplayTask](displaytask.md) to queue.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskpool.executetask
     */
    ExecuteTask(task) {
        if (!this.HasProp("__IDisplayTaskPool")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskPool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskPool := IDisplayTaskPool(outPtr)
        }

        return this.__IDisplayTaskPool.ExecuteTask(task)
    }

    /**
     * Queues a [DisplayTask](displaytask.md) for execution on the device. Tasks are executed asynchronously, so this method returns immediately. **TryExecuteTask** provides a [DisplayTaskResult](displaytaskresult.md) object, which affords you multiple pieces of feedback/info regarding the state of the presentation request.
     * @param {DisplayTask} task The [DisplayTask](displaytask.md) to queue.
     * @returns {DisplayTaskResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaytaskpool.tryexecutetask
     */
    TryExecuteTask(task) {
        if (!this.HasProp("__IDisplayTaskPool2")) {
            if ((queryResult := this.QueryInterface(IDisplayTaskPool2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayTaskPool2 := IDisplayTaskPool2(outPtr)
        }

        return this.__IDisplayTaskPool2.TryExecuteTask(task)
    }

;@endregion Instance Methods
}
