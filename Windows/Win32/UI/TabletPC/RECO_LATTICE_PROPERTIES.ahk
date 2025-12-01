#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of pointers to property structures.
 * @remarks
 * The <i>apProps</i> element contains an array of pointers to properties rather than the structures themselves so that property values can be reused with multiple elements with lower memory usage.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice_properties
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_LATTICE_PROPERTIES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A count of the properties in the array of properties.
     * @type {Integer}
     */
    cProperties {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of pointers to properties.
     * @type {Pointer<Pointer<RECO_LATTICE_PROPERTY>>}
     */
    apProps {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
