#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\RcsEndUserMessageAction.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsEndUserMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsEndUserMessage
     * @type {Guid}
     */
    static IID => Guid("{d7cda5eb-cbd7-4f3b-8526-b506dec35c53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransportId", "get_Title", "get_Text", "get_IsPinRequired", "get_Actions", "SendResponseAsync", "SendResponseWithPinAsync"]

    /**
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {Boolean} 
     */
    IsPinRequired {
        get => this.get_IsPinRequired()
    }

    /**
     * @type {IVectorView<RcsEndUserMessageAction>} 
     */
    Actions {
        get => this.get_Actions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPinRequired() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVectorView<RcsEndUserMessageAction>} 
     */
    get_Actions() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(RcsEndUserMessageAction, result_)
    }

    /**
     * 
     * @param {RcsEndUserMessageAction} action 
     * @returns {IAsyncAction} 
     */
    SendResponseAsync(action) {
        result := ComCall(11, this, "ptr", action, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {RcsEndUserMessageAction} action 
     * @param {HSTRING} pin 
     * @returns {IAsyncAction} 
     */
    SendResponseWithPinAsync(action, pin) {
        if(pin is String) {
            pin := HSTRING.Create(pin)
            pin := pin.Value
        }
        pin := pin is Win32Handle ? NumGet(pin, "ptr") : pin

        result := ComCall(12, this, "ptr", action, "ptr", pin, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
