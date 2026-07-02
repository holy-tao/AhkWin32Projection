#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\MDL.ahk" { MDL }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_MDL_WRITE_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_MDL_WRITE_COMPLETE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<MDL>} MdlChain 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, FileOffset, MdlChain, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, MDL.Ptr, MdlChain, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_MDL_WRITE_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_MDL_WRITE_COMPLETE {
        /**
         * Creates a FAST_IO_MDL_WRITE_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "int64*", MDL, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "int64*", MDL.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
