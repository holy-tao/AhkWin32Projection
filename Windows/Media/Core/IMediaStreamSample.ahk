#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Storage\Streams\WinRTBuffer.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\MediaStreamSamplePropertySet.ahk
#Include .\MediaStreamSampleProtectionProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSample extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSample
     * @type {Guid}
     */
    static IID => Guid("{5c8db627-4b80-4361-9837-6cb7481ad9d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_Processed", "remove_Processed", "get_Buffer", "get_Timestamp", "get_ExtendedProperties", "get_Protection", "put_DecodeTimestamp", "get_DecodeTimestamp", "put_Duration", "get_Duration", "put_KeyFrame", "get_KeyFrame", "put_Discontinuous", "get_Discontinuous"]

    /**
     * @type {WinRTBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {MediaStreamSamplePropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {MediaStreamSampleProtectionProperties} 
     */
    Protection {
        get => this.get_Protection()
    }

    /**
     * @type {TimeSpan} 
     */
    DecodeTimestamp {
        get => this.get_DecodeTimestamp()
        set => this.put_DecodeTimestamp(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {Boolean} 
     */
    KeyFrame {
        get => this.get_KeyFrame()
        set => this.put_KeyFrame(value)
    }

    /**
     * @type {Boolean} 
     */
    Discontinuous {
        get => this.get_Discontinuous()
        set => this.put_Discontinuous(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSample, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Processed(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_Processed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_Buffer() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Buffer(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Timestamp() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MediaStreamSamplePropertySet} 
     */
    get_ExtendedProperties() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSamplePropertySet(value)
    }

    /**
     * 
     * @returns {MediaStreamSampleProtectionProperties} 
     */
    get_Protection() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaStreamSampleProtectionProperties(value)
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DecodeTimestamp(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DecodeTimestamp() {
        value := TimeSpan()
        result := ComCall(13, this, "ptr", value, "int")
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
    put_Duration(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(15, this, "ptr", value, "int")
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
    put_KeyFrame(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyFrame() {
        result := ComCall(17, this, "int*", &value := 0, "int")
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
    put_Discontinuous(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Discontinuous() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
