#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionPropertyChangeRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A request from an app that's in control of this IPerceptionFrameProvider to update a property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionpropertychangerequest
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionPropertyChangeRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionPropertyChangeRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionPropertyChangeRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the property to change.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionpropertychangerequest.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the requested new value of the property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionpropertychangerequest.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Sets the new status of the request after processing the request.
     * @remarks
     * The value should be set as follows:
     * 
     * + **Windows::Devices::Perception::PerceptionFrameSourcePropertyChangeStatus::Accepted** –  The property has been updated to the new value.
     * + **Windows::Devices::Perception::PerceptionFrameSourcePropertyChangeStatus::PropertyNotSupported** –  The property is not supported on this IPerceptionFrameProvider and can't be set.
     * + **Windows::Devices::Perception::PerceptionFrameSourcePropertyChangeStatus::PropertyReadOnly** –  The property is supported on this IPerceptionFrameProvider but can't be changed.
     * + **Windows::Devices::Perception::PerceptionFrameSourcePropertyChangeStatus::ValueOutOfRange** –  The property is supported on this IPerceptionFrameProvider but the provided new value is outside of the range of accepted values.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionpropertychangerequest.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
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
    get_Name() {
        if (!this.HasProp("__IPerceptionPropertyChangeRequest")) {
            if ((queryResult := this.QueryInterface(IPerceptionPropertyChangeRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionPropertyChangeRequest := IPerceptionPropertyChangeRequest(outPtr)
        }

        return this.__IPerceptionPropertyChangeRequest.get_Name()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__IPerceptionPropertyChangeRequest")) {
            if ((queryResult := this.QueryInterface(IPerceptionPropertyChangeRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionPropertyChangeRequest := IPerceptionPropertyChangeRequest(outPtr)
        }

        return this.__IPerceptionPropertyChangeRequest.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IPerceptionPropertyChangeRequest")) {
            if ((queryResult := this.QueryInterface(IPerceptionPropertyChangeRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionPropertyChangeRequest := IPerceptionPropertyChangeRequest(outPtr)
        }

        return this.__IPerceptionPropertyChangeRequest.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IPerceptionPropertyChangeRequest")) {
            if ((queryResult := this.QueryInterface(IPerceptionPropertyChangeRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionPropertyChangeRequest := IPerceptionPropertyChangeRequest(outPtr)
        }

        return this.__IPerceptionPropertyChangeRequest.put_Status(value)
    }

    /**
     * Gets a Windows::Foundation::Deferral object to allow background processing if needed.
     * @remarks
     * When doing background processing, call GetDeferral() and store the result as well as the * PerceptionPropertyChangeRequest. When background processing is complete, set the Status on the PerceptionPropertyChangeRequest and call Complete() on the deferral before removing references to the objects.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionpropertychangerequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IPerceptionPropertyChangeRequest")) {
            if ((queryResult := this.QueryInterface(IPerceptionPropertyChangeRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionPropertyChangeRequest := IPerceptionPropertyChangeRequest(outPtr)
        }

        return this.__IPerceptionPropertyChangeRequest.GetDeferral()
    }

;@endregion Instance Methods
}
