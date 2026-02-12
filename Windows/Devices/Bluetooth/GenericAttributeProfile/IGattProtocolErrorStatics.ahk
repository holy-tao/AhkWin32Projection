#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattProtocolErrorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattProtocolErrorStatics
     * @type {Guid}
     */
    static IID => Guid("{ca46c5c5-0ecc-4809-bea3-cf79bc991e37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InvalidHandle", "get_ReadNotPermitted", "get_WriteNotPermitted", "get_InvalidPdu", "get_InsufficientAuthentication", "get_RequestNotSupported", "get_InvalidOffset", "get_InsufficientAuthorization", "get_PrepareQueueFull", "get_AttributeNotFound", "get_AttributeNotLong", "get_InsufficientEncryptionKeySize", "get_InvalidAttributeValueLength", "get_UnlikelyError", "get_InsufficientEncryption", "get_UnsupportedGroupType", "get_InsufficientResources"]

    /**
     * @type {Integer} 
     */
    InvalidHandle {
        get => this.get_InvalidHandle()
    }

    /**
     * @type {Integer} 
     */
    ReadNotPermitted {
        get => this.get_ReadNotPermitted()
    }

    /**
     * @type {Integer} 
     */
    WriteNotPermitted {
        get => this.get_WriteNotPermitted()
    }

    /**
     * @type {Integer} 
     */
    InvalidPdu {
        get => this.get_InvalidPdu()
    }

    /**
     * @type {Integer} 
     */
    InsufficientAuthentication {
        get => this.get_InsufficientAuthentication()
    }

    /**
     * @type {Integer} 
     */
    RequestNotSupported {
        get => this.get_RequestNotSupported()
    }

    /**
     * @type {Integer} 
     */
    InvalidOffset {
        get => this.get_InvalidOffset()
    }

    /**
     * @type {Integer} 
     */
    InsufficientAuthorization {
        get => this.get_InsufficientAuthorization()
    }

    /**
     * @type {Integer} 
     */
    PrepareQueueFull {
        get => this.get_PrepareQueueFull()
    }

    /**
     * @type {Integer} 
     */
    AttributeNotFound {
        get => this.get_AttributeNotFound()
    }

    /**
     * @type {Integer} 
     */
    AttributeNotLong {
        get => this.get_AttributeNotLong()
    }

    /**
     * @type {Integer} 
     */
    InsufficientEncryptionKeySize {
        get => this.get_InsufficientEncryptionKeySize()
    }

    /**
     * @type {Integer} 
     */
    InvalidAttributeValueLength {
        get => this.get_InvalidAttributeValueLength()
    }

    /**
     * @type {Integer} 
     */
    UnlikelyError {
        get => this.get_UnlikelyError()
    }

    /**
     * @type {Integer} 
     */
    InsufficientEncryption {
        get => this.get_InsufficientEncryption()
    }

    /**
     * @type {Integer} 
     */
    UnsupportedGroupType {
        get => this.get_UnsupportedGroupType()
    }

    /**
     * @type {Integer} 
     */
    InsufficientResources {
        get => this.get_InsufficientResources()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InvalidHandle() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadNotPermitted() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteNotPermitted() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InvalidPdu() {
        result := ComCall(9, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsufficientAuthentication() {
        result := ComCall(10, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestNotSupported() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InvalidOffset() {
        result := ComCall(12, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsufficientAuthorization() {
        result := ComCall(13, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrepareQueueFull() {
        result := ComCall(14, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeNotFound() {
        result := ComCall(15, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeNotLong() {
        result := ComCall(16, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsufficientEncryptionKeySize() {
        result := ComCall(17, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InvalidAttributeValueLength() {
        result := ComCall(18, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnlikelyError() {
        result := ComCall(19, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsufficientEncryption() {
        result := ComCall(20, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnsupportedGroupType() {
        result := ComCall(21, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InsufficientResources() {
        result := ComCall(22, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
