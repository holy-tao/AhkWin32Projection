#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\VisualTransition.ahk
#Include .\VisualState.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IVisualStateGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualStateGroup
     * @type {Guid}
     */
    static IID => Guid("{e4f9d9a4-e028-44de-9b15-4929ae0a26c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Transitions", "get_States", "get_CurrentState", "add_CurrentStateChanged", "remove_CurrentStateChanged", "add_CurrentStateChanging", "remove_CurrentStateChanging"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {IVector<VisualTransition>} 
     */
    Transitions {
        get => this.get_Transitions()
    }

    /**
     * @type {IVector<VisualState>} 
     */
    States {
        get => this.get_States()
    }

    /**
     * @type {VisualState} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<VisualTransition>} 
     */
    get_Transitions() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VisualTransition, value)
    }

    /**
     * 
     * @returns {IVector<VisualState>} 
     */
    get_States() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(VisualState, value)
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_CurrentState() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VisualState(value)
    }

    /**
     * 
     * @param {VisualStateChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_CurrentStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {VisualStateChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_CurrentStateChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
