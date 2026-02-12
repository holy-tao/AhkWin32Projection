#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateScanResult.ahk
#Include .\IWindowsSoftwareUpdateScanResultFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateScanResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateScanResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateScanResult.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateScanResult} 
     */
    static CreateInstance(succeeded, resultCode, updates) {
        if (!WindowsSoftwareUpdateScanResult.HasProp("__IWindowsSoftwareUpdateScanResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateScanResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateScanResultFactory.IID)
            WindowsSoftwareUpdateScanResult.__IWindowsSoftwareUpdateScanResultFactory := IWindowsSoftwareUpdateScanResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateScanResult.__IWindowsSoftwareUpdateScanResultFactory.CreateInstance(succeeded, resultCode, updates)
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @param {Integer} resultCode 
     * @param {Integer} extendedError 
     * @param {IIterable<WindowsSoftwareUpdate>} updates 
     * @returns {WindowsSoftwareUpdateScanResult} 
     */
    static CreateInstance2(succeeded, resultCode, extendedError, updates) {
        if (!WindowsSoftwareUpdateScanResult.HasProp("__IWindowsSoftwareUpdateScanResultFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateScanResult")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateScanResultFactory.IID)
            WindowsSoftwareUpdateScanResult.__IWindowsSoftwareUpdateScanResultFactory := IWindowsSoftwareUpdateScanResultFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateScanResult.__IWindowsSoftwareUpdateScanResultFactory.CreateInstance2(succeeded, resultCode, extendedError, updates)
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

    /**
     * @type {IVectorView<WindowsSoftwareUpdate>} 
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
     * @returns {Boolean} 
     */
    get_Succeeded() {
        if (!this.HasProp("__IWindowsSoftwareUpdateScanResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateScanResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateScanResult := IWindowsSoftwareUpdateScanResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateScanResult.get_Succeeded()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResultCode() {
        if (!this.HasProp("__IWindowsSoftwareUpdateScanResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateScanResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateScanResult := IWindowsSoftwareUpdateScanResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateScanResult.get_ResultCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IWindowsSoftwareUpdateScanResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateScanResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateScanResult := IWindowsSoftwareUpdateScanResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateScanResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdate>} 
     */
    get_Updates() {
        if (!this.HasProp("__IWindowsSoftwareUpdateScanResult")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateScanResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateScanResult := IWindowsSoftwareUpdateScanResult(outPtr)
        }

        return this.__IWindowsSoftwareUpdateScanResult.get_Updates()
    }

;@endregion Instance Methods
}
