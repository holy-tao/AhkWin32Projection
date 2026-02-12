#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class ISystemSetupInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemSetupInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{b8366a4b-fb6a-4571-be0a-9a0f67954123}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutOfBoxExperienceState", "add_OutOfBoxExperienceStateChanged", "remove_OutOfBoxExperienceStateChanged"]

    /**
     * @type {Integer} 
     */
    OutOfBoxExperienceState {
        get => this.get_OutOfBoxExperienceState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutOfBoxExperienceState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OutOfBoxExperienceStateChanged(handler) {
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
    remove_OutOfBoxExperienceStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
