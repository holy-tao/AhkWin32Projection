#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography
 * @version WindowsRuntime 1.4
 */
class ICryptographicBufferStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICryptographicBufferStatics
     * @type {Guid}
     */
    static IID => Guid("{320b7e22-3cb0-4cdf-8663-1d28910065eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compare", "GenerateRandom", "GenerateRandomNumber", "CreateFromByteArray", "CopyToByteArray", "DecodeFromHexString", "EncodeToHexString", "DecodeFromBase64String", "EncodeToBase64String", "ConvertStringToBinary", "ConvertBinaryToString"]

    /**
     * The CompareAddresses function compares two addresses, indicating that one of the addresses is greater than, less than, or equal to the other address.
     * @remarks
     * An address that is less than another address indicates a previous frame. An address that is greater than another address indicates a later frame.
     * 
     * Network Monitor provides two other functions, [CompareFrameDestAddress](compareframedestaddress.md) and [CompareFrameSourceAddress](compareframesourceaddress.md), which you can use to compare addresses. The **CompareFrameDestAddress** function compares a given address to the frame's destination address, and the **CompareFrameSourceAddress** function compares a given address to the frame's source address.
     * @param {IBuffer} object1 
     * @param {IBuffer} object2 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/compareaddresses
     */
    Compare(object1, object2) {
        result := ComCall(6, this, "ptr", object1, "ptr", object2, "int*", &isEqual := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isEqual
    }

    /**
     * 
     * @param {Integer} length 
     * @returns {IBuffer} 
     */
    GenerateRandom(length) {
        result := ComCall(7, this, "uint", length, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GenerateRandomNumber() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {IBuffer} 
     */
    CreateFromByteArray(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", value_length, valueMarshal, value, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @param {Pointer<Byte>} value 
     * @returns {HRESULT} 
     */
    CopyToByteArray(buffer_, value) {
        result := ComCall(10, this, "ptr", buffer_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IBuffer} 
     */
    DecodeFromHexString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HSTRING} 
     */
    EncodeToHexString(buffer_) {
        value := HSTRING()
        result := ComCall(12, this, "ptr", buffer_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IBuffer} 
     */
    DecodeFromBase64String(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HSTRING} 
     */
    EncodeToBase64String(buffer_) {
        value := HSTRING()
        result := ComCall(14, this, "ptr", buffer_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @param {Integer} encoding 
     * @returns {IBuffer} 
     */
    ConvertStringToBinary(value, encoding) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(15, this, "ptr", value, "int", encoding, "ptr*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(buffer_)
    }

    /**
     * 
     * @param {Integer} encoding 
     * @param {IBuffer} buffer_ 
     * @returns {HSTRING} 
     */
    ConvertBinaryToString(encoding, buffer_) {
        value := HSTRING()
        result := ComCall(16, this, "int", encoding, "ptr", buffer_, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
