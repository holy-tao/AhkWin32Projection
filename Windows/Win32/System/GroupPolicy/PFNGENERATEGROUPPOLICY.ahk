#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\RSOP_TARGET.ahk" { RSOP_TARGET }

/**
 * The GenerateGroupPolicy callback function is an application-defined callback function that each policy extension must export when generating RSoP data in the planning mode.
 * @remarks
 * The policy extension must register this callback function at the registry key:<b>HKEY_LOCAL_MACHINE</b>&#92;<b>SOFTWARE</b>&#92;<b>Microsoft</b>&#92;<b>Windows NT</b>&#92;<b>CurrentVersion</b>&#92;<b>Winlogon</b>&#92;<b>GPExtensions</b>&#92;<b>ClientExtensionGuid</b>
 * 
 * 
 * 
 * <b>GenerateGroupPolicy</b>
 * <b>REG_SZ</b>
 * @see https://learn.microsoft.com/windows/win32/api/userenv/nc-userenv-pfngenerategrouppolicy
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct PFNGENERATEGROUPPOLICY {
    value : IntPtr

    __value {
        set {
            if (value is PFNGENERATEGROUPPOLICY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwFlags A parameter that represents one or more of the following flags.
     * @param {Pointer<BOOL>} pbAbort A value that specifies whether to continue processing GPOs. If this parameter is <b>TRUE</b>, GPO processing stops and the extension must deallocate its resources and return promptly. If this parameter is <b>FALSE</b>, GPO processing continues.
     * @param {PWSTR} pwszSite A pointer to the site name of the target computer. This parameter can be <b>NULL</b>.
     * @param {Pointer<RSOP_TARGET>} pComputerTarget A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-rsop_target">RSOP_TARGET</a> structure that contains information about a computer. This parameter can be <b>NULL</b>, but if it is <b>NULL</b>, the <i>pUserTarget</i> parameter is required.
     * @param {Pointer<RSOP_TARGET>} pUserTarget A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/userenv/ns-userenv-rsop_target">RSOP_TARGET</a> structure that contains information about a user. This parameter can be <b>NULL</b>, but if it is <b>NULL</b>, the <i>pComputerTarget</i> parameter is required.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>. Otherwise, the function returns one of the system error codes. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a> or the header file WinError.h.
     */
    Call(dwFlags, pbAbort, pwszSite, pComputerTarget, pUserTarget) {
        pwszSite := pwszSite is String ? StrPtr(pwszSite) : pwszSite

        pbAbortMarshal := pbAbort is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, dwFlags, pbAbortMarshal, pbAbort, "ptr", pwszSite, RSOP_TARGET.Ptr, pComputerTarget, RSOP_TARGET.Ptr, pUserTarget, UInt32)
        return result
    }

    /**
     * A PFNGENERATEGROUPPOLICY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNGENERATEGROUPPOLICY {
        /**
         * Creates a PFNGENERATEGROUPPOLICY pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOL, PWSTR, RSOP_TARGET, RSOP_TARGET) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOL.Ptr, PWSTR, RSOP_TARGET.Ptr, RSOP_TARGET.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
