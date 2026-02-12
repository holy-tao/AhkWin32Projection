#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameFocusControl.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the focus settings for a frame in a variable photo sequence.
 * @remarks
 * Get an instance of this class by accessing the [FocusControl](framecontroller_focuscontrol.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscontrol
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameFocusControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameFocusControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameFocusControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the focus value for a frame in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscontrol.value
     * @type {IReference<Integer>} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Value() {
        if (!this.HasProp("__IFrameFocusControl")) {
            if ((queryResult := this.QueryInterface(IFrameFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusControl := IFrameFocusControl(outPtr)
        }

        return this.__IFrameFocusControl.get_Value()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IFrameFocusControl")) {
            if ((queryResult := this.QueryInterface(IFrameFocusControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusControl := IFrameFocusControl(outPtr)
        }

        return this.__IFrameFocusControl.put_Value(value)
    }

;@endregion Instance Methods
}
