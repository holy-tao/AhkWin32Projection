#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GLYPHBITS.ahk" { GLYPHBITS }
#Import ".\PATHOBJ.ahk" { PATHOBJ }

/**
 * The GLYPHDEF union identifies individual glyphs and provides either a pointer to a GLYPHBITS structure or a pointer to a PATHOBJ structure.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-glyphdef
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GLYPHDEF {
    #StructPack 8

    /**
     * If <b>pgb</b> is defined, this member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphbits">GLYPHBITS</a> structure. The driver can use the bitmap bits stored in this structure to form the associated glyph on its surface.
     */
    pgb : GLYPHBITS.Ptr

    static __New() {
        DefineProp(this.Prototype, 'ppo', { type: PATHOBJ.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
