#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PDIRTY_PAGE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PDIRTY_PAGE_ROUTINE) {
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
     * @param {Pointer<Integer>} OldestLsn 
     * @param {Pointer<Integer>} NewestLsn 
     * @param {Pointer<Void>} Context1 
     * @param {Pointer<Void>} Context2 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(FileObject, FileOffset, Length, OldestLsn, NewestLsn, Context1, Context2) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        OldestLsnMarshal := OldestLsn is VarRef ? "int64*" : "ptr"
        NewestLsnMarshal := NewestLsn is VarRef ? "int64*" : "ptr"
        Context1Marshal := Context1 is VarRef ? "ptr" : "ptr"
        Context2Marshal := Context2 is VarRef ? "ptr" : "ptr"

        DllCall(this.value, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, UInt32, Length, OldestLsnMarshal, OldestLsn, NewestLsnMarshal, NewestLsn, Context1Marshal, Context1, Context2Marshal, Context2)
    }

    /**
     * A PDIRTY_PAGE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDIRTY_PAGE_ROUTINE {
        /**
         * Creates a PDIRTY_PAGE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "int64*", UInt32, "int64*", "int64*", "ptr", "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "int64*", UInt32, "int64*", "int64*", "ptr", "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
