#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICryptographicBufferStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains static methods that implement data management functionality common to cryptographic operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer
 * @namespace Windows.Security.Cryptography
 * @version WindowsRuntime 1.4
 */
class CryptographicBuffer extends IInspectable {
;@region Static Methods
    /**
     * Compares two [IBuffer](../windows.storage.streams/ibuffer.md) objects.
     * @param {IBuffer} object1 Buffer to be used for comparison.
     * @param {IBuffer} object2 Buffer to be used for comparison.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.compare
     */
    static Compare(object1, object2) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.Compare(object1, object2)
    }

    /**
     * Creates a buffer that contains random data.
     * @param {Integer} length Length, in bytes, of the buffer to create.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.generaterandom
     */
    static GenerateRandom(length) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.GenerateRandom(length)
    }

    /**
     * Creates a random number.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.generaterandomnumber
     */
    static GenerateRandomNumber() {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.GenerateRandomNumber()
    }

    /**
     * Creates a buffer from an input byte array.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value An array of bytes used to create the buffer.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.createfrombytearray
     */
    static CreateFromByteArray(value_length, value) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.CreateFromByteArray(value_length, value)
    }

    /**
     * Copies a buffer to an array of bytes.
     * @param {IBuffer} buffer_ Input buffer.
     * @param {Pointer<Byte>} value An array of bytes that contains the values copied from the input buffer. You must declare the array before calling this method and pass it by using the **ref** keyword. If the buffer for the *input* parameter is empty, then the *value* parameter will be returned as NULL.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.copytobytearray
     */
    static CopyToByteArray(buffer_, value) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.CopyToByteArray(buffer_, value)
    }

    /**
     * Decodes a string that has been hexadecimal encoded.
     * @param {HSTRING} value Encoded input string.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.decodefromhexstring
     */
    static DecodeFromHexString(value) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.DecodeFromHexString(value)
    }

    /**
     * Encodes a buffer to a hexadecimal string.
     * @param {IBuffer} buffer_ Input buffer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.encodetohexstring
     */
    static EncodeToHexString(buffer_) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.EncodeToHexString(buffer_)
    }

    /**
     * Decodes a string that has been base64 encoded.
     * @remarks
     * Base64 processes data as 24-bit groups, mapping each group to four encoded 8-bit characters. Base64 encoding is sometimes referred to as 3-to-4 encoding. Each 6 bits of the 24-bit group is used as an index into a mapping table (the base64 alphabet) to obtain a character for the encoded data.
     * @param {HSTRING} value Base64 encoded input string.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.decodefrombase64string
     */
    static DecodeFromBase64String(value) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.DecodeFromBase64String(value)
    }

    /**
     * Encodes a buffer to a base64 string.
     * @remarks
     * Base64 processes data as 24-bit groups, mapping each group to four encoded 8-bit characters. Base64 encoding is sometimes referred to as 3-to-4 encoding. Each 6 bits of the 24-bit group is used as an index into a mapping table (the base64 alphabet) to obtain a character for the encoded data.
     * @param {IBuffer} buffer_ Input buffer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.encodetobase64string
     */
    static EncodeToBase64String(buffer_) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.EncodeToBase64String(buffer_)
    }

    /**
     * Converts a string to an encoded buffer.
     * @param {HSTRING} value String to be encoded.
     * @param {Integer} encoding Encoding format.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.convertstringtobinary
     */
    static ConvertStringToBinary(value, encoding) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.ConvertStringToBinary(value, encoding)
    }

    /**
     * Converts a buffer to an encoded string.
     * @param {Integer} encoding Encoding format.
     * @param {IBuffer} buffer_ Data to be encoded.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.cryptographicbuffer.convertbinarytostring
     */
    static ConvertBinaryToString(encoding, buffer_) {
        if (!CryptographicBuffer.HasProp("__ICryptographicBufferStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.CryptographicBuffer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicBufferStatics.IID)
            CryptographicBuffer.__ICryptographicBufferStatics := ICryptographicBufferStatics(factoryPtr)
        }

        return CryptographicBuffer.__ICryptographicBufferStatics.ConvertBinaryToString(encoding, buffer_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
