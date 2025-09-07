#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a Message Authentication Code (MAC).
 * @see https://learn.microsoft.com/windows/win32/medfound/d3d-omac
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3D_OMAC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * A byte array that contains the cryptographic MAC value of the message.
     * @type {Array<Byte>}
     */
    Omac{
        get {
            if(!this.HasProp("__OmacProxyArray"))
                this.__OmacProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__OmacProxyArray
        }
    }
}
