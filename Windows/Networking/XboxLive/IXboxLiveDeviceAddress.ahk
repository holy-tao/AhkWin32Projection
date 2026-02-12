#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveDeviceAddress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveDeviceAddress
     * @type {Guid}
     */
    static IID => Guid("{f5bbd279-3c86-4b57-a31a-b9462408fd01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SnapshotChanged", "remove_SnapshotChanged", "GetSnapshotAsBase64", "GetSnapshotAsBuffer", "GetSnapshotAsBytes", "Compare", "get_IsValid", "get_IsLocal", "get_NetworkAccessKind"]

    /**
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * @type {Boolean} 
     */
    IsLocal {
        get => this.get_IsLocal()
    }

    /**
     * @type {Integer} 
     */
    NetworkAccessKind {
        get => this.get_NetworkAccessKind()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveDeviceAddress, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SnapshotChanged(handler) {
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
    remove_SnapshotChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetSnapshotAsBase64() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetSnapshotAsBuffer() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @param {Pointer<UInt32>} bytesWritten 
     * @returns {HRESULT} 
     */
    GetSnapshotAsBytes(buffer_length, buffer, bytesWritten) {
        buffer_lengthMarshal := buffer_length is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, buffer_lengthMarshal, buffer_length, bufferMarshal, buffer, "ptr", bytesWritten, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {XboxLiveDeviceAddress} otherDeviceAddress 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(otherDeviceAddress) {
        result := ComCall(11, this, "ptr", otherDeviceAddress, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
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
    get_IsLocal() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NetworkAccessKind() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
