#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains three vertex indices for accessing a vertex buffer.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/ns-wcsplugin-gamutshelltriangle
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class GamutShellTriangle extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * An array of three vertex indices that are used for accessing a vertex buffer.
     * @type {Array<UInt32>}
     */
    aVertexIndex{
        get {
            if(!this.HasProp("__aVertexIndexProxyArray"))
                this.__aVertexIndexProxyArray := Win32FixedArray(this.ptr + 0, 3, Primitive, "uint")
            return this.__aVertexIndexProxyArray
        }
    }
}
