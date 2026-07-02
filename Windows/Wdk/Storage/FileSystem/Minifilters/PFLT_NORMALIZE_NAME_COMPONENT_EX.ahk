#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PFLT_INSTANCE.ahk" { PFLT_INSTANCE }
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_NORMALIZE_NAME_COMPONENT_EX {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_NORMALIZE_NAME_COMPONENT_EX) {
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
     * @param {Pointer<UNICODE_STRING>} ParentDirectory 
     * @param {Integer} VolumeNameLength 
     * @param {Pointer<UNICODE_STRING>} _Component 
     * @param {Integer} ExpandComponentName 
     * @param {Integer} ExpandComponentNameLength 
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<Void>>} NormalizationContext 
     * @returns {NTSTATUS} 
     */
    Call(Instance, FileObject, ParentDirectory, VolumeNameLength, _Component, ExpandComponentName, ExpandComponentNameLength, Flags, NormalizationContext) {
        NormalizationContextMarshal := NormalizationContext is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, PFLT_INSTANCE, Instance, FILE_OBJECT.Ptr, FileObject, UNICODE_STRING.Ptr, ParentDirectory, UInt16, VolumeNameLength, UNICODE_STRING.Ptr, _Component, IntPtr, ExpandComponentName, UInt32, ExpandComponentNameLength, UInt32, Flags, NormalizationContextMarshal, NormalizationContext, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PFLT_NORMALIZE_NAME_COMPONENT_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_NORMALIZE_NAME_COMPONENT_EX {
        /**
         * Creates a PFLT_NORMALIZE_NAME_COMPONENT_EX pointer that invokes the given AHK function when called.
         * @param {Func(PFLT_INSTANCE, FILE_OBJECT, UNICODE_STRING, UInt16, UNICODE_STRING, IntPtr, UInt32, UInt32, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PFLT_INSTANCE, FILE_OBJECT.Ptr, UNICODE_STRING.Ptr, UInt16, UNICODE_STRING.Ptr, IntPtr, UInt32, UInt32, "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
