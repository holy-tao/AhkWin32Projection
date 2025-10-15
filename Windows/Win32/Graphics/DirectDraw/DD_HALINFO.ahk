#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\VIDEOMEMORYINFO.ahk
#Include .\DDSCAPS.ahk
#Include .\DDNTCORECAPS.ahk

/**
 * The DD_HALINFO structure describes the capabilities of the hardware and driver.
 * @remarks
 * 
  * GDI allocates and zero-initializes the DD_HALINFO structure and passes it to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetdirectdrawinfo">DrvGetDirectDrawInfo</a> routine to be initialized with driver-specific data.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_halinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_HALINFO extends Win32Struct
{
    static sizeof => 456

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_HALINFO structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-videomemoryinfo">VIDEOMEMORYINFO</a> structure that describes the display's memory.
     * @type {VIDEOMEMORYINFO}
     */
    vmiData{
        get {
            if(!this.HasProp("__vmiData"))
                this.__vmiData := VIDEOMEMORYINFO(this.ptr + 8)
            return this.__vmiData
        }
    }

    /**
     * Specifies a <b>DDNTCORECAPS</b> structure that contains driver-specific capabilities.
     * @type {DDNTCORECAPS}
     */
    ddCaps{
        get {
            if(!this.HasProp("__ddCaps"))
                this.__ddCaps := DDNTCORECAPS(this.ptr + 96)
            return this.__ddCaps
        }
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function. This function is called to get further Microsoft DirectDraw driver information. This member can be <b>NULL</b>.
     * @type {Pointer<PDD_GETDRIVERINFO>}
     */
    GetDriverInfo {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 424, "uint")
        set => NumPut("uint", value, this, 424)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_globaldriverdata">D3DHAL_GLOBALDRIVERDATA</a> structure that describes the 3D capabilities of the driver and its device.
     * @type {Pointer<Void>}
     */
    lpD3DGlobalDriverData {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * Points to the driver's initialized <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/d3dhal/ns-d3dhal-_d3dhal_callbacks">D3DHAL_CALLBACKS</a> structure.
     * @type {Pointer<Void>}
     */
    lpD3DHALCallbacks {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * Used only by drivers that want to implement driver level vertex and command buffer allocation. This is usually done for performance reasons. The <b>lpD3DBufCallbacks</b> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_d3dbufcallbacks">DD_D3DBUFCALLBACKS</a> structure that the driver fills out with the callbacks used to support driver managed vertex and command buffers. This member should normally be ignored by the driver.
     * @type {Pointer<DD_D3DBUFCALLBACKS>}
     */
    lpD3DBufCallbacks {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }
}
