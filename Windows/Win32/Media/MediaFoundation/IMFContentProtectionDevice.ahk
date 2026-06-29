#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows a decryptor to communicate with the security processor that implements the hardware decryption for a protection system.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcontentprotectiondevice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentProtectionDevice extends IUnknown {
    /**
     * The interface identifier for IMFContentProtectionDevice
     * @type {Guid}
     */
    static IID := Guid("{e6257174-a060-4c9a-a088-3b1b471cad28}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentProtectionDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InvokeFunction          : IntPtr
        GetPrivateDataByteCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentProtectionDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Calls into the implementation of the protection system in the security processor.
     * @param {Integer} FunctionId The identifier of the function that you want to run. This identifier is defined by the implementation of the protection system.
     * @param {Integer} InputBufferByteCount The number of bytes of in the buffer that <i>InputBuffer</i> specifies, including private data.
     * @param {Integer} InputBuffer A pointer to the data that you want to provide as input.
     * @param {Pointer<Integer>} OutputBufferByteCount Pointer to a value that specifies the length in bytes of the data that the function wrote to the buffer that <i>OutputBuffer</i> specifies, including the private data.
     * @param {Integer} OutputBuffer Pointer to the buffer where you want the function to write its output.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-invokefunction
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcontentprotectiondevice-getprivatedatabytecount
     */
    GetPrivateDataByteCount(PrivateInputByteCount, PrivateOutputByteCount) {
        PrivateInputByteCountMarshal := PrivateInputByteCount is VarRef ? "uint*" : "ptr"
        PrivateOutputByteCountMarshal := PrivateOutputByteCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, PrivateInputByteCountMarshal, PrivateInputByteCount, PrivateOutputByteCountMarshal, PrivateOutputByteCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFContentProtectionDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvokeFunction := CallbackCreate(GetMethod(implObj, "InvokeFunction"), flags, 6)
        this.vtbl.GetPrivateDataByteCount := CallbackCreate(GetMethod(implObj, "GetPrivateDataByteCount"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvokeFunction)
        CallbackFree(this.vtbl.GetPrivateDataByteCount)
    }
}
