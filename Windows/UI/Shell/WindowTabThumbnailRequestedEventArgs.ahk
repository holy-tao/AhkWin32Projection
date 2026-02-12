#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabThumbnailRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the `WindowTabManager.TabThumbnailRequested` event.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabThumbnailRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabThumbnailRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabThumbnailRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the window tab for which the system has requested a thumbnail image.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs.tab
     * @type {WindowTab} 
     */
    Tab {
        get => this.get_Tab()
    }

    /**
     * Gets the size requested by the system for the thumbnail image.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs.requestedsize
     * @type {BitmapSize} 
     */
    RequestedSize {
        get => this.get_RequestedSize()
    }

    /**
     * Gets or sets the thumbnail image of the tab to be displayed by the system.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs.image
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Gets a value that indicates whether the thumbnail is composited on the window.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs.iscompositedonwindow
     * @type {Boolean} 
     */
    IsCompositedOnWindow {
        get => this.get_IsCompositedOnWindow()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowTab} 
     */
    get_Tab() {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.get_Tab()
    }

    /**
     * 
     * @returns {BitmapSize} 
     */
    get_RequestedSize() {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.get_RequestedSize()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.get_Image()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.put_Image(value)
    }

    /**
     * Gets a deferral object that delays the completion of the event until the generation of the thumbnail image is complete.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabthumbnailrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompositedOnWindow() {
        if (!this.HasProp("__IWindowTabThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowTabThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabThumbnailRequestedEventArgs := IWindowTabThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IWindowTabThumbnailRequestedEventArgs.get_IsCompositedOnWindow()
    }

;@endregion Instance Methods
}
