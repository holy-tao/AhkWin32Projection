#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IMAGEHLP_STATUS_REASON.ahk" { IMAGEHLP_STATUS_REASON }

/**
 * An application-defined callback function used with the BindImageEx function. The status routine is called during the process of the image binding.
 * @remarks
 * All ImageHlp functions, such as this one, are single threaded. Therefore, calls from more than one thread to this function will likely result in unexpected behavior or memory corruption. To avoid this, you must synchronize all concurrent calls from more than one thread to this function.
 * 
 * The following code fragment describes how to use the <i>Va</i> value when the status is BindImageComplete.
 * 
 * 
 * ```cpp
 * case BindImageComplete:
 *     if (fVerbose) {
 *         fprintf(stderr, "BIND: Details of binding %s\n", ImageName );
 *         NewImports = (PIMAGE_BOUND_IMPORT_DESCRIPTOR)Va;
 *         NewImport = NewImports;
 *         while (NewImport->OffsetModuleName) {
 *             fprintf( stderr, "    Import from %s [%x]",
 *                      (LPSTR)NewImports + NewImport->OffsetModuleName,
 *                      NewImport->TimeDateStamp
 *                    );
 *             if (NewImport->NumberOfModuleForwarderRefs != 0) {
 *                 fprintf( stderr, " with %u forwarders", NewImport-> 
 *                          NumberOfModuleForwarderRefs );
 *             }
 *             fprintf( stderr, "\n" );
 *             NewForwarder = (PIMAGE_BOUND_FORWARDER_REF)(NewImport+1);
 *             for (i=0; i<NewImport->NumberOfModuleForwarderRefs; i++) 
 *             {
 *                 fprintf( stderr, "        Forward to %s [%x]\n",
 *                    (LPSTR)NewImports + NewForwarder->OffsetModuleName,
 *                    NewForwarder->TimeDateStamp);
 *                 NewForwarder += 1;
 *             }
 *             NewImport = (PIMAGE_BOUND_IMPORT_DESCRIPTOR)NewForwarder;
 *         }
 *     }
 *     break;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/imagehlp/nc-imagehlp-pimagehlp_status_routine
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PIMAGEHLP_STATUS_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PIMAGEHLP_STATUS_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IMAGEHLP_STATUS_REASON} Reason 
     * @param {PSTR} ImageName The  name of the file to be bound. This value can be a file name, a partial path, or a full path.
     * @param {PSTR} DllName The name of the DLL.
     * @param {Pointer} Va The computed virtual address.
     * @param {Pointer} Parameter Any additional status information. This value depends on the value of the <i>Reason</i> parameter. For more information, see the code fragment in the following Remarks section.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>.
     * 
     * If the function fails, the return value is <b>FALSE</b>. To retrieve extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(Reason, ImageName, DllName, Va, Parameter) {
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName
        DllName := DllName is String ? StrPtr(DllName) : DllName

        result := DllCall(this.value, IMAGEHLP_STATUS_REASON, Reason, "ptr", ImageName, "ptr", DllName, IntPtr, Va, IntPtr, Parameter, BOOL)
        return result
    }

    /**
     * A PIMAGEHLP_STATUS_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIMAGEHLP_STATUS_ROUTINE {
        /**
         * Creates a PIMAGEHLP_STATUS_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IMAGEHLP_STATUS_REASON, PSTR, PSTR, IntPtr, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IMAGEHLP_STATUS_REASON, PSTR, PSTR, IntPtr, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
