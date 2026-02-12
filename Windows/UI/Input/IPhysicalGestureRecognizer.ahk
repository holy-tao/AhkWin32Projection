#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IPhysicalGestureRecognizer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhysicalGestureRecognizer
     * @type {Guid}
     */
    static IID => Guid("{79a29f4d-32a6-5aa5-a999-42b0b420c66d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsActive", "get_GestureSettings", "put_GestureSettings", "get_TapMinContactCount", "put_TapMinContactCount", "get_TapMaxContactCount", "put_TapMaxContactCount", "get_HoldMinContactCount", "put_HoldMinContactCount", "get_HoldMaxContactCount", "put_HoldMaxContactCount", "get_HoldRadius", "put_HoldRadius", "get_HoldStartDelay", "put_HoldStartDelay", "get_TranslationMinContactCount", "put_TranslationMinContactCount", "get_TranslationMaxContactCount", "put_TranslationMaxContactCount", "ProcessDownEvent", "ProcessMoveEvents", "ProcessUpEvent", "CompleteGesture", "add_ManipulationStarted", "remove_ManipulationStarted", "add_ManipulationUpdated", "remove_ManipulationUpdated", "add_ManipulationCompleted", "remove_ManipulationCompleted", "add_Tapped", "remove_Tapped", "add_Holding", "remove_Holding"]

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {Integer} 
     */
    GestureSettings {
        get => this.get_GestureSettings()
        set => this.put_GestureSettings(value)
    }

    /**
     * @type {Integer} 
     */
    TapMinContactCount {
        get => this.get_TapMinContactCount()
        set => this.put_TapMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TapMaxContactCount {
        get => this.get_TapMaxContactCount()
        set => this.put_TapMaxContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMinContactCount {
        get => this.get_HoldMinContactCount()
        set => this.put_HoldMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMaxContactCount {
        get => this.get_HoldMaxContactCount()
        set => this.put_HoldMaxContactCount(value)
    }

    /**
     * @type {Float} 
     */
    HoldRadius {
        get => this.get_HoldRadius()
        set => this.put_HoldRadius(value)
    }

    /**
     * @type {TimeSpan} 
     */
    HoldStartDelay {
        get => this.get_HoldStartDelay()
        set => this.put_HoldStartDelay(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMinContactCount {
        get => this.get_TranslationMinContactCount()
        set => this.put_TranslationMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMaxContactCount {
        get => this.get_TranslationMaxContactCount()
        set => this.put_TranslationMaxContactCount(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_GestureSettings() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
    put_GestureSettings(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMinContactCount() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_TapMinContactCount(value) {
        result := ComCall(10, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMaxContactCount() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
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
    put_TapMaxContactCount(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMinContactCount() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
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
    put_HoldMinContactCount(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMaxContactCount() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
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
    put_HoldMaxContactCount(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HoldRadius() {
        result := ComCall(17, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HoldRadius(value) {
        result := ComCall(18, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HoldStartDelay() {
        value := TimeSpan()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_HoldStartDelay(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMinContactCount() {
        result := ComCall(21, this, "uint*", &value := 0, "int")
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
    put_TranslationMinContactCount(value) {
        result := ComCall(22, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMaxContactCount() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
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
    put_TranslationMaxContactCount(value) {
        result := ComCall(24, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessDownEvent(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IVector<PointerPoint>} value 
     * @returns {HRESULT} 
     */
    ProcessMoveEvents(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PointerPoint} value 
     * @returns {HRESULT} 
     */
    ProcessUpEvent(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CompleteGesture() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(29, this, "ptr", handler, "ptr", token, "int")
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
    remove_ManipulationStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(30, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationUpdated(handler) {
        token := EventRegistrationToken()
        result := ComCall(31, this, "ptr", handler, "ptr", token, "int")
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
    remove_ManipulationUpdated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(32, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, ManipulationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ManipulationCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(33, this, "ptr", handler, "ptr", token, "int")
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
    remove_ManipulationCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(34, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, TappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Tapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", handler, "ptr", token, "int")
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
    remove_Tapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PhysicalGestureRecognizer, HoldingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Holding(handler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", handler, "ptr", token, "int")
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
    remove_Holding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
