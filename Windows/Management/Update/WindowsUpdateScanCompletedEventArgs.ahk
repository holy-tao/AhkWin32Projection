#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateScanCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for the corresponding [WindowsUpdateManager.ScanCompleted](./windowsupdatemanager_scancompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatescancompletedeventargs
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateScanCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateScanCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateScanCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the provider ID associated with the scan-completed event.
     * @remarks
     * The provider ID indicates which update provider was used for the scan. For Windows updates, this will most commonly be "WuProvider".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatescancompletedeventargs.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets a value indicating whether the completed scan succeeded.
     * @remarks
     * This property affords quick reference as to whether a scan was successful. If the scan failed, then you can obtain more information by checking the [ExtendedError](./windowsupdatescancompletedeventargs_extendederror.md) code.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatescancompletedeventargs.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * Gets detailed information about an error associated with a completed scan event.
     * @remarks
     * If the scan completed successfully, then the value is **S_OK** (0). Otherwise, the value is an error code explaining why the scan failed.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatescancompletedeventargs.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets a collection of [WindowsUpdate](./windowsupdate.md) objects discovered by the scan that triggered the scan-completed event.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatescancompletedeventargs.updates
     * @type {IVectorView<WindowsUpdate>} 
     */
    Updates {
        get => this.get_Updates()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IWindowsUpdateScanCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateScanCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateScanCompletedEventArgs := IWindowsUpdateScanCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateScanCompletedEventArgs.get_ProviderId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsUpdateScanCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateScanCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateScanCompletedEventArgs := IWindowsUpdateScanCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateScanCompletedEventArgs.get_Succeeded()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsUpdateScanCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateScanCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateScanCompletedEventArgs := IWindowsUpdateScanCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateScanCompletedEventArgs.get_ExtendedError()
    }

    /**
     * 
     * @returns {IVectorView<WindowsUpdate>} 
     */
    get_Updates() {
        if (!this.HasProp("__IWindowsUpdateScanCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateScanCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateScanCompletedEventArgs := IWindowsUpdateScanCompletedEventArgs(outPtr)
        }

        return this.__IWindowsUpdateScanCompletedEventArgs.get_Updates()
    }

;@endregion Instance Methods
}
