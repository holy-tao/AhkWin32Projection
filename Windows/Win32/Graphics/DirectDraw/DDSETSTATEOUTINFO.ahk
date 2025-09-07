#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDSETSTATEOUTINFO structure contains the state information for the video port extensions (VPE) object.
 * @remarks
 * When asked to switch from bob to weave, the video miniport driver might need to switch from hardware autoflipping to software autoflipping (no current hardware supports automatic field skipping, and so on). All the driver has to do is set the <b>bSoftwareAutoflip</b> member to a nonzero value and DirectDraw reverts to software autoflipping. 
  * 
  * If the miniport driver switches from hardware to software autoflipping, DirectDraw must know which surface is currently receiving data from the VPE object so it can continue without causing a glitch. Therefore, the miniport driver must set the <b>dwSurfaceIndex</b> member to the index in the autoflip chain of the surface currently receiving the data from the VPE object. When <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> is called, it gives an array of surfaces that the driver can autoflip between. You can program the addresses of these surfaces that are used for software autoflipping into your hardware.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddsetstateoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSETSTATEOUTINFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * When set to a nonzero value, causes Microsoft DirectDraw to revert to software autoflipping. Note that once software autoflipping has been initiated, you cannot revert back to hardware autoflipping until the VPE object and surface are destroyed and restarted.
     * @type {Integer}
     */
    bSoftwareAutoflip {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates the zero-based index in the autoflip chain of the surface currently receiving the data from the VPE object. This field is ignored unless the miniport driver is switching from hardware autoflipping to software autoflipping.
     * @type {Integer}
     */
    dwSurfaceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates the zero-based index in the autoflip chain of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">vertical blanking interval (VBI)</a> surface currently receiving the data from the VPE object. This field is ignored unless the video miniport driver is switching from hardware autoflipping to software autoflipping.
     * @type {Integer}
     */
    dwVBISurfaceIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
