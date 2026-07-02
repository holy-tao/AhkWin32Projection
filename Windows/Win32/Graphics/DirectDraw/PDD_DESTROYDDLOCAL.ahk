#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_DESTROYDDLOCALDATA.ahk" { DD_DESTROYDDLOCALDATA }

/**
 * The D3dDestroyDDLocal function destroys all the Microsoft Direct3D surfaces previously created by the D3dCreateSurfaceEx function that belong to the same given local Microsoft DirectDraw object.
 * @remarks
 * All Direct3D drivers must support <b>D3dDestroyDDLocal</b>.
 * 
 * Direct3D calls <b>D3dDestroyDDLocal</b> when the application indicates that the Direct3D context is no longer required and it will be destroyed along with all surfaces associated to it. The association comes through the pointer to the local DirectDraw object. The driver must free any memory that the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> callback allocated for each surface, if necessary. 
 * 
 * The driver should not destroy the DirectDraw surfaces associated with these Direct3D surfaces. This is the application's responsibility.
 * 
 * The pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that was passed in as the <b>lpDDLcl</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_contextcreatedata">D3DHAL_CONTEXTCREATEDATA</a> structure when <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/nc-d3dhal-lpd3dhal_contextcreatecb">D3dContextCreate</a> was called is released by the operating system after <b>D3dDestroyDDLocal</b> returns. 
 * 
 * <b>D3dDestroyDDLocal</b> can be called with a disabled <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A PDEV is disabled or enabled by calling the display driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvassertmode">DrvAssertMode</a> function. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/managing-pdevs">Managing PDEVs</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/nc-ddrawint-pdd_destroyddlocal
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct PDD_DESTROYDDLOCAL {
    value : IntPtr

    __value {
        set {
            if (value is PDD_DESTROYDDLOCAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DD_DESTROYDDLOCALDATA>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawi/ns-ddrawi-ddhal_destroyddlocaldata">DDHAL_DESTROYDDLOCALDATA</a> structure that contains the information required for the driver to destroy the surfaces.
     * @returns {Integer} <b>D3dDestroyDDLocal</b> returns one of the following callback codes:
     */
    Call(param0) {
        result := DllCall(this.value, DD_DESTROYDDLOCALDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A PDD_DESTROYDDLOCAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDD_DESTROYDDLOCAL {
        /**
         * Creates a PDD_DESTROYDDLOCAL pointer that invokes the given AHK function when called.
         * @param {Func(DD_DESTROYDDLOCALDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DD_DESTROYDDLOCALDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
