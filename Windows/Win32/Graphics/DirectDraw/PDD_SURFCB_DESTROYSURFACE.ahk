#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DESTROYSURFACEDATA.ahk" { DD_DESTROYSURFACEDATA }

/**
 * The DdDestroySurface callback function destroys a DirectDraw surface.
 * @remarks
 * If DirectDraw did the memory allocation at surface creation time and the driver was not involved in the allocation, DirectDraw does not call the driver's <b>DdDestroySurface</b> function to destroy the surface. 
 * 
 * If the driver is performing the surface memory management itself, <b>DdDestroySurface</b> should free the surface memory and perform any other cleanup, such as freeing private data stored in the <b>dwReserved1</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_global">DD_SURFACE_GLOBAL</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structures.
 * 
 * For a driver-managed surface, if the surface is persistent (that is, the DDSCAPS2_DONOTPERSIST flag in the <b>dwCaps2</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure for the surface is not set), <b>DdDestroySurface</b> can be called with the purpose of evicting the surface from video memory. In this case, the display driver can continue to keep any private data in the <b>dwReserved1</b> members until <b>DdDestroySurface</b> is called to actually destroy the surface.
 * 
 * <b>DdDestroySurface</b> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_SURFCB_DESTROYSURFACE {
    value : IntPtr

    __value {
        set {
            if (value is PDD_SURFCB_DESTROYSURFACE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DESTROYSURFACEDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_destroysurfacedata">DD_DESTROYSURFACEDATA</a> structure that contains the information needed to destroy a surface.
     * @returns {Integer} <b>DdDestroySurface</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_DESTROYSURFACEDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_SURFCB_DESTROYSURFACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_SURFCB_DESTROYSURFACE {
        /**
         * Creates a PDD_SURFCB_DESTROYSURFACE pointer that invokes the given AHK function when called.
         * @param {Func(DD_DESTROYSURFACEDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DESTROYSURFACEDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
