#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Direct3D11CaptureFrame.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\GraphicsCaptureSession.ahk
#Include ..\..\System\DispatcherQueue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IDirect3D11CaptureFramePool extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3D11CaptureFramePool
     * @type {Guid}
     */
    static IID => Guid("{24eb6d22-1975-422e-82e7-780dbd8ddf24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Recreate", "TryGetNextFrame", "add_FrameArrived", "remove_FrameArrived", "CreateCaptureSession", "get_DispatcherQueue"]

    /**
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

    /**
     * 
     * @param {IDirect3DDevice} device 
     * @param {Integer} pixelFormat 
     * @param {Integer} numberOfBuffers 
     * @param {SizeInt32} size_ 
     * @returns {HRESULT} 
     */
    Recreate(device, pixelFormat, numberOfBuffers, size_) {
        result := ComCall(6, this, "ptr", device, "int", pixelFormat, "int", numberOfBuffers, "ptr", size_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Direct3D11CaptureFrame} 
     */
    TryGetNextFrame() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Direct3D11CaptureFrame(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<Direct3D11CaptureFramePool, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FrameArrived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GraphicsCaptureItem} item 
     * @returns {GraphicsCaptureSession} 
     */
    CreateCaptureSession(item) {
        result := ComCall(10, this, "ptr", item, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GraphicsCaptureSession(result_)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DispatcherQueue(value)
    }
}
