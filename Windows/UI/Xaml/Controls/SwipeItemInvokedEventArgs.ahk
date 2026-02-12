#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISwipeItemInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SwipeItem.Invoked](swipeitem_invoked.md) event.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItemInvokedEventArgs](/windows/winui/api/microsoft.ui.xaml.controls.swipeiteminvokedeventargs) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeiteminvokedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SwipeItemInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISwipeItemInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISwipeItemInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [SwipeControl](swipecontrol.md) that owns the invoked item.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SwipeItemInvokedEventArgs.SwipeControl](/windows/winui/api/microsoft.ui.xaml.controls.swipeiteminvokedeventargs.swipecontrol) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.swipeiteminvokedeventargs.swipecontrol
     * @type {SwipeControl} 
     */
    SwipeControl {
        get => this.get_SwipeControl()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SwipeControl} 
     */
    get_SwipeControl() {
        if (!this.HasProp("__ISwipeItemInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISwipeItemInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISwipeItemInvokedEventArgs := ISwipeItemInvokedEventArgs(outPtr)
        }

        return this.__ISwipeItemInvokedEventArgs.get_SwipeControl()
    }

;@endregion Instance Methods
}
