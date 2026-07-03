#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\MDL.ahk" { MDL }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_WRITE_COMPRESSED {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_WRITE_COMPRESSED) {
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
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Void>} _Buffer 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Integer} CompressedDataInfo 
     * @param {Integer} CompressedDataInfoLength 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, FileOffset, Length, LockKey, _Buffer, MdlChain, IoStatus, CompressedDataInfo, CompressedDataInfoLength, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        _BufferMarshal := _Buffer is VarRef ? "ptr" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, UInt32, Length, UInt32, LockKey, _BufferMarshal, _Buffer, MdlChainMarshal, MdlChain, IO_STATUS_BLOCK.Ptr, IoStatus, IntPtr, CompressedDataInfo, UInt32, CompressedDataInfoLength, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_WRITE_COMPRESSED that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_WRITE_COMPRESSED {
        /**
         * Creates a FAST_IO_WRITE_COMPRESSED pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "int64*", UInt32, UInt32, "ptr", "ptr*", IO_STATUS_BLOCK, IntPtr, UInt32, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "int64*", UInt32, UInt32, "ptr", "ptr*", IO_STATUS_BLOCK.Ptr, IntPtr, UInt32, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
