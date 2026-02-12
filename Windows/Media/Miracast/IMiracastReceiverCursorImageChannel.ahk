#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\SizeInt32.ahk
#Include ..\..\Graphics\PointInt32.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverCursorImageChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverCursorImageChannel
     * @type {Guid}
     */
    static IID => Guid("{d9ac332d-723a-5a9d-b90a-81153efa2a0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "get_MaxImageSize", "get_Position", "get_ImageStream", "add_ImageStreamChanged", "remove_ImageStreamChanged", "add_PositionChanged", "remove_PositionChanged"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * @type {SizeInt32} 
     */
    MaxImageSize {
        get => this.get_MaxImageSize()
    }

    /**
     * @type {PointInt32} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {IRandomAccessStreamWithContentType} 
     */
    ImageStream {
        get => this.get_ImageStream()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_MaxImageSize() {
        value := SizeInt32()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PointInt32} 
     */
    get_Position() {
        value := PointInt32()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IRandomAccessStreamWithContentType} 
     */
    get_ImageStream() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStreamWithContentType(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ImageStreamChanged(handler) {
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
    remove_ImageStreamChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MiracastReceiverCursorImageChannel, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(handler) {
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
    remove_PositionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
