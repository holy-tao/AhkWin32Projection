#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeEnteredPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GazeEntered](gazeinputsourcepreview_gazeentered.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeenteredprevieweventargs
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeEnteredPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeEnteredPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeEnteredPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [GazeEntered](gazeinputsourcepreview_gazeentered.md) has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeenteredprevieweventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [gaze pointer](gazepointpreview.md) data from the most recent [GazeEntered](gazeinputsourcepreview_gazeentered.md) event.
     * @remarks
     * The screen coordinates of the gaze point are in device-independent pixels (DIP) relative to, and constrained by, the application view (or gaze-enabled element).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeenteredprevieweventargs.currentpoint
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
        if (!this.HasProp("__IGazeEnteredPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeEnteredPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeEnteredPreviewEventArgs := IGazeEnteredPreviewEventArgs(outPtr)
        }

        return this.__IGazeEnteredPreviewEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IGazeEnteredPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeEnteredPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeEnteredPreviewEventArgs := IGazeEnteredPreviewEventArgs(outPtr)
        }

        return this.__IGazeEnteredPreviewEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {GazePointPreview} 
     */
    get_CurrentPoint() {
        if (!this.HasProp("__IGazeEnteredPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeEnteredPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeEnteredPreviewEventArgs := IGazeEnteredPreviewEventArgs(outPtr)
        }

        return this.__IGazeEnteredPreviewEventArgs.get_CurrentPoint()
    }

;@endregion Instance Methods
}
