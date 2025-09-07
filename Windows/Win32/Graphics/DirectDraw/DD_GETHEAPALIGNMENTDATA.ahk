#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SURFACEALIGNMENT.ahk
#Include .\HEAPALIGNMENT.ahk

/**
 * The DD_GETHEAPALIGNMENTDATA structure contains data on required alignments from a particular heap.
 * @remarks
 * The <b>dwHeap</b> member is the ordinal number of the heap for which alignment data is being requested. In other words, it is the index into the array of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-videomemory">VIDEOMEMORY</a> structures pointed to by the <i>pvmList</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> driver function.
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-dd_getheapalignmentdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETHEAPALIGNMENTDATA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Indicates the driver context as returned from the driver initialization routine and stored in the <b>dhpDev</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure.
     * @type {Pointer}
     */
    dwInstance {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the heap index passed by Microsoft DirectDraw. See the Remarks section for more information.
     * @type {Integer}
     */
    dwHeap {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> callback for a GUID_GetHeapAlignment query. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Unused on Microsoft Windows 2000 and later versions of the operating system.
     * @type {Pointer<Void>}
     */
    GetHeapAlignment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dmemmgr/ns-dmemmgr-heapalignment">HEAPALIGNMENT</a> structure filled in by the driver.
     * @type {HEAPALIGNMENT}
     */
    Alignment{
        get {
            if(!this.HasProp("__Alignment"))
                this.__Alignment := HEAPALIGNMENT(this.ptr + 24)
            return this.__Alignment
        }
    }
}
