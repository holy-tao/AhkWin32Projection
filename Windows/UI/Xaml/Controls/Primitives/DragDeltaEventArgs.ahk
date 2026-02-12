#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include .\IDragDeltaEventArgs.ahk
#Include .\IDragDeltaEventArgsFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [DragDelta](thumb_dragdelta.md) event that occurs one or more times when a user drags a [Thumb](thumb.md) control with the mouse.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragdeltaeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class DragDeltaEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragDeltaEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragDeltaEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Float} horizontalChange 
     * @param {Float} verticalChange 
     * @returns {DragDeltaEventArgs} 
     */
    static CreateInstanceWithHorizontalChangeAndVerticalChange(horizontalChange, verticalChange) {
        if (!DragDeltaEventArgs.HasProp("__IDragDeltaEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.DragDeltaEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragDeltaEventArgsFactory.IID)
            DragDeltaEventArgs.__IDragDeltaEventArgsFactory := IDragDeltaEventArgsFactory(factoryPtr)
        }

        return DragDeltaEventArgs.__IDragDeltaEventArgsFactory.CreateInstanceWithHorizontalChangeAndVerticalChange(horizontalChange, verticalChange, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the horizontal change in the [Thumb](thumb.md) position since the last [DragDelta](thumb_dragdelta.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragdeltaeventargs.horizontalchange
     * @type {Float} 
     */
    HorizontalChange {
        get => this.get_HorizontalChange()
    }

    /**
     * Gets the vertical change in the [Thumb](thumb.md) position since the last [DragDelta](thumb_dragdelta.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragdeltaeventargs.verticalchange
     * @type {Float} 
     */
    VerticalChange {
        get => this.get_VerticalChange()
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
    get_HorizontalChange() {
        if (!this.HasProp("__IDragDeltaEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragDeltaEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragDeltaEventArgs := IDragDeltaEventArgs(outPtr)
        }

        return this.__IDragDeltaEventArgs.get_HorizontalChange()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalChange() {
        if (!this.HasProp("__IDragDeltaEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragDeltaEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragDeltaEventArgs := IDragDeltaEventArgs(outPtr)
        }

        return this.__IDragDeltaEventArgs.get_VerticalChange()
    }

;@endregion Instance Methods
}
