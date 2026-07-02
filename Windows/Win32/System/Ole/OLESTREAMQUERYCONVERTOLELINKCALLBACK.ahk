#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLESTREAMQUERYCONVERTOLELINKCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is OLESTREAMQUERYCONVERTOLELINKCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} pClsid 
     * @param {PWSTR} szClass 
     * @param {PWSTR} szTopicName 
     * @param {PWSTR} szItemName 
     * @param {PWSTR} szUNCName 
     * @param {Integer} linkUpdatingOption 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Call(pClsid, szClass, szTopicName, szItemName, szUNCName, linkUpdatingOption, pvContext) {
        szClass := szClass is String ? StrPtr(szClass) : szClass
        szTopicName := szTopicName is String ? StrPtr(szTopicName) : szTopicName
        szItemName := szItemName is String ? StrPtr(szItemName) : szItemName
        szUNCName := szUNCName is String ? StrPtr(szUNCName) : szUNCName

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Guid.Ptr, pClsid, "ptr", szClass, "ptr", szTopicName, "ptr", szItemName, "ptr", szUNCName, UInt32, linkUpdatingOption, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * A OLESTREAMQUERYCONVERTOLELINKCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends OLESTREAMQUERYCONVERTOLELINKCALLBACK {
        /**
         * Creates a OLESTREAMQUERYCONVERTOLELINKCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PWSTR, PWSTR, PWSTR, PWSTR, UInt32, "ptr", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
