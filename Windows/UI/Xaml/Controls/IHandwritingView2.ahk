#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IHandwritingView2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandwritingView2
     * @type {Guid}
     */
    static IID => Guid("{4bcf991b-0de1-5c9e-8970-37b9878fe171}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSwitchToKeyboardEnabled", "put_IsSwitchToKeyboardEnabled", "get_IsCommandBarOpen", "put_IsCommandBarOpen", "get_InputDeviceTypes", "put_InputDeviceTypes", "add_CandidatesChanged", "remove_CandidatesChanged", "add_TextSubmitted", "remove_TextSubmitted", "GetCandidates", "SelectCandidate"]

    /**
     * @type {Boolean} 
     */
    IsSwitchToKeyboardEnabled {
        get => this.get_IsSwitchToKeyboardEnabled()
        set => this.put_IsSwitchToKeyboardEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCommandBarOpen {
        get => this.get_IsCommandBarOpen()
        set => this.put_IsCommandBarOpen(value)
    }

    /**
     * @type {Integer} 
     */
    InputDeviceTypes {
        get => this.get_InputDeviceTypes()
        set => this.put_InputDeviceTypes(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSwitchToKeyboardEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_IsSwitchToKeyboardEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCommandBarOpen() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_IsCommandBarOpen(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDeviceTypes() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputDeviceTypes(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingViewCandidatesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CandidatesChanged(handler) {
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
    remove_CandidatesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HandwritingView, HandwritingViewTextSubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextSubmitted(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_TextSubmitted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} candidatesSessionId 
     * @returns {IVectorView<HSTRING>} 
     */
    GetCandidates(candidatesSessionId) {
        result := ComCall(16, this, "uint", candidatesSessionId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {Integer} candidatesSessionId 
     * @param {Integer} selectedCandidateIndex 
     * @returns {HRESULT} 
     */
    SelectCandidate(candidatesSessionId, selectedCandidateIndex) {
        result := ComCall(17, this, "uint", candidatesSessionId, "uint", selectedCandidateIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
