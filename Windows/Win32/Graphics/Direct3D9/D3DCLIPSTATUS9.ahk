#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the current clip status.
 * @remarks
 * When clipping is enabled during vertex processing (by [**ProcessVertices**](/windows/desktop/api), [**DrawPrimitive**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawprimitive), or other drawing functions), Direct3D computes a clip code for every vertex. The clip code is a combination of D3DCS\_\* bits. When a vertex is outside a particular clipping plane, the corresponding bit is set in the clipping code. Direct3D maintains the clip status using **D3DCLIPSTATUS9**, which has ClipUnion and ClipIntersection members. ClipUnion is a bitwise OR of all vertex clip codes and ClipIntersection is a bitwise AND of all vertex clip codes. Initial values are zero for ClipUnion and 0xFFFFFFFF for ClipIntersection. When D3DRS\_CLIPPING is set to **FALSE**, ClipUnion and ClipIntersection are set to zero. Direct3D updates the clip status during drawing calls. To compute clip status for a particular object, set ClipUnion and ClipIntersection to their initial value and continue drawing.
 * 
 * Clip status is not updated by [**DrawRectPatch**](/windows/desktop/api) and [**DrawTriPatch**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawtripatch) because there is no software emulation for them.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dclipstatus9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCLIPSTATUS9 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Clip union flags that describe the current clip status. This member can be one or more of the following flags:
     * 
     * 
     * 
     * | Value                                                                                                                                                      | Meaning                                                                         |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
     * | <span id="D3DCS_ALL"></span><span id="d3dcs_all"></span><dl> <dt>**D3DCS\_ALL**</dt> </dl>          | Combination of all clip flags.<br/>                                       |
     * | <span id="D3DCS_LEFT"></span><span id="d3dcs_left"></span><dl> <dt>**D3DCS\_LEFT**</dt> </dl>       | All vertices are clipped by the left plane of the viewing frustum.<br/>   |
     * | <span id="D3DCS_RIGHT"></span><span id="d3dcs_right"></span><dl> <dt>**D3DCS\_RIGHT**</dt> </dl>    | All vertices are clipped by the right plane of the viewing frustum.<br/>  |
     * | <span id="D3DCS_TOP"></span><span id="d3dcs_top"></span><dl> <dt>**D3DCS\_TOP**</dt> </dl>          | All vertices are clipped by the top plane of the viewing frustum.<br/>    |
     * | <span id="D3DCS_BOTTOM"></span><span id="d3dcs_bottom"></span><dl> <dt>**D3DCS\_BOTTOM**</dt> </dl> | All vertices are clipped by the bottom plane of the viewing frustum.<br/> |
     * | <span id="D3DCS_FRONT"></span><span id="d3dcs_front"></span><dl> <dt>**D3DCS\_FRONT**</dt> </dl>    | All vertices are clipped by the front plane of the viewing frustum.<br/>  |
     * | <span id="D3DCS_BACK"></span><span id="d3dcs_back"></span><dl> <dt>**D3DCS\_BACK**</dt> </dl>       | All vertices are clipped by the back plane of the viewing frustum.<br/>   |
     * | <span id="D3DCS_PLANE0"></span><span id="d3dcs_plane0"></span><dl> <dt>**D3DCS\_PLANE0**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * | <span id="D3DCS_PLANE1"></span><span id="d3dcs_plane1"></span><dl> <dt>**D3DCS\_PLANE1**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * | <span id="D3DCS_PLANE2"></span><span id="d3dcs_plane2"></span><dl> <dt>**D3DCS\_PLANE2**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * | <span id="D3DCS_PLANE3"></span><span id="d3dcs_plane3"></span><dl> <dt>**D3DCS\_PLANE3**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * | <span id="D3DCS_PLANE4"></span><span id="d3dcs_plane4"></span><dl> <dt>**D3DCS\_PLANE4**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * | <span id="D3DCS_PLANE5"></span><span id="d3dcs_plane5"></span><dl> <dt>**D3DCS\_PLANE5**</dt> </dl> | Application-defined clipping planes.<br/>                                 |
     * @type {Integer}
     */
    ClipUnion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[**DWORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Clip intersection flags that describe the current clip status. This member can take the same flags as ClipUnion.
     * @type {Integer}
     */
    ClipIntersection {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
