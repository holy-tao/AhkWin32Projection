#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIOControlCode.ahk
#Include .\IIOControlCodeFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the control code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IOControlCode extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIOControlCode

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIOControlCode.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * The control code.
     * @param {Integer} deviceType The device type.
     * @param {Integer} function The device function.
     * @param {Integer} accessMode The access mode.
     * @param {Integer} bufferingMethod The buffering method.
     * @returns {IOControlCode} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.#ctor
     */
    static CreateIOControlCode(deviceType, function, accessMode, bufferingMethod) {
        if (!IOControlCode.HasProp("__IIOControlCodeFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Custom.IOControlCode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIOControlCodeFactory.IID)
            IOControlCode.__IIOControlCodeFactory := IIOControlCodeFactory(factoryPtr)
        }

        return IOControlCode.__IIOControlCodeFactory.CreateIOControlCode(deviceType, function, accessMode, bufferingMethod)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The access mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.accessmode
     * @type {Integer} 
     */
    AccessMode {
        get => this.get_AccessMode()
    }

    /**
     * The buffering method.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.bufferingmethod
     * @type {Integer} 
     */
    BufferingMethod {
        get => this.get_BufferingMethod()
    }

    /**
     * The function.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.function
     * @type {Integer} 
     */
    Function {
        get => this.get_Function()
    }

    /**
     * The device type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.devicetype
     * @type {Integer} 
     */
    DeviceType {
        get => this.get_DeviceType()
    }

    /**
     * The control code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iocontrolcode.controlcode
     * @type {Integer} 
     */
    ControlCode {
        get => this.get_ControlCode()
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
    get_AccessMode() {
        if (!this.HasProp("__IIOControlCode")) {
            if ((queryResult := this.QueryInterface(IIOControlCode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIOControlCode := IIOControlCode(outPtr)
        }

        return this.__IIOControlCode.get_AccessMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferingMethod() {
        if (!this.HasProp("__IIOControlCode")) {
            if ((queryResult := this.QueryInterface(IIOControlCode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIOControlCode := IIOControlCode(outPtr)
        }

        return this.__IIOControlCode.get_BufferingMethod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Function() {
        if (!this.HasProp("__IIOControlCode")) {
            if ((queryResult := this.QueryInterface(IIOControlCode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIOControlCode := IIOControlCode(outPtr)
        }

        return this.__IIOControlCode.get_Function()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceType() {
        if (!this.HasProp("__IIOControlCode")) {
            if ((queryResult := this.QueryInterface(IIOControlCode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIOControlCode := IIOControlCode(outPtr)
        }

        return this.__IIOControlCode.get_DeviceType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlCode() {
        if (!this.HasProp("__IIOControlCode")) {
            if ((queryResult := this.QueryInterface(IIOControlCode.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIOControlCode := IIOControlCode(outPtr)
        }

        return this.__IIOControlCode.get_ControlCode()
    }

;@endregion Instance Methods
}
