#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInertiaRotationBehavior.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls the deceleration of a rotation manipulation during inertia.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiarotationbehavior
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class InertiaRotationBehavior extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInertiaRotationBehavior

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInertiaRotationBehavior.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the rate the rotation slows in degrees per squared millisecond.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiarotationbehavior.desireddeceleration
     * @type {Float} 
     */
    DesiredDeceleration {
        get => this.get_DesiredDeceleration()
        set => this.put_DesiredDeceleration(value)
    }

    /**
     * Gets or sets the rotation, in degrees, at the end of the inertial movement.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.inertiarotationbehavior.desiredrotation
     * @type {Float} 
     */
    DesiredRotation {
        get => this.get_DesiredRotation()
        set => this.put_DesiredRotation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredDeceleration() {
        if (!this.HasProp("__IInertiaRotationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaRotationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaRotationBehavior := IInertiaRotationBehavior(outPtr)
        }

        return this.__IInertiaRotationBehavior.get_DesiredDeceleration()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredDeceleration(value) {
        if (!this.HasProp("__IInertiaRotationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaRotationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaRotationBehavior := IInertiaRotationBehavior(outPtr)
        }

        return this.__IInertiaRotationBehavior.put_DesiredDeceleration(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredRotation() {
        if (!this.HasProp("__IInertiaRotationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaRotationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaRotationBehavior := IInertiaRotationBehavior(outPtr)
        }

        return this.__IInertiaRotationBehavior.get_DesiredRotation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredRotation(value) {
        if (!this.HasProp("__IInertiaRotationBehavior")) {
            if ((queryResult := this.QueryInterface(IInertiaRotationBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInertiaRotationBehavior := IInertiaRotationBehavior(outPtr)
        }

        return this.__IInertiaRotationBehavior.put_DesiredRotation(value)
    }

;@endregion Instance Methods
}
