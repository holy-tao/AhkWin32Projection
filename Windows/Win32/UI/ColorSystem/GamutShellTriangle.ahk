#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains three vertex indices for accessing a vertex buffer.
 * @see https://learn.microsoft.com/windows/win32/api/wcsplugin/ns-wcsplugin-gamutshelltriangle
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct GamutShellTriangle {
    #StructPack 4

    /**
     * An array of three vertex indices that are used for accessing a vertex buffer.
     */
    aVertexIndex : UInt32[3]

}
