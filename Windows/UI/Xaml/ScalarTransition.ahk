#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScalarTransition.ahk
#Include .\IScalarTransitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior when an element's Opacity or Rotation properties change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.scalartransition
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ScalarTransition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScalarTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScalarTransition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ScalarTransition} 
     */
    static CreateInstance() {
        if (!ScalarTransition.HasProp("__IScalarTransitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ScalarTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScalarTransitionFactory.IID)
            ScalarTransition.__IScalarTransitionFactory := IScalarTransitionFactory(factoryPtr)
        }

        return ScalarTransition.__IScalarTransitionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the duration of the transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.scalartransition.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
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
        if (!this.HasProp("__IScalarTransition")) {
            if ((queryResult := this.QueryInterface(IScalarTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarTransition := IScalarTransition(outPtr)
        }

        return this.__IScalarTransition.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IScalarTransition")) {
            if ((queryResult := this.QueryInterface(IScalarTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScalarTransition := IScalarTransition(outPtr)
        }

        return this.__IScalarTransition.put_Duration(value)
    }

;@endregion Instance Methods
}
