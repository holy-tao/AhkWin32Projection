#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that defines a gamut shell, which is represented by a list of indexed triangles. The vertex buffer contains the vertices data.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-gamutshell
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class GamutShell extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The minimum lightness of the shell.
     * @type {Float}
     */
    JMin {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The maximum lightness of the shell.
     * @type {Float}
     */
    JMax {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The number of vertices in the shell.
     * @type {Integer}
     */
    cVertices {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of triangles in the shell.
     * @type {Integer}
     */
    cTriangles {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Pointer<JabColorF>}
     */
    pVertices {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Pointer<GamutShellTriangle>}
     */
    pTriangles {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
