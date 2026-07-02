#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Etw\EVENT_FILTER_DESCRIPTOR.ahk" { EVENT_FILTER_DESCRIPTOR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ETWENABLECALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is ETWENABLECALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} SourceId 
     * @param {Integer} ControlCode 
     * @param {Integer} Level 
     * @param {Integer} MatchAnyKeyword 
     * @param {Integer} MatchAllKeyword 
     * @param {Pointer<EVENT_FILTER_DESCRIPTOR>} FilterData 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SourceId, ControlCode, Level, MatchAnyKeyword, MatchAllKeyword, FilterData, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, Guid.Ptr, SourceId, UInt32, ControlCode, Int8, Level, Int64, MatchAnyKeyword, Int64, MatchAllKeyword, EVENT_FILTER_DESCRIPTOR.Ptr, FilterData, CallbackContextMarshal, CallbackContext)
    }

    /**
     * A ETWENABLECALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ETWENABLECALLBACK {
        /**
         * Creates a ETWENABLECALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Guid, UInt32, Int8, Int64, Int64, EVENT_FILTER_DESCRIPTOR, "ptr") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, UInt32, Int8, Int64, Int64, EVENT_FILTER_DESCRIPTOR.Ptr, "ptr", IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
