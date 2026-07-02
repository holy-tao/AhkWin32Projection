#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pSrcData 
     * @param {Pointer} SrcDataSizeInBytes 
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface 
     * @returns {Pointer<Void>} 
     */
    Call(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface) {
        result := DllCall(this.value, IntPtr, pSrcData, IntPtr, SrcDataSizeInBytes, Guid.Ptr, pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "HRESULT")
        return ppRootSignatureDeserializer
    }

    /**
     * A PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER {
        /**
         * Creates a PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
