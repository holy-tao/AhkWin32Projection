#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GamutShellTriangle.ahk" { GamutShellTriangle }
#Import ".\JabColorF.ahk" { JabColorF }

/**
 * Contains information that defines a gamut shell, which is represented by a list of indexed triangles. The vertex buffer contains the vertices data.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-gamutshell
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct GamutShell {
    #StructPack 8

    /**
     * The minimum lightness of the shell.
     */
    JMin : Float32

    /**
     * The maximum lightness of the shell.
     */
    JMax : Float32

    /**
     * The number of vertices in the shell.
     */
    cVertices : UInt32

    /**
     * The number of triangles in the shell.
     */
    cTriangles : UInt32

    pVertices : JabColorF.Ptr

    pTriangles : GamutShellTriangle.Ptr

}
