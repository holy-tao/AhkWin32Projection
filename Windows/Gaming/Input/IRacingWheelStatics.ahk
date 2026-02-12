#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\RacingWheel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IRacingWheelStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRacingWheelStatics
     * @type {Guid}
     */
    static IID => Guid("{3ac12cd5-581b-4936-9f94-69f1e6514c7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_RacingWheelAdded", "remove_RacingWheelAdded", "add_RacingWheelRemoved", "remove_RacingWheelRemoved", "get_RacingWheels"]

    /**
     * @type {IVectorView<RacingWheel>} 
     */
    RacingWheels {
        get => this.get_RacingWheels()
    }

    /**
     * 
     * @param {EventHandler<RacingWheel>} value 
     * @returns {EventRegistrationToken} 
     */
    add_RacingWheelAdded(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_RacingWheelAdded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {EventHandler<RacingWheel>} value 
     * @returns {EventRegistrationToken} 
     */
    add_RacingWheelRemoved(value) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", value, "ptr", token, "int")
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
    remove_RacingWheelRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<RacingWheel>} 
     */
    get_RacingWheels() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(RacingWheel, value)
    }
}
