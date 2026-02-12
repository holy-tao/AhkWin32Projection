#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateProviderStatus.ahk
#Include .\IWindowsSoftwareUpdateProviderStatusFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WindowsSoftwareUpdateProviderStatus.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProviderStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateProviderStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateProviderStatus.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {HSTRING} providerId 
     * @returns {WindowsSoftwareUpdateProviderStatus} 
     */
    static CreateInstance(providerId) {
        if (!WindowsSoftwareUpdateProviderStatus.HasProp("__IWindowsSoftwareUpdateProviderStatusFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateProviderStatus")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateProviderStatusFactory.IID)
            WindowsSoftwareUpdateProviderStatus.__IWindowsSoftwareUpdateProviderStatusFactory := IWindowsSoftwareUpdateProviderStatusFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateProviderStatus.__IWindowsSoftwareUpdateProviderStatusFactory.CreateInstance(providerId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCancelRequestedToken")) {
            this.remove_CancelRequested(this.__OnCancelRequestedToken)
            this.__OnCancelRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsSoftwareUpdateProviderStatus, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CancelRequested(handler) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderStatus")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderStatus := IWindowsSoftwareUpdateProviderStatus(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderStatus.add_CancelRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CancelRequested(token) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderStatus")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderStatus := IWindowsSoftwareUpdateProviderStatus(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderStatus.remove_CancelRequested(token)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetScanResult(succeeded, resultCode, extendedError, updates) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderStatus")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderStatus := IWindowsSoftwareUpdateProviderStatus(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderStatus.SetScanResult(succeeded, resultCode, extendedError, updates)
    }

    /**
     * 
     * @param {Integer} current 
     * @param {Integer} total 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetActionProgress(current, total) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderStatus")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderStatus := IWindowsSoftwareUpdateProviderStatus(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderStatus.SetActionProgress(current, total)
    }

    /**
     * 
     * @param {WindowsSoftwareUpdateProviderActionResult} actionResult 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    SetActionResult(actionResult) {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderStatus")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderStatus := IWindowsSoftwareUpdateProviderStatus(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderStatus.SetActionResult(actionResult)
    }

;@endregion Instance Methods
}
