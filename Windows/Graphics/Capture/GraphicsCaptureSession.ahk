#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGraphicsCaptureSession.ahk
#Include .\IGraphicsCaptureSession2.ahk
#Include .\IGraphicsCaptureSession3.ahk
#Include .\IGraphicsCaptureSession4.ahk
#Include .\IGraphicsCaptureSession5.ahk
#Include .\IGraphicsCaptureSession6.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IGraphicsCaptureSessionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows the application to take screen captures.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCaptureSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGraphicsCaptureSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGraphicsCaptureSession.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns true if screen capture is supported on the device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.issupported
     */
    static IsSupported() {
        if (!GraphicsCaptureSession.HasProp("__IGraphicsCaptureSessionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.GraphicsCaptureSession")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGraphicsCaptureSessionStatics.IID)
            GraphicsCaptureSession.__IGraphicsCaptureSessionStatics := IGraphicsCaptureSessionStatics(factoryPtr)
        }

        return GraphicsCaptureSession.__IGraphicsCaptureSessionStatics.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value specifying whether the capture session will include the cursor in the captured content.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.iscursorcaptureenabled
     * @type {Boolean} 
     */
    IsCursorCaptureEnabled {
        get => this.get_IsCursorCaptureEnabled()
        set => this.put_IsCursorCaptureEnabled(value)
    }

    /**
     * Gets or sets a value specifying whether the capture operation requires a colored border around the window or display to indicate that a capture is in progress.
     * @remarks
     * Before the system will disable the colored border around the a window or display that is being captured, your app must get consent from the user by calling [GraphicsCaptureAccess.RequestAccessAsync](graphicscaptureaccess_requestaccessasync_1551329835.md), passing in the value [GraphicsCaptureAccessKind.Borderless](graphicscaptureaccesskind.md), which displays a prompt to the user. If the user denies access, setting this property to **false** will succeed, but the value will be ignored and the border will be displayed during subsequent captured. To call **RequestAccessAsync** with **GraphicsCaptureAccessKind.Borderless**, you must declare the **graphicsCaptureWithoutBorder** capability in your app's package manifest. For more information, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * 
     * Note that if the **IsBorderRequired** property is set to **true** for the same window or display by other apps on the device, the border will be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.isborderrequired
     * @type {Boolean} 
     */
    IsBorderRequired {
        get => this.get_IsBorderRequired()
        set => this.put_IsBorderRequired(value)
    }

    /**
     * @type {Integer} 
     */
    DirtyRegionMode {
        get => this.get_DirtyRegionMode()
        set => this.put_DirtyRegionMode(value)
    }

    /**
     * @type {TimeSpan} 
     */
    MinUpdateInterval {
        get => this.get_MinUpdateInterval()
        set => this.put_MinUpdateInterval(value)
    }

    /**
     * Gets or sets a value indicating whether secondary windows are included in the capture session.
     * @remarks
     * The default value for this property is false. The property can be changed during the capture.
     * 
     * Secondary Windows are considered to be windows that have either the [WS_POPUP](/windows/win32/winmsg/window-styles) or [WS_EX_TOOLWINDOW](/windows/win32/winmsg/window-styles) styles that intersect the main window, and have only other qualifying secondary windows between it and the main window. The windows are drawn into the texture the app receives and are clipped if they go outside the bounds of the main top level window.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.includesecondarywindows
     * @type {Boolean} 
     */
    IncludeSecondaryWindows {
        get => this.get_IncludeSecondaryWindows()
        set => this.put_IncludeSecondaryWindows(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Starts the capture session, allowing the application to capture frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.startcapture
     */
    StartCapture() {
        if (!this.HasProp("__IGraphicsCaptureSession")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession := IGraphicsCaptureSession(outPtr)
        }

        return this.__IGraphicsCaptureSession.StartCapture()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCursorCaptureEnabled() {
        if (!this.HasProp("__IGraphicsCaptureSession2")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession2 := IGraphicsCaptureSession2(outPtr)
        }

        return this.__IGraphicsCaptureSession2.get_IsCursorCaptureEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCursorCaptureEnabled(value) {
        if (!this.HasProp("__IGraphicsCaptureSession2")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession2 := IGraphicsCaptureSession2(outPtr)
        }

        return this.__IGraphicsCaptureSession2.put_IsCursorCaptureEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBorderRequired() {
        if (!this.HasProp("__IGraphicsCaptureSession3")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession3 := IGraphicsCaptureSession3(outPtr)
        }

        return this.__IGraphicsCaptureSession3.get_IsBorderRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBorderRequired(value) {
        if (!this.HasProp("__IGraphicsCaptureSession3")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession3 := IGraphicsCaptureSession3(outPtr)
        }

        return this.__IGraphicsCaptureSession3.put_IsBorderRequired(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DirtyRegionMode() {
        if (!this.HasProp("__IGraphicsCaptureSession4")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession4 := IGraphicsCaptureSession4(outPtr)
        }

        return this.__IGraphicsCaptureSession4.get_DirtyRegionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DirtyRegionMode(value) {
        if (!this.HasProp("__IGraphicsCaptureSession4")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession4 := IGraphicsCaptureSession4(outPtr)
        }

        return this.__IGraphicsCaptureSession4.put_DirtyRegionMode(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MinUpdateInterval() {
        if (!this.HasProp("__IGraphicsCaptureSession5")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession5 := IGraphicsCaptureSession5(outPtr)
        }

        return this.__IGraphicsCaptureSession5.get_MinUpdateInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MinUpdateInterval(value) {
        if (!this.HasProp("__IGraphicsCaptureSession5")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession5 := IGraphicsCaptureSession5(outPtr)
        }

        return this.__IGraphicsCaptureSession5.put_MinUpdateInterval(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeSecondaryWindows() {
        if (!this.HasProp("__IGraphicsCaptureSession6")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession6 := IGraphicsCaptureSession6(outPtr)
        }

        return this.__IGraphicsCaptureSession6.get_IncludeSecondaryWindows()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeSecondaryWindows(value) {
        if (!this.HasProp("__IGraphicsCaptureSession6")) {
            if ((queryResult := this.QueryInterface(IGraphicsCaptureSession6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsCaptureSession6 := IGraphicsCaptureSession6(outPtr)
        }

        return this.__IGraphicsCaptureSession6.put_IncludeSecondaryWindows(value)
    }

    /**
     * Closes the capture session and releases resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.graphicscapturesession.close
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
