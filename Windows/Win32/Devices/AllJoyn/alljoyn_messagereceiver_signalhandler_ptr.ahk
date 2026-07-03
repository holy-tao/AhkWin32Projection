#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\alljoyn_interfacedescription_member.ahk" { alljoyn_interfacedescription_member }
#Import ".\alljoyn_message.ahk" { alljoyn_message }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_messagereceiver_signalhandler_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_messagereceiver_signalhandler_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<alljoyn_interfacedescription_member>} member 
     * @param {PSTR} srcPath 
     * @param {alljoyn_message} message 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(member, srcPath, message) {
        srcPath := srcPath is String ? StrPtr(srcPath) : srcPath

        DllCall(this.value, alljoyn_interfacedescription_member.Ptr, member, "ptr", srcPath, alljoyn_message, message)
    }

    /**
     * A alljoyn_messagereceiver_signalhandler_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_messagereceiver_signalhandler_ptr {
        /**
         * Creates a alljoyn_messagereceiver_signalhandler_ptr pointer that invokes the given AHK function when called.
         * @param {Func(alljoyn_interfacedescription_member, PSTR, alljoyn_message) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [alljoyn_interfacedescription_member.Ptr, PSTR, alljoyn_message, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
