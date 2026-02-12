#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include .\IDragCompletedEventArgs.ahk
#Include .\IDragCompletedEventArgsFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [DragCompleted](thumb_dragcompleted.md) event that occurs when a user completes a drag operation with the mouse of a [Thumb](thumb.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragcompletedeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class DragCompletedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragCompletedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Float} horizontalChange 
     * @param {Float} verticalChange 
     * @param {Boolean} canceled 
     * @returns {DragCompletedEventArgs} 
     */
    static CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled(horizontalChange, verticalChange, canceled) {
        if (!DragCompletedEventArgs.HasProp("__IDragCompletedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.DragCompletedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragCompletedEventArgsFactory.IID)
            DragCompletedEventArgs.__IDragCompletedEventArgsFactory := IDragCompletedEventArgsFactory(factoryPtr)
        }

        return DragCompletedEventArgs.__IDragCompletedEventArgsFactory.CreateInstanceWithHorizontalChangeVerticalChangeAndCanceled(horizontalChange, verticalChange, canceled, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the horizontal distance between the current mouse position and the thumb coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragcompletedeventargs.horizontalchange
     * @type {Float} 
     */
    HorizontalChange {
        get => this.get_HorizontalChange()
    }

    /**
     * Gets the vertical distance between the current mouse position and the thumb coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragcompletedeventargs.verticalchange
     * @type {Float} 
     */
    VerticalChange {
        get => this.get_VerticalChange()
    }

    /**
     * Gets a value that indicates whether the drag operation was canceled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragcompletedeventargs.canceled
     * @type {Boolean} 
     */
    Canceled {
        get => this.get_Canceled()
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
        if (!this.HasProp("__IDragCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragCompletedEventArgs := IDragCompletedEventArgs(outPtr)
        }

        return this.__IDragCompletedEventArgs.get_HorizontalChange()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalChange() {
        if (!this.HasProp("__IDragCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragCompletedEventArgs := IDragCompletedEventArgs(outPtr)
        }

        return this.__IDragCompletedEventArgs.get_VerticalChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Canceled() {
        if (!this.HasProp("__IDragCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragCompletedEventArgs := IDragCompletedEventArgs(outPtr)
        }

        return this.__IDragCompletedEventArgs.get_Canceled()
    }

;@endregion Instance Methods
}
