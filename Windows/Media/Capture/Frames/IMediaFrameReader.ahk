#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include .\MediaFrameReference.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class IMediaFrameReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaFrameReader
     * @type {Guid}
     */
    static IID => Guid("{e4c94395-2028-48ed-90b0-d1c1b162e24c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_FrameArrived", "remove_FrameArrived", "TryAcquireLatestFrame", "StartAsync", "StopAsync"]

    /**
     * 
     * @param {TypedEventHandler<MediaFrameReader, MediaFrameArrivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FrameArrived(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    TryAcquireLatestFrame() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaFrameReference(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    StartAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    StopAsync() {
        result := ComCall(10, this, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }
}
