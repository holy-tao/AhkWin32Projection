#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls.Provider
 * @version WindowsRuntime 1.4
 */
class IPhoneCallOriginManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallOriginManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{ccfc5a0a-9af7-6149-39d0-e076fcce1395}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsCurrentAppActiveCallOriginApp", "ShowPhoneCallOriginSettingsUI", "SetCallOrigin"]

    /**
     * @type {Boolean} 
     */
    IsCurrentAppActiveCallOriginApp {
        get => this.get_IsCurrentAppActiveCallOriginApp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCurrentAppActiveCallOriginApp() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowPhoneCallOriginSettingsUI() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} requestId 
     * @param {PhoneCallOrigin} callOrigin 
     * @returns {HRESULT} 
     */
    SetCallOrigin(requestId, callOrigin) {
        result := ComCall(8, this, "ptr", requestId, "ptr", callOrigin, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
