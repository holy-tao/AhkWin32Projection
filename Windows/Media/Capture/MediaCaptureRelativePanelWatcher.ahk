#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureRelativePanelWatcher.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaCaptureRelativePanelWatcher.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors the panel associated with a [DisplayRegion](/uwp/api/windows.ui.windowmanagement.displayregion), so that the app receives notifications when the relative location of the panel changes.
 * @remarks
 * This API is intended for camera-based scenarios on hinged devices for which the relative location of a display region can change at runtime, allowing apps to modify their camera capture behavior dynamically.
 * 
 * Get an instance of this class by calling [MediaCapture.CreateRelativePanelWatcher](mediacapture_createrelativepanelwatcher_958015644.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureRelativePanelWatcher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureRelativePanelWatcher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureRelativePanelWatcher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the relative panel that the [MediaCaptureRelativePanelWatcher](mediacapturerelativepanelwatcher.md) monitors for changes.
     * @remarks
     * Set the panel associated with the watcher when the object is created by calling [MediaCapture.CreateRelativePanelWatcher](mediacapture_createrelativepanelwatcher_958015644.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher.relativepanel
     * @type {Integer} 
     */
    RelativePanel {
        get => this.get_RelativePanel()
    }

    /**
     * Raised when the relative location of the panel being monitored by the [MediaCaptureRelativePanelWatcher](mediacapturerelativepanelwatcher.md) changes.
     * @remarks
     * This event may be raised on any thread. If you make UI updates in the handler for this event, be sure to dispatch them to the UI thread by making the updates within a call to [CoreDispatcher.RunAsync](/uwp/api/windows.ui.core.coredispatcher.runasync).
     * 
     * Apps should implement a handler for the [DisplayRegion.Changed Event](/en-us/uwp/api/windows.ui.windowmanagement.displayregion.changed) that is raised whenever the **DisplayRegion** associated with the watcher changes. In this handler, apps should dispose of the watcher object, recreate the object, and reregister a handler for the [MediaCaptureRelativePanelWatcher.Changed](mediacapturerelativepanelwatcher_changed.md) event.
     * @type {TypedEventHandler<MediaCaptureRelativePanelWatcher, IInspectable>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e4314ca0-8288-5965-a0d3-67d0b532bdc5}"),
                    MediaCaptureRelativePanelWatcher,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RelativePanel() {
        if (!this.HasProp("__IMediaCaptureRelativePanelWatcher")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureRelativePanelWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureRelativePanelWatcher := IMediaCaptureRelativePanelWatcher(outPtr)
        }

        return this.__IMediaCaptureRelativePanelWatcher.get_RelativePanel()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaCaptureRelativePanelWatcher, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IMediaCaptureRelativePanelWatcher")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureRelativePanelWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureRelativePanelWatcher := IMediaCaptureRelativePanelWatcher(outPtr)
        }

        return this.__IMediaCaptureRelativePanelWatcher.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IMediaCaptureRelativePanelWatcher")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureRelativePanelWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureRelativePanelWatcher := IMediaCaptureRelativePanelWatcher(outPtr)
        }

        return this.__IMediaCaptureRelativePanelWatcher.remove_Changed(token)
    }

    /**
     * Starts the [MediaCaptureRelativePanelWatcher](mediacapturerelativepanelwatcher.md) monitoring of the relative panel location of the associated [DisplayRegion](/uwp/api/windows.ui.windowmanagement.displayregion).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher.start
     */
    Start() {
        if (!this.HasProp("__IMediaCaptureRelativePanelWatcher")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureRelativePanelWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureRelativePanelWatcher := IMediaCaptureRelativePanelWatcher(outPtr)
        }

        return this.__IMediaCaptureRelativePanelWatcher.Start()
    }

    /**
     * Stops the [MediaCaptureRelativePanelWatcher](/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher) monitoring of the relative panel location of the associated [DisplayRegion](/uwp/api/windows.ui.windowmanagement.displayregion).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher.stop
     */
    Stop() {
        if (!this.HasProp("__IMediaCaptureRelativePanelWatcher")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureRelativePanelWatcher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureRelativePanelWatcher := IMediaCaptureRelativePanelWatcher(outPtr)
        }

        return this.__IMediaCaptureRelativePanelWatcher.Stop()
    }

    /**
     * Closes the relative panel watcher and disposes of associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturerelativepanelwatcher.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
