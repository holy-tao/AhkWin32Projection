#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\HolographicFramePresentationMonitor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicSpace2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpace2
     * @type {Guid}
     */
    static IID => Guid("{4f81a9a8-b7ff-4883-9827-7d677287ea70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserPresence", "add_UserPresenceChanged", "remove_UserPresenceChanged", "WaitForNextFrameReady", "WaitForNextFrameReadyWithHeadStart", "CreateFramePresentationMonitor"]

    /**
     * @type {Integer} 
     */
    UserPresence {
        get => this.get_UserPresence()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserPresence() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserPresenceChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
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
    remove_UserPresenceChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForNextFrameReady() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimeSpan} requestedHeadStartDuration 
     * @returns {HRESULT} 
     */
    WaitForNextFrameReadyWithHeadStart(requestedHeadStartDuration) {
        result := ComCall(10, this, "ptr", requestedHeadStartDuration, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} maxQueuedReports 
     * @returns {HolographicFramePresentationMonitor} 
     */
    CreateFramePresentationMonitor(maxQueuedReports) {
        result := ComCall(11, this, "uint", maxQueuedReports, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicFramePresentationMonitor(result_)
    }
}
