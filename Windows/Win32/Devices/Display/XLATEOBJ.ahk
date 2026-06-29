#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The XLATEOBJ structure is used to translate color indexes from one palette to another.
 * @remarks
 * The destination palette always belongs to the destination surface of some drawing operation. The source palette is an application-selected palette or a palette from another surface.
 * 
 * The XLATEOBJ structure is used to translate color indices that refer to the source palette to indices for the destination palette. The resulting index identifies a color that matches the source color as closely as possible.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xlateobj
 * @namespace Windows.Win32.Devices.Display
 */
export default struct XLATEOBJ {
    #StructPack 8

    /**
     * A cache identifier that enables the driver to recognize an XLATEOBJ structure that it has previously cached. If this member is zero, the driver should not cache the XLATEOBJ structure.
     */
    iUniq : UInt32

    flXlate : UInt32

    /**
     * Is obsolete. Use <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_cgetpalette">XLATEOBJ_cGetPalette</a> to query the source format.
     */
    iSrcType : UInt16

    /**
     * Is obsolete. Use <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_cgetpalette">XLATEOBJ_cGetPalette</a> to query the destination format.
     */
    iDstType : UInt16

    /**
     * Specifies the number of entries in the array pointed to by the <b>pulXlate</b> member. Indexing into <b>pulXlate</b> with a value greater than <b>cEntries</b> results in a memory access violation.
     */
    cEntries : UInt32

    /**
     * Pointer to an array of translation entries.
     */
    pulXlate : IntPtr

}
