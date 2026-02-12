#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFrameSourcePropertyChangeResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about an attempted property change on a frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertychangeresult
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameSourcePropertyChangeResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionFrameSourcePropertyChangeResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionFrameSourcePropertyChangeResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the value of the property after the change request has been processed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertychangeresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets a PerceptionFrameSourcePropertyChangeStatus indicating the status of the change request, including whether or not the change took effect.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertychangeresult.newvalue
     * @type {IInspectable} 
     */
    NewValue {
        get => this.get_NewValue()
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
    get_Status() {
        if (!this.HasProp("__IPerceptionFrameSourcePropertyChangeResult")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameSourcePropertyChangeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameSourcePropertyChangeResult := IPerceptionFrameSourcePropertyChangeResult(outPtr)
        }

        return this.__IPerceptionFrameSourcePropertyChangeResult.get_Status()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_NewValue() {
        if (!this.HasProp("__IPerceptionFrameSourcePropertyChangeResult")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameSourcePropertyChangeResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameSourcePropertyChangeResult := IPerceptionFrameSourcePropertyChangeResult(outPtr)
        }

        return this.__IPerceptionFrameSourcePropertyChangeResult.get_NewValue()
    }

;@endregion Instance Methods
}
