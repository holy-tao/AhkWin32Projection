#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidBooleanControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a simple Boolean control on a HID device that returns on/off values. An example would be the LED light on a keyboard.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidBooleanControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidBooleanControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidBooleanControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for a given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the usage page for a given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier associated with the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

    /**
     * Gets a Boolean value indicating whether the given Boolean control is active.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
        set => this.put_IsActive(value)
    }

    /**
     * Gets a description of the given Boolean control.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidbooleancontrol.controldescription
     * @type {HidBooleanControlDescription} 
     */
    ControlDescription {
        get => this.get_ControlDescription()
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
    get_Id() {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.get_UsageId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.get_IsActive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsActive(value) {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.put_IsActive(value)
    }

    /**
     * 
     * @returns {HidBooleanControlDescription} 
     */
    get_ControlDescription() {
        if (!this.HasProp("__IHidBooleanControl")) {
            if ((queryResult := this.QueryInterface(IHidBooleanControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidBooleanControl := IHidBooleanControl(outPtr)
        }

        return this.__IHidBooleanControl.get_ControlDescription()
    }

;@endregion Instance Methods
}
