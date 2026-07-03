#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * An application-defined callback function used with the SymEnumSourceFileTokens function which enumerates the source server version control information stored in the PDB for a module.
 * @remarks
 * An application can use this token to extract a source file from version control by calling <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsourcefilefromtoken">SymGetSourceFileFromToken</a>.  
 * 
 * To get individual variables from the token, call <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgetsourcevarfromtoken">SymGetSourceVarFromToken</a>.  The names of the variables differ based on the scripts used to create the tokens.  See <a href="https://docs.microsoft.com/windows/desktop/Debug/source-server-and-source-indexing">Source Server</a> for details.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/nc-dbghelp-penumsourcefiletokenscallback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PENUMSOURCEFILETOKENSCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PENUMSOURCEFILETOKENSCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} token A pointer to an opaque data structure that contains the version control information corresponding to a particular individual source file.     The usage of this token is detailed below.
     * @param {Pointer} _size The size of the data in the <i>token</i> parameter.
     * @returns {BOOL} If the function returns <b>TRUE</b>, the enumeration will continue.
     * 						
     * 
     * If the function returns <b>FALSE</b>, the enumeration will stop.
     */
    Call(token, _size) {
        tokenMarshal := token is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, tokenMarshal, token, IntPtr, _size, BOOL)
        return result
    }

    /**
     * A PENUMSOURCEFILETOKENSCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PENUMSOURCEFILETOKENSCALLBACK {
        /**
         * Creates a PENUMSOURCEFILETOKENSCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
