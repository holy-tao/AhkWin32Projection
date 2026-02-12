#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceAccessInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceAccessInformation
     * @type {Guid}
     */
    static IID => Guid("{0baa9a73-6de5-4915-8ddd-9a0554a6f545}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AccessChanged", "remove_AccessChanged", "get_CurrentStatus"]

    /**
     * @type {Integer} 
     */
    CurrentStatus {
        get => this.get_CurrentStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<DeviceAccessInformation, DeviceAccessChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AccessChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", cookie, "int")
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
    remove_AccessChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(7, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStatus() {
        result := ComCall(8, this, "int*", &status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status_
    }
}
