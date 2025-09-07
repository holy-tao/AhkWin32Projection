#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a buffer for the IDirect3DDXVADevice9::Execute method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxvabufferinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVABufferInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to the <b>IDirect3DSurface9</b> interface.
     * @type {Pointer<Void>}
     */
    pCompSurface {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the relevant data in the buffer, in bytes.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
