#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about one or more revoked components.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mfrr_components
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFRR_COMPONENTS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Revocation information version.
     * @type {Integer}
     */
    dwRRInfoVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of elements in the <b>pRRComponents</b> array.
     * @type {Integer}
     */
    dwRRComponents {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ns-mfidl-mfrr_component_hash_info">MFRR_COMPONENT_HASH_INFO</a> structures.
     * @type {Pointer<MFRR_COMPONENT_HASH_INFO>}
     */
    pRRComponents {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
