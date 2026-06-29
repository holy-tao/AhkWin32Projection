#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RECO_LATTICE_PROPERTY.ahk" { RECO_LATTICE_PROPERTY }

/**
 * Contains an array of pointers to property structures.
 * @remarks
 * The <i>apProps</i> element contains an array of pointers to properties rather than the structures themselves so that property values can be reused with multiple elements with lower memory usage.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_lattice_properties
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_LATTICE_PROPERTIES {
    #StructPack 8

    /**
     * A count of the properties in the array of properties.
     */
    cProperties : UInt32

    /**
     * An array of pointers to properties.
     */
    apProps : IntPtr

}
