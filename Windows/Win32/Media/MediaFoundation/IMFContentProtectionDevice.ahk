#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a decryptor to communicate with the security processor that implements the hardware decryption for a protection system.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfcontentprotectiondevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentProtectionDevice extends IUnknown{
    /**
     * The interface identifier for IMFContentProtectionDevice
     * @type {Guid}
     */
    static IID => Guid("{e6257174-a060-4c9a-a088-3b1b471cad28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} FunctionId 
     * @param {Integer} InputBufferByteCount 
     * @param {Pointer} InputBuffer 
     * @param {Pointer<UInt32>} OutputBufferByteCount 
     * @param {Pointer} OutputBuffer 
     * @returns {HRESULT} 
     */
    InvokeFunction(FunctionId, InputBufferByteCount, InputBuffer, OutputBufferByteCount, OutputBuffer) {
        result := ComCall(3, this, "uint", FunctionId, "uint", InputBufferByteCount, "ptr", InputBuffer, "uint*", OutputBufferByteCount, "ptr", OutputBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PrivateInputByteCount 
     * @param {Pointer<UInt32>} PrivateOutputByteCount 
     * @returns {HRESULT} 
     */
    GetPrivateDataByteCount(PrivateInputByteCount, PrivateOutputByteCount) {
        result := ComCall(4, this, "uint*", PrivateInputByteCount, "uint*", PrivateOutputByteCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
