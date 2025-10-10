#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DRVFN structure is used by graphics drivers to provide GDI with pointers to the graphics DDI functions defined by the driver.
 * @remarks
 * 
  * A graphics driver must allocate an array of DRVFN structures, with an array element for each graphics DDI function implemented in the driver. The driver returns the array's address to GDI in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-drvenabledata">DRVENABLEDATA</a> structure whose pointer is passed to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledriver">DrvEnableDriver</a> function during driver initialization.
  * 
  * Graphics DDI function addresses can be placed in the DRVFN array in any order.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-drvfn
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DRVFN extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Is the function index that identifies a graphics DDI function implemented by the driver. The index name reflects the name of the related graphics DDI function; for example, an index value of INDEX_DrvEnablePDEV specifies the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablepdev">DrvEnablePDEV</a> function. See the header file, <i>winddi.h</i>, for a complete list of index values.
     * @type {Integer}
     */
    iFunc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the address of the driver-defined graphics DDI function associated with the index supplied for <b>iFunc</b>. This function has the following prototype:
     * 
     * 
     * ```
     * LONG_PTR  (APIENTRY * PFN) ();
     * ```
     * @type {Pointer<PFN>}
     */
    pfn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
