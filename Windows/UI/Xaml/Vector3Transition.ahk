#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVector3Transition.ahk
#Include .\IVector3TransitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior when an element's Translation or Scale properties change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.vector3transition
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Vector3Transition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVector3Transition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVector3Transition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Vector3Transition} 
     */
    static CreateInstance() {
        if (!Vector3Transition.HasProp("__IVector3TransitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Vector3Transition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVector3TransitionFactory.IID)
            Vector3Transition.__IVector3TransitionFactory := IVector3TransitionFactory(factoryPtr)
        }

        return Vector3Transition.__IVector3TransitionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the duration of the transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.vector3transition.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that specifies whether to animate changes in the three subchannels of the Vector3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.vector3transition.components
     * @type {Integer} 
     */
    Components {
        get => this.get_Components()
        set => this.put_Components(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IVector3Transition")) {
            if ((queryResult := this.QueryInterface(IVector3Transition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector3Transition := IVector3Transition(outPtr)
        }

        return this.__IVector3Transition.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IVector3Transition")) {
            if ((queryResult := this.QueryInterface(IVector3Transition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector3Transition := IVector3Transition(outPtr)
        }

        return this.__IVector3Transition.put_Duration(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Components() {
        if (!this.HasProp("__IVector3Transition")) {
            if ((queryResult := this.QueryInterface(IVector3Transition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector3Transition := IVector3Transition(outPtr)
        }

        return this.__IVector3Transition.get_Components()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Components(value) {
        if (!this.HasProp("__IVector3Transition")) {
            if ((queryResult := this.QueryInterface(IVector3Transition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVector3Transition := IVector3Transition(outPtr)
        }

        return this.__IVector3Transition.put_Components(value)
    }

;@endregion Instance Methods
}
