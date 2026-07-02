#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER_FROM_SUBOBJECT_IN_LIBRARY {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER_FROM_SUBOBJECT_IN_LIBRARY) {
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
     * @param {PWSTR} RootSignatureSubobjectName 
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface 
     * @returns {Pointer<Void>} 
     */
    Call(pSrcData, SrcDataSizeInBytes, RootSignatureSubobjectName, pRootSignatureDeserializerInterface) {
        RootSignatureSubobjectName := RootSignatureSubobjectName is String ? StrPtr(RootSignatureSubobjectName) : RootSignatureSubobjectName

        result := DllCall(this.value, IntPtr, pSrcData, IntPtr, SrcDataSizeInBytes, "ptr", RootSignatureSubobjectName, Guid.Ptr, pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "HRESULT")
        return ppRootSignatureDeserializer
    }

    /**
     * A PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER_FROM_SUBOBJECT_IN_LIBRARY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER_FROM_SUBOBJECT_IN_LIBRARY {
        /**
         * Creates a PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER_FROM_SUBOBJECT_IN_LIBRARY pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, PWSTR, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, PWSTR, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
