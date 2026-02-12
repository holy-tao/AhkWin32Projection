#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDirect3D11CaptureFramePool.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IDirect3D11CaptureFramePoolStatics.ahk
#Include .\IDirect3D11CaptureFramePoolStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Direct3D11CaptureFramePool.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Stores frames captured by the application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class Direct3D11CaptureFramePool extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDirect3D11CaptureFramePool

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDirect3D11CaptureFramePool.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a frame pool.
     * @param {IDirect3DDevice} device The Direct3D device.
     * @param {Integer} pixelFormat The DirectX pixel format of the captured frames.
     * @param {Integer} numberOfBuffers The number of buffers in which to store captured frames.
     * @param {SizeInt32} size_ The size of each buffer.
     * @returns {Direct3D11CaptureFramePool} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.create
     */
    static Create(device, pixelFormat, numberOfBuffers, size_) {
        if (!Direct3D11CaptureFramePool.HasProp("__IDirect3D11CaptureFramePoolStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.Direct3D11CaptureFramePool")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDirect3D11CaptureFramePoolStatics.IID)
            Direct3D11CaptureFramePool.__IDirect3D11CaptureFramePoolStatics := IDirect3D11CaptureFramePoolStatics(factoryPtr)
        }

        return Direct3D11CaptureFramePool.__IDirect3D11CaptureFramePoolStatics.Create(device, pixelFormat, numberOfBuffers, size_)
    }

    /**
     * Creates a frame pool where the dependency on the [DispatcherQueue](direct3d11captureframepool_dispatcherqueue.md) is removed and the [FrameArrived](direct3d11captureframepool_framearrived.md) event is raised on the frame pool's internal worker thread.
     * @param {IDirect3DDevice} device The Direct3D device.
     * @param {Integer} pixelFormat The DirectX pixel format of the captured frames.
     * @param {Integer} numberOfBuffers The number of buffers in which to store captured frames.
     * @param {SizeInt32} size_ The size of each buffer.
     * @returns {Direct3D11CaptureFramePool} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.createfreethreaded
     */
    static CreateFreeThreaded(device, pixelFormat, numberOfBuffers, size_) {
        if (!Direct3D11CaptureFramePool.HasProp("__IDirect3D11CaptureFramePoolStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Capture.Direct3D11CaptureFramePool")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDirect3D11CaptureFramePoolStatics2.IID)
            Direct3D11CaptureFramePool.__IDirect3D11CaptureFramePoolStatics2 := IDirect3D11CaptureFramePoolStatics2(factoryPtr)
        }

        return Direct3D11CaptureFramePool.__IDirect3D11CaptureFramePoolStatics2.CreateFreeThreaded(device, pixelFormat, numberOfBuffers, size_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The **DispatcherQueue** for the frame pool.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * An event raised when a captured frame is stored in the frame pool.
     * @type {TypedEventHandler<Direct3D11CaptureFramePool, IInspectable>}
    */
    OnFrameArrived {
        get {
            if(!this.HasProp("__OnFrameArrived")){
                this.__OnFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{51a947f7-79cf-5a3e-a3a5-1289cfa6dfe8}"),
                    Direct3D11CaptureFramePool,
                    IInspectable
                )
                this.__OnFrameArrivedToken := this.add_FrameArrived(this.__OnFrameArrived.iface)
            }
            return this.__OnFrameArrived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFrameArrivedToken")) {
            this.remove_FrameArrived(this.__OnFrameArrivedToken)
            this.__OnFrameArrived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * Recreates the frame pool based on the given inputs.
     * @param {IDirect3DDevice} device The Direct3D device.
     * @param {Integer} pixelFormat The DirectX pixel format of the captured frames.
     * @param {Integer} numberOfBuffers The number of buffers in which to store captured frames.
     * @param {SizeInt32} size_ The size of each buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.recreate
     */
    Recreate(device, pixelFormat, numberOfBuffers, size_) {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.Recreate(device, pixelFormat, numberOfBuffers, size_)
    }

    /**
     * Tries to get the next captured frame from the frame pool.
     * @returns {Direct3D11CaptureFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.trygetnextframe
     */
    TryGetNextFrame() {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.TryGetNextFrame()
    }

    /**
     * 
     * @param {TypedEventHandler<Direct3D11CaptureFramePool, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.add_FrameArrived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.remove_FrameArrived(token)
    }

    /**
     * Creates a capture session based on the given capture item and frame pool.
     * @param {GraphicsCaptureItem} item The capture item (the target of the capture).
     * @returns {GraphicsCaptureSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.createcapturesession
     */
    CreateCaptureSession(item) {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.CreateCaptureSession(item)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__IDirect3D11CaptureFramePool")) {
            if ((queryResult := this.QueryInterface(IDirect3D11CaptureFramePool.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDirect3D11CaptureFramePool := IDirect3D11CaptureFramePool(outPtr)
        }

        return this.__IDirect3D11CaptureFramePool.get_DispatcherQueue()
    }

    /**
     * Disposes of the capture frame pool and releases its resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.capture.direct3d11captureframepool.close
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
