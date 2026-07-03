#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The RasCustomDeleteEntryNotify function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom dialogs for managing phone-book entries.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rascustomdeleteentrynotifyfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomDeleteEntryNotifyFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomDeleteEntryNotifyFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpszPhonebook Pointer to a <b>null</b>-terminated string that specifies the full path and file name of a phone-book (PBK) file. If this parameter is <b>NULL</b>, the function uses the current default phone-book file. The default phone-book file is the one selected by the user in the <b>User Preferences</b> property sheet of the <b>Dial-Up Networking</b> dialog box.
     * @param {PWSTR} lpszEntry Pointer to a <b>null</b>-terminated string that contains the name of the phone-book entry to dial.
     * @param {Integer} dwFlags Specifies one or more of the following flags:
     * @returns {Integer} This function should return value <b>ERROR_SUCCESS</b> if successful.
     */
    Call(lpszPhonebook, lpszEntry, dwFlags) {
        lpszPhonebook := lpszPhonebook is String ? StrPtr(lpszPhonebook) : lpszPhonebook
        lpszEntry := lpszEntry is String ? StrPtr(lpszEntry) : lpszEntry

        result := DllCall(this.value, "ptr", lpszPhonebook, "ptr", lpszEntry, UInt32, dwFlags, UInt32)
        return result
    }

    /**
     * A RasCustomDeleteEntryNotifyFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomDeleteEntryNotifyFn {
        /**
         * Creates a RasCustomDeleteEntryNotifyFn pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
