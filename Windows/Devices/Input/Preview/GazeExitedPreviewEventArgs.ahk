#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGazeExitedPreviewEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [GazeExited](gazeinputsourcepreview_gazeexited.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeexitedprevieweventargs
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeExitedPreviewEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGazeExitedPreviewEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGazeExitedPreviewEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [GazeExited](gazeinputsourcepreview_gazeexited.md) has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeexitedprevieweventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the [gaze pointer](gazepointpreview.md) data from the most recent [GazeExited](gazeinputsourcepreview_gazeexited.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazeexitedprevieweventargs.currentpoint
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
        if (!this.HasProp("__IGazeExitedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeExitedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeExitedPreviewEventArgs := IGazeExitedPreviewEventArgs(outPtr)
        }

        return this.__IGazeExitedPreviewEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IGazeExitedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeExitedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeExitedPreviewEventArgs := IGazeExitedPreviewEventArgs(outPtr)
        }

        return this.__IGazeExitedPreviewEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {GazePointPreview} 
     */
    get_CurrentPoint() {
        if (!this.HasProp("__IGazeExitedPreviewEventArgs")) {
            if ((queryResult := this.QueryInterface(IGazeExitedPreviewEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGazeExitedPreviewEventArgs := IGazeExitedPreviewEventArgs(outPtr)
        }

        return this.__IGazeExitedPreviewEventArgs.get_CurrentPoint()
    }

;@endregion Instance Methods
}
