#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScrollViewerViewChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ViewChanged](scrollviewer_viewchanged.md) event and similar control-specific events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ScrollViewerViewChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollViewerViewChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollViewerViewChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the underlying manipulation that raised the event is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.scrollviewerviewchangedeventargs.isintermediate
     * @type {Boolean} 
     */
    IsIntermediate {
        get => this.get_IsIntermediate()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScrollViewerViewChangedEventArgs](scrollviewerviewchangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ScrollViewerViewChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIntermediate() {
        if (!this.HasProp("__IScrollViewerViewChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollViewerViewChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollViewerViewChangedEventArgs := IScrollViewerViewChangedEventArgs(outPtr)
        }

        return this.__IScrollViewerViewChangedEventArgs.get_IsIntermediate()
    }

;@endregion Instance Methods
}
