#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDirect3D11CaptureFrame.ahk
#Include .\IDirect3D11CaptureFrame2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * A frame captured by the application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframe
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class Direct3D11CaptureFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDirect3D11CaptureFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDirect3D11CaptureFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The Direct3D surface on which the frame was drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframe.surface
     * @type {IDirect3DSurface} 
     */
    Surface {
        get => this.get_Surface()
    }

    /**
     * The [QPC (Query Performance Counter)](/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter) time at which the compositor rendered the frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframe.systemrelativetime
     * @type {TimeSpan} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
    }

    /**
     * The content size at the time the frame was rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframe.contentsize
     * @type {SizeInt32} 
     */
    ContentSize {
        get => this.get_ContentSize()
    }

    /**
     * @type {IVectorView<RectInt32>} 
     */
    DirtyRegions {
        get => this.get_DirtyRegions()
    }

    /**
     * @type {Integer} 
     */
    DirtyRegionMode {
        get => this.get_DirtyRegionMode()
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
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Surface() {
        if (!this.HasProp("__IDirect3D11CaptureFrame")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFrame := IDirect3D11CaptureFrame(outPtr)
        }

        return this.__IDirect3D11CaptureFrame.get_Surface()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IDirect3D11CaptureFrame")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFrame := IDirect3D11CaptureFrame(outPtr)
        }

        return this.__IDirect3D11CaptureFrame.get_SystemRelativeTime()
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_ContentSize() {
        if (!this.HasProp("__IDirect3D11CaptureFrame")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFrame := IDirect3D11CaptureFrame(outPtr)
        }

        return this.__IDirect3D11CaptureFrame.get_ContentSize()
    }

    /**
     * 
     * @returns {IVectorView<RectInt32>} 
     */
    get_DirtyRegions() {
        if (!this.HasProp("__IDirect3D11CaptureFrame2")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFrame2 := IDirect3D11CaptureFrame2(outPtr)
        }

        return this.__IDirect3D11CaptureFrame2.get_DirtyRegions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DirtyRegionMode() {
        if (!this.HasProp("__IDirect3D11CaptureFrame2")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFrame2 := IDirect3D11CaptureFrame2(outPtr)
        }

        return this.__IDirect3D11CaptureFrame2.get_DirtyRegionMode()
    }

    /**
     * Releases the captured frame from memory.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframe.close
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
