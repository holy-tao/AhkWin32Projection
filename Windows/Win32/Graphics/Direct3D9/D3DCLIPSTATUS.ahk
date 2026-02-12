#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the current clip status.
 * @remarks
 * When clipping is enabled during vertex processing (by [**ProcessVertices**](/windows/desktop/api), [**DrawPrimitive**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawprimitive), or other drawing functions), Direct3D computes a clip code for every vertex. The clip code is a combination of D3DCS\_\* bits. When a vertex is outside a particular clipping plane, the corresponding bit is set in the clipping code. Direct3D maintains the clip status using **D3DCLIPSTATUS9**, which has ClipUnion and ClipIntersection members. ClipUnion is a bitwise OR of all vertex clip codes and ClipIntersection is a bitwise AND of all vertex clip codes. Initial values are zero for ClipUnion and 0xFFFFFFFF for ClipIntersection. When D3DRS\_CLIPPING is set to **FALSE**, ClipUnion and ClipIntersection are set to zero. Direct3D updates the clip status during drawing calls. To compute clip status for a particular object, set ClipUnion and ClipIntersection to their initial value and continue drawing.
 * 
 * Clip status is not updated by [**DrawRectPatch**](/windows/desktop/api) and [**DrawTriPatch**](/windows/win32/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-drawtripatch) because there is no software emulation for them.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3d9/d3dclipstatus9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCLIPSTATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Float}
     */
    minx {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    maxx {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    miny {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    maxy {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {Float}
     */
    minz {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * @type {Float}
     */
    maxz {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }
}
