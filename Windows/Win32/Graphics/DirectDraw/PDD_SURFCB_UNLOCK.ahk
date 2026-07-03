#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_UNLOCKDATA.ahk" { DD_UNLOCKDATA }

/**
 * The DdUnLock callback function releases the lock held on the specified surface.
 * @remarks
 * The driver does not need to verify that the memory was previously locked down by <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a>, because DirectDraw does parameter validation before calling this routine. 
 * 
 * <i>DdUnLock</i> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_UNLOCK {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_UNLOCK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_UNLOCKDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_unlockdata">DD_UNLOCKDATA</a> structure that contains the information required to perform the lock release.
     * @returns {Integer} <i>DdUnLock</i> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_UNLOCKDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_UNLOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_UNLOCK {
        /**
         * Creates a PDD_SURFCB_UNLOCK pointer that invokes the given AHK function when called.
         * @param {Func(DD_UNLOCKDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_UNLOCKDATA.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
