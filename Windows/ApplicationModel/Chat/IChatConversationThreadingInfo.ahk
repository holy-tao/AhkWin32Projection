#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatConversationThreadingInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatConversationThreadingInfo
     * @type {Guid}
     */
    static IID => Guid("{331c21dc-7a07-4422-a32c-24be7c6dab24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactId", "put_ContactId", "get_Custom", "put_Custom", "get_ConversationId", "put_ConversationId", "get_Participants", "get_Kind", "put_Kind"]

    /**
     * @type {HSTRING} 
     */
    ContactId {
        get => this.get_ContactId()
        set => this.put_ContactId(value)
    }

    /**
     * @type {HSTRING} 
     */
    Custom {
        get => this.get_Custom()
        set => this.put_Custom(value)
    }

    /**
     * @type {HSTRING} 
     */
    ConversationId {
        get => this.get_ConversationId()
        set => this.put_ConversationId(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    Participants {
        get => this.get_Participants()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactId() {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Custom() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Custom(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConversationId() {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ConversationId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Participants() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
