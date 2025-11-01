#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_KeyingMaterial structure.
 * @see https://docs.microsoft.com/windows/win32/api//schannel/ns-schannel-secpkgcontext_keyingmaterial
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_KeyingMaterial extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The length, in bytes, of the keying material to be exported. Must be greater than zero.
     * @type {Integer}
     */
    cbKeyingMaterial {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the buffer containing the exported keying material. After use, deallocate the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a>.
     * @type {Pointer<Integer>}
     */
    pbKeyingMaterial {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
