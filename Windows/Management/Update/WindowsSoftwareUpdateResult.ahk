#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateResult.ahk
#Include .\IWindowsSoftwareUpdateResultFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    static CreateInstance(succeeded, resultCode) {
        if (!WindowsSoftwareUpdateResult.HasProp("__IWindowsSoftwareUpdateResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateResultFactory.IID)
            WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory := IWindowsSoftwareUpdateResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory.CreateInstance(succeeded, resultCode)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    static CreateInstance2(succeeded, resultCode, extendedError) {
        if (!WindowsSoftwareUpdateResult.HasProp("__IWindowsSoftwareUpdateResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateResultFactory.IID)
            WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory := IWindowsSoftwareUpdateResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory.CreateInstance2(succeeded, resultCode, extendedError)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Boolean} cancelRequested 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @returns {WindowsSoftwareUpdateResult} 
     */
    static CreateInstance3(succeeded, cancelRequested, resultCode, extendedError) {
        if (!WindowsSoftwareUpdateResult.HasProp("__IWindowsSoftwareUpdateResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateResultFactory.IID)
            WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory := IWindowsSoftwareUpdateResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateResult.__IWindowsSoftwareUpdateResultFactory.CreateInstance3(succeeded, cancelRequested, resultCode, extendedError)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
    }

    /**
     * @type {Boolean} 
     */
    CancelRequested {
        get => this.get_CancelRequested()
    }

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * @type {Integer} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsSoftwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateResult := IWindowsSoftwareUpdateResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateResult.get_Succeeded()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CancelRequested() {
        if (!this.HasProp("__IWindowsSoftwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateResult := IWindowsSoftwareUpdateResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateResult.get_CancelRequested()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        if (!this.HasProp("__IWindowsSoftwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateResult := IWindowsSoftwareUpdateResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateResult.get_ResultCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsSoftwareUpdateResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateResult := IWindowsSoftwareUpdateResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
