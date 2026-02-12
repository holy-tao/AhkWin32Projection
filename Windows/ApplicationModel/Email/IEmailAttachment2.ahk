#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailAttachment2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailAttachment2
     * @type {Guid}
     */
    static IID => Guid("{225f1070-b0ff-4571-9d54-a706c48d55c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_ContentId", "put_ContentId", "get_ContentLocation", "put_ContentLocation", "get_DownloadState", "put_DownloadState", "get_EstimatedDownloadSizeInBytes", "put_EstimatedDownloadSizeInBytes", "get_IsFromBaseMessage", "get_IsInline", "put_IsInline", "get_MimeType", "put_MimeType"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    ContentId {
        get => this.get_ContentId()
        set => this.put_ContentId(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContentLocation {
        get => this.get_ContentLocation()
        set => this.put_ContentLocation(value)
    }

    /**
     * @type {Integer} 
     */
    DownloadState {
        get => this.get_DownloadState()
        set => this.put_DownloadState(value)
    }

    /**
     * @type {Integer} 
     */
    EstimatedDownloadSizeInBytes {
        get => this.get_EstimatedDownloadSizeInBytes()
        set => this.put_EstimatedDownloadSizeInBytes(value)
    }

    /**
     * @type {Boolean} 
     */
    IsFromBaseMessage {
        get => this.get_IsFromBaseMessage()
    }

    /**
     * @type {Boolean} 
     */
    IsInline {
        get => this.get_IsInline()
        set => this.put_IsInline(value)
    }

    /**
     * @type {HSTRING} 
     */
    MimeType {
        get => this.get_MimeType()
        set => this.put_MimeType(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentId() {
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
    put_ContentId(value) {
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
    get_ContentLocation() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
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
    put_ContentLocation(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadState() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_DownloadState(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedDownloadSizeInBytes() {
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
    put_EstimatedDownloadSizeInBytes(value) {
        result := ComCall(14, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFromBaseMessage() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInline() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsInline(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MimeType() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
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
    put_MimeType(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
