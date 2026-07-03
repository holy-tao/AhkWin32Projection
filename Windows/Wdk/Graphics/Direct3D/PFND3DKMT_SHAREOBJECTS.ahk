#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PFND3DKMT_SHAREOBJECTS {
    value : IntPtr

    __value {
        set {
            if (value is PFND3DKMT_SHAREOBJECTS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cObjects 
     * @param {Pointer<Integer>} hObjects 
     * @param {Pointer<OBJECT_ATTRIBUTES>} pObjectAttributes 
     * @param {Integer} dwDesiredAccess 
     * @param {Pointer<HANDLE>} phSharedNtHandle 
     * @returns {NTSTATUS} 
     */
    Call(cObjects, hObjects, pObjectAttributes, dwDesiredAccess, phSharedNtHandle) {
        hObjectsMarshal := hObjects is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, cObjects, hObjectsMarshal, hObjects, OBJECT_ATTRIBUTES.Ptr, pObjectAttributes, UInt32, dwDesiredAccess, HANDLE.Ptr, phSharedNtHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFND3DKMT_SHAREOBJECTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFND3DKMT_SHAREOBJECTS {
        /**
         * Creates a PFND3DKMT_SHAREOBJECTS pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "uint*", OBJECT_ATTRIBUTES, UInt32, HANDLE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "uint*", OBJECT_ATTRIBUTES.Ptr, UInt32, HANDLE.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
