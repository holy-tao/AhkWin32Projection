#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeMovedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GazeMoved](gazeinputsourcepreview_gazemoved.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazemovedprevieweventargs
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeMovedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeMovedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeMovedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [GazeMoved](gazeinputsourcepreview_gazemoved.md) event has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazemovedprevieweventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [gaze pointer](gazepointpreview.md) data from the most recent [GazeMoved](gazeinputsourcepreview_gazemoved.md) event.
     * @remarks
     * The screen coordinates of the gaze point are relative to, and constrained by, the application view (or window).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazemovedprevieweventargs.currentpoint
     * @type {GazePointPreview} 
     */
    CurrentPoint {
        get => this.get_CurrentPoint()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IGazeMovedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeMovedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeMovedPreviewEventArgs := IGazeMovedPreviewEventArgs(outPtr)
        }

        return this.__IGazeMovedPreviewEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IGazeMovedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeMovedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeMovedPreviewEventArgs := IGazeMovedPreviewEventArgs(outPtr)
        }

        return this.__IGazeMovedPreviewEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {GazePointPreview} 
     */
    get_CurrentPoint() {
        if (!this.HasProp("__IGazeMovedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeMovedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeMovedPreviewEventArgs := IGazeMovedPreviewEventArgs(outPtr)
        }

        return this.__IGazeMovedPreviewEventArgs.get_CurrentPoint()
    }

    /**
     * Retrieves the [gaze point](gazepointpreview.md) data for each gaze location logged since the most recent [GazeMoved](gazeinputsourcepreview_gazemoved.md) event, up to and including the current event.
     * @remarks
     * The screen coordinates of the gaze points are in device-independent pixels (DIP) relative to, and constrained by, the application view (or gaze-enabled element).
     * 
     * The most recent [gaze point](gazepointpreview.md) object retrieved by this method is equivalent to that retrieved by the [CurrentPoint](gazemovedprevieweventargs_currentpoint.md) method.
     * @returns {IVector<GazePointPreview>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazemovedprevieweventargs.getintermediatepoints
     */
    GetIntermediatePoints() {
        if (!this.HasProp("__IGazeMovedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeMovedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeMovedPreviewEventArgs := IGazeMovedPreviewEventArgs(outPtr)
        }

        return this.__IGazeMovedPreviewEventArgs.GetIntermediatePoints()
    }

;@endregion Instance Methods
}
