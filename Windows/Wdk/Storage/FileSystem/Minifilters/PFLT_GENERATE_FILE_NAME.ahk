#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLT_CALLBACK_DATA.ahk" { FLT_CALLBACK_DATA }
#Import ".\FLT_NAME_CONTROL.ahk" { FLT_NAME_CONTROL }
#Import "..\..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_GENERATE_FILE_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_GENERATE_FILE_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PFLT_INSTANCE} Instance 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {Pointer<FLT_CALLBACK_DATA>} CallbackData 
     * @param {Integer} NameOptions 
     * @param {Pointer<BOOLEAN>} CacheFileNameInformation 
     * @param {Pointer<FLT_NAME_CONTROL>} FileName 
     * @returns {NTSTATUS} 
     */
    Call(Instance, FileObject, CallbackData, NameOptions, CacheFileNameInformation, FileName) {
        CacheFileNameInformationMarshal := CacheFileNameInformation is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, FLT_CALLBACK_DATA.Ptr, CallbackData, UInt32, NameOptions, CacheFileNameInformationMarshal, CacheFileNameInformation, FLT_NAME_CONTROL.Ptr, FileName, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFLT_GENERATE_FILE_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_GENERATE_FILE_NAME {
        /**
         * Creates a PFLT_GENERATE_FILE_NAME pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_INSTANCE, FILE_OBJECT, FLT_CALLBACK_DATA, UInt32, BOOLEAN, FLT_NAME_CONTROL) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_INSTANCE, FILE_OBJECT.Ptr, FLT_CALLBACK_DATA.Ptr, UInt32, BOOLEAN.Ptr, FLT_NAME_CONTROL.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
