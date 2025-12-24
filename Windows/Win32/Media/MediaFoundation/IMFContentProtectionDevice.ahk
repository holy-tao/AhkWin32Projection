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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeFunction", "GetPrivateDataByteCount"]

    /**
     * Calls into the implementation of the protection system in the security processor.
     * @param {Integer} FunctionId The identifier of the function that you want to run. This identifier is defined by the implementation of the protection system.
     * @param {Integer} InputBufferByteCount The number of bytes of in the buffer that <i>InputBuffer</i> specifies, including private data.
     * @param {Pointer} InputBuffer A pointer to the data that you want to provide as input.
     * @param {Pointer<Integer>} OutputBufferByteCount Pointer to a value that specifies the length in bytes of the data that the function wrote to the buffer that <i>OutputBuffer</i> specifies, including the private data.
     * @param {Pointer} OutputBuffer Pointer to the buffer where you want the function to write its output.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentprotectiondevice-invokefunction
     */
    InvokeFunction(FunctionId, InputBufferByteCount, InputBuffer, OutputBufferByteCount, OutputBuffer) {
        OutputBufferByteCountMarshal := OutputBufferByteCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", FunctionId, "uint", InputBufferByteCount, "ptr", InputBuffer, OutputBufferByteCountMarshal, OutputBufferByteCount, "ptr", OutputBuffer, "HRESULT")
        return result
    }

    /**
     * Gets the required number of bytes that need to be prepended to the input and output buffers when you call the security processor through the InvokeFunction method.
     * @param {Pointer<Integer>} PrivateInputByteCount The required number of bytes that need to be prepended to   
     *       the input buffer that you supply to content protection system.
     * @param {Pointer<Integer>} PrivateOutputByteCount The required number of bytes that need to be prepended to   
     *            the output buffer that you supply to content protection system.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount
     */
    GetPrivateDataByteCount(PrivateInputByteCount, PrivateOutputByteCount) {
        PrivateInputByteCountMarshal := PrivateInputByteCount is VarRef ? "uint*" : "ptr"
        PrivateOutputByteCountMarshal := PrivateOutputByteCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, PrivateInputByteCountMarshal, PrivateInputByteCount, PrivateOutputByteCountMarshal, PrivateOutputByteCount, "HRESULT")
        return result
    }
}
