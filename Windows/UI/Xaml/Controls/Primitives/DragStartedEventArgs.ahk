#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include .\IDragStartedEventArgs.ahk
#Include .\IDragStartedEventArgsFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [DragStarted](thumb_dragstarted.md) event that occurs when a user drags a [Thumb](thumb.md) control with the mouse.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragstartedeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class DragStartedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragStartedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Float} horizontalOffset 
     * @param {Float} verticalOffset 
     * @returns {DragStartedEventArgs} 
     */
    static CreateInstanceWithHorizontalOffsetAndVerticalOffset(horizontalOffset, verticalOffset) {
        if (!DragStartedEventArgs.HasProp("__IDragStartedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.DragStartedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragStartedEventArgsFactory.IID)
            DragStartedEventArgs.__IDragStartedEventArgsFactory := IDragStartedEventArgsFactory(factoryPtr)
        }

        return DragStartedEventArgs.__IDragStartedEventArgsFactory.CreateInstanceWithHorizontalOffsetAndVerticalOffset(horizontalOffset, verticalOffset, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the horizontal distance between the current mouse position and the thumb coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragstartedeventargs.horizontaloffset
     * @type {Float} 
     */
    HorizontalOffset {
        get => this.get_HorizontalOffset()
    }

    /**
     * Gets the vertical distance between the current mouse position and the thumb coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.dragstartedeventargs.verticaloffset
     * @type {Float} 
     */
    VerticalOffset {
        get => this.get_VerticalOffset()
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
    get_HorizontalOffset() {
        if (!this.HasProp("__IDragStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartedEventArgs := IDragStartedEventArgs(outPtr)
        }

        return this.__IDragStartedEventArgs.get_HorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalOffset() {
        if (!this.HasProp("__IDragStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDragStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragStartedEventArgs := IDragStartedEventArgs(outPtr)
        }

        return this.__IDragStartedEventArgs.get_VerticalOffset()
    }

;@endregion Instance Methods
}
