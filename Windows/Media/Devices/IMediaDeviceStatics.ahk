#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class IMediaDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{aa2d9a40-909f-4bba-bf8b-0c0d296f14f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAudioCaptureSelector", "GetAudioRenderSelector", "GetVideoCaptureSelector", "GetDefaultAudioCaptureId", "GetDefaultAudioRenderId", "add_DefaultAudioCaptureDeviceChanged", "remove_DefaultAudioCaptureDeviceChanged", "add_DefaultAudioRenderDeviceChanged", "remove_DefaultAudioRenderDeviceChanged"]

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAudioCaptureSelector() {
        selector_ := HSTRING()
        result := ComCall(6, this, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAudioRenderSelector() {
        selector_ := HSTRING()
        result := ComCall(7, this, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetVideoCaptureSelector() {
        selector_ := HSTRING()
        result := ComCall(8, this, "ptr", selector_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return selector_
    }

    /**
     * 
     * @param {Integer} role 
     * @returns {HSTRING} 
     */
    GetDefaultAudioCaptureId(role) {
        deviceId := HSTRING()
        result := ComCall(9, this, "int", role, "ptr", deviceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceId
    }

    /**
     * 
     * @param {Integer} role 
     * @returns {HSTRING} 
     */
    GetDefaultAudioRenderId(role) {
        deviceId := HSTRING()
        result := ComCall(10, this, "int", role, "ptr", deviceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return deviceId
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, DefaultAudioCaptureDeviceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DefaultAudioCaptureDeviceChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DefaultAudioCaptureDeviceChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(12, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, DefaultAudioRenderDeviceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DefaultAudioRenderDeviceChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DefaultAudioRenderDeviceChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(14, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
