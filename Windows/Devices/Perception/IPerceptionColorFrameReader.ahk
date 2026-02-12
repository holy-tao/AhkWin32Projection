#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\PerceptionColorFrameSource.ahk
#Include .\PerceptionColorFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionColorFrameReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionColorFrameReader
     * @type {Guid}
     */
    static IID => Guid("{7650f56e-b9f5-461b-83ad-f222af2aaadc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_FrameArrived", "remove_FrameArrived", "get_Source", "get_IsPaused", "put_IsPaused", "TryReadLatestFrame"]

    /**
     * @type {PerceptionColorFrameSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * @type {Boolean} 
     */
    IsPaused {
        get => this.get_IsPaused()
        set => this.put_IsPaused(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameReader, PerceptionColorFrameArrivedEventArgs>} handler 
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
     * @returns {PerceptionColorFrameSource} 
     */
    get_Source() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionColorFrameSource(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPaused() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPaused(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PerceptionColorFrame} 
     */
    TryReadLatestFrame() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionColorFrame(result_)
    }
}
