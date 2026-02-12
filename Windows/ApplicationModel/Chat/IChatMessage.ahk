#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\ChatMessageAttachment.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessage
     * @type {Guid}
     */
    static IID => Guid("{4b39052a-1142-5089-76da-f2db3d17cd05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attachments", "get_Body", "put_Body", "get_From", "get_Id", "get_IsForwardingDisabled", "get_IsIncoming", "get_IsRead", "get_LocalTimestamp", "get_NetworkTimestamp", "get_Recipients", "get_RecipientSendStatuses", "get_Status", "get_Subject", "get_TransportFriendlyName", "get_TransportId", "put_TransportId"]

    /**
     * @type {IVector<ChatMessageAttachment>} 
     */
    Attachments {
        get => this.get_Attachments()
    }

    /**
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * @type {HSTRING} 
     */
    From {
        get => this.get_From()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsForwardingDisabled {
        get => this.get_IsForwardingDisabled()
    }

    /**
     * @type {Boolean} 
     */
    IsIncoming {
        get => this.get_IsIncoming()
    }

    /**
     * @type {Boolean} 
     */
    IsRead {
        get => this.get_IsRead()
    }

    /**
     * @type {DateTime} 
     */
    LocalTimestamp {
        get => this.get_LocalTimestamp()
    }

    /**
     * @type {DateTime} 
     */
    NetworkTimestamp {
        get => this.get_NetworkTimestamp()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    Recipients {
        get => this.get_Recipients()
    }

    /**
     * @type {IMapView<HSTRING, Integer>} 
     */
    RecipientSendStatuses {
        get => this.get_RecipientSendStatuses()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    TransportFriendlyName {
        get => this.get_TransportFriendlyName()
    }

    /**
     * @type {HSTRING} 
     */
    TransportId {
        get => this.get_TransportId()
        set => this.put_TransportId(value)
    }

    /**
     * 
     * @returns {IVector<ChatMessageAttachment>} 
     */
    get_Attachments() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ChatMessageAttachment, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_From() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsForwardingDisabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIncoming() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRead() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LocalTimestamp() {
        value := DateTime()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_NetworkTimestamp() {
        value := DateTime()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Recipients() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, Integer>} 
     */
    get_RecipientSendStatuses() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportFriendlyName() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransportId() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TransportId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
