#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_interfacedescription_translation_callback_ptr {
    value : IntPtr

    __value {
        set {
            if (value is alljoyn_interfacedescription_translation_callback_ptr) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} sourceLanguage 
     * @param {PSTR} targetLanguage 
     * @param {PSTR} sourceText 
     * @returns {PSTR} 
     */
    Call(sourceLanguage, targetLanguage, sourceText) {
        sourceLanguage := sourceLanguage is String ? StrPtr(sourceLanguage) : sourceLanguage
        targetLanguage := targetLanguage is String ? StrPtr(targetLanguage) : targetLanguage
        sourceText := sourceText is String ? StrPtr(sourceText) : sourceText

        result := DllCall(this.value, "ptr", sourceLanguage, "ptr", targetLanguage, "ptr", sourceText, PSTR)
        return result
    }

    /**
     * A alljoyn_interfacedescription_translation_callback_ptr that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends alljoyn_interfacedescription_translation_callback_ptr {
        /**
         * Creates a alljoyn_interfacedescription_translation_callback_ptr pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, PSTR) => PSTR} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, PSTR, PSTR])
        }

        __Delete() => CallbackFree(this.value)
    }
}
