#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Storage\InstallableFileSystems\FLT_FILESYSTEM_TYPE.ahk" { FLT_FILESYSTEM_TYPE }
#Import ".\FLT_RELATED_OBJECTS.ahk" { FLT_RELATED_OBJECTS }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_INSTANCE_SETUP_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_INSTANCE_SETUP_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Integer} Flags 
     * @param {Integer} VolumeDeviceType 
     * @param {FLT_FILESYSTEM_TYPE} VolumeFilesystemType 
     * @returns {NTSTATUS} 
     */
    Call(FltObjects, Flags, VolumeDeviceType, VolumeFilesystemType) {
        result := DllCall(this.value, FLT_RELATED_OBJECTS.Ptr, FltObjects, UInt32, Flags, UInt32, VolumeDeviceType, FLT_FILESYSTEM_TYPE, VolumeFilesystemType, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFLT_INSTANCE_SETUP_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_INSTANCE_SETUP_CALLBACK {
        /**
         * Creates a PFLT_INSTANCE_SETUP_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(FLT_RELATED_OBJECTS, UInt32, UInt32, FLT_FILESYSTEM_TYPE) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FLT_RELATED_OBJECTS.Ptr, UInt32, UInt32, FLT_FILESYSTEM_TYPE, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
