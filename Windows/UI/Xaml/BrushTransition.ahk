#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBrushTransition.ahk
#Include .\IBrushTransitionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the animated transition behavior when an element's brush changes. Currently limited to changes between SolidColorBrush objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.brushtransition
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class BrushTransition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBrushTransition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBrushTransition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BrushTransition} 
     */
    static CreateInstance() {
        if (!BrushTransition.HasProp("__IBrushTransitionFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.BrushTransition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrushTransitionFactory.IID)
            BrushTransition.__IBrushTransitionFactory := IBrushTransitionFactory(factoryPtr)
        }

        return BrushTransition.__IBrushTransitionFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the duration of the transition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.brushtransition.duration
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
        if (!this.HasProp("__IBrushTransition")) {
            if ((queryResult := this.QueryInterface(IBrushTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrushTransition := IBrushTransition(outPtr)
        }

        return this.__IBrushTransition.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IBrushTransition")) {
            if ((queryResult := this.QueryInterface(IBrushTransition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrushTransition := IBrushTransition(outPtr)
        }

        return this.__IBrushTransition.put_Duration(value)
    }

;@endregion Instance Methods
}
