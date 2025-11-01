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
     * 
     * @param {Integer} FunctionId 
     * @param {Integer} InputBufferByteCount 
     * @param {Pointer} InputBuffer 
     * @param {Pointer<Integer>} OutputBufferByteCount 
     * @param {Pointer} OutputBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-invokefunction
     */
    InvokeFunction(FunctionId, InputBufferByteCount, InputBuffer, OutputBufferByteCount, OutputBuffer) {
        OutputBufferByteCountMarshal := OutputBufferByteCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", FunctionId, "uint", InputBufferByteCount, "ptr", InputBuffer, OutputBufferByteCountMarshal, OutputBufferByteCount, "ptr", OutputBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PrivateInputByteCount 
     * @param {Pointer<Integer>} PrivateOutputByteCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount
     */
    GetPrivateDataByteCount(PrivateInputByteCount, PrivateOutputByteCount) {
        PrivateInputByteCountMarshal := PrivateInputByteCount is VarRef ? "uint*" : "ptr"
        PrivateOutputByteCountMarshal := PrivateOutputByteCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, PrivateInputByteCountMarshal, PrivateInputByteCount, PrivateOutputByteCountMarshal, PrivateOutputByteCount, "HRESULT")
        return result
    }
}
