#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\D3D12_VERSIONED_ROOT_SIGNATURE_DESC.ahk" { D3D12_VERSIONED_ROOT_SIGNATURE_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct PFN_D3D12_COMPILER_SERIALIZE_VERSIONED_ROOT_SIGNATURE {
    value : IntPtr

    __value {
        set {
            if (value is PFN_D3D12_COMPILER_SERIALIZE_VERSIONED_ROOT_SIGNATURE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pRootSignature 
     * @param {Pointer<ID3DBlob>} ppBlob 
     * @param {Pointer<ID3DBlob>} ppErrorBlob 
     * @returns {HRESULT} 
     */
    Call(pRootSignature, ppBlob, ppErrorBlob) {
        result := DllCall(this.value, D3D12_VERSIONED_ROOT_SIGNATURE_DESC.Ptr, pRootSignature, ID3DBlob.Ptr, ppBlob, ID3DBlob.Ptr, ppErrorBlob, "HRESULT")
        return result
    }

    /**
     * A PFN_D3D12_COMPILER_SERIALIZE_VERSIONED_ROOT_SIGNATURE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_D3D12_COMPILER_SERIALIZE_VERSIONED_ROOT_SIGNATURE {
        /**
         * Creates a PFN_D3D12_COMPILER_SERIALIZE_VERSIONED_ROOT_SIGNATURE pointer that invokes the given AHK function when called.
         * @param {Func(D3D12_VERSIONED_ROOT_SIGNATURE_DESC, ID3DBlob, ID3DBlob) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [D3D12_VERSIONED_ROOT_SIGNATURE_DESC.Ptr, ID3DBlob.Ptr, ID3DBlob.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
