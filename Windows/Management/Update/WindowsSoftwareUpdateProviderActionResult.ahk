#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateProviderActionResult.ahk
#Include .\IWindowsSoftwareUpdateProviderActionResultFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProviderActionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateProviderActionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateProviderActionResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} actionResult 
     * @param {Integer} restartReason 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @returns {WindowsSoftwareUpdateProviderActionResult} 
     */
    static CreateInstance(actionResult, restartReason, resultCode, extendedError) {
        if (!WindowsSoftwareUpdateProviderActionResult.HasProp("__IWindowsSoftwareUpdateProviderActionResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateProviderActionResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateProviderActionResultFactory.IID)
            WindowsSoftwareUpdateProviderActionResult.__IWindowsSoftwareUpdateProviderActionResultFactory := IWindowsSoftwareUpdateProviderActionResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateProviderActionResult.__IWindowsSoftwareUpdateProviderActionResultFactory.CreateInstance(actionResult, restartReason, resultCode, extendedError)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {Integer} 
     */
    RestartReason {
        get => this.get_RestartReason()
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
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderActionResult := IWindowsSoftwareUpdateProviderActionResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderActionResult.get_Result()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RestartReason() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderActionResult := IWindowsSoftwareUpdateProviderActionResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderActionResult.get_RestartReason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderActionResult := IWindowsSoftwareUpdateProviderActionResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderActionResult.get_ResultCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderActionResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderActionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderActionResult := IWindowsSoftwareUpdateProviderActionResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderActionResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
