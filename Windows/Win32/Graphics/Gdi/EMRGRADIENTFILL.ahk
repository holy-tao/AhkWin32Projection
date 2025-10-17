#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\TRIVERTEX.ahk

/**
 * The EMRGRADIENTFILL structure contains members for the GradientFill enhanced metafile record.
 * @remarks
 * 
  * This is a variable-length structure. The <b>Ver</b> member designates the beginning of the variable-length area. First comes an array of <b>nVer</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures to pass the vertices. Next comes an array of either <b>nTri</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_triangle">GRADIENT_TRIANGLE</a> structures or <b>nTri</b> <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-gradient_rect">GRADIENT_RECT</a> structures, depending on the value of <b>ulMode</b> (triangles or rectangles).
  * 
  * This structure is to be used during metafile playback.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrgradientfill
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRGRADIENTFILL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * The bounding rectangle, in device units.
     * @type {RECTL}
     */
    rclBounds{
        get {
            if(!this.HasProp("__rclBounds"))
                this.__rclBounds := RECTL(8, this)
            return this.__rclBounds
        }
    }

    /**
     * The number of vertices.
     * @type {Integer}
     */
    nVer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of rectangles or triangles to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a>.
     * @type {Integer}
     */
    nTri {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    ulMode {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-trivertex">TRIVERTEX</a> structures that each define a vertex.
     * @type {Array<TRIVERTEX>}
     */
    Ver{
        get {
            if(!this.HasProp("__VerProxyArray"))
                this.__VerProxyArray := Win32FixedArray(this.ptr + 40, 1, TRIVERTEX, "")
            return this.__VerProxyArray
        }
    }
}
