#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamReference.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IContact3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContact3
     * @type {Guid}
     */
    static IID => Guid("{48201e67-e08e-42a4-b561-41d08ca9575d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContactListId", "get_DisplayPictureUserUpdateTime", "put_DisplayPictureUserUpdateTime", "get_IsMe", "get_AggregateId", "get_RemoteId", "put_RemoteId", "get_RingToneToken", "put_RingToneToken", "get_IsDisplayPictureManuallySet", "get_LargeDisplayPicture", "get_SmallDisplayPicture", "get_SourceDisplayPicture", "put_SourceDisplayPicture", "get_TextToneToken", "put_TextToneToken", "get_IsAggregate", "get_FullName", "get_DisplayNameOverride", "put_DisplayNameOverride", "get_Nickname", "put_Nickname", "get_SortName"]

    /**
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * @type {DateTime} 
     */
    DisplayPictureUserUpdateTime {
        get => this.get_DisplayPictureUserUpdateTime()
        set => this.put_DisplayPictureUserUpdateTime(value)
    }

    /**
     * @type {Boolean} 
     */
    IsMe {
        get => this.get_IsMe()
    }

    /**
     * @type {HSTRING} 
     */
    AggregateId {
        get => this.get_AggregateId()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * @type {HSTRING} 
     */
    RingToneToken {
        get => this.get_RingToneToken()
        set => this.put_RingToneToken(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDisplayPictureManuallySet {
        get => this.get_IsDisplayPictureManuallySet()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    LargeDisplayPicture {
        get => this.get_LargeDisplayPicture()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    SmallDisplayPicture {
        get => this.get_SmallDisplayPicture()
    }

    /**
     * @type {IRandomAccessStreamReference} 
     */
    SourceDisplayPicture {
        get => this.get_SourceDisplayPicture()
        set => this.put_SourceDisplayPicture(value)
    }

    /**
     * @type {HSTRING} 
     */
    TextToneToken {
        get => this.get_TextToneToken()
        set => this.put_TextToneToken(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAggregate {
        get => this.get_IsAggregate()
    }

    /**
     * @type {HSTRING} 
     */
    FullName {
        get => this.get_FullName()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayNameOverride {
        get => this.get_DisplayNameOverride()
        set => this.put_DisplayNameOverride(value)
    }

    /**
     * @type {HSTRING} 
     */
    Nickname {
        get => this.get_Nickname()
        set => this.put_Nickname(value)
    }

    /**
     * @type {HSTRING} 
     */
    SortName {
        get => this.get_SortName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DisplayPictureUserUpdateTime() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_DisplayPictureUserUpdateTime(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMe() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AggregateId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
    put_RemoteId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RingToneToken() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
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
    put_RingToneToken(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisplayPictureManuallySet() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_LargeDisplayPicture() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SmallDisplayPicture() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_SourceDisplayPicture() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamReference(value)
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_SourceDisplayPicture(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextToneToken() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
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
    put_TextToneToken(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAggregate() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FullName() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayNameOverride() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
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
    put_DisplayNameOverride(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nickname() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
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
    put_Nickname(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SortName() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
