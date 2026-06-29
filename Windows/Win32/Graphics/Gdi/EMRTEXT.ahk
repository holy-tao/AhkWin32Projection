#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * The EMRTEXT structure contains members for text output.
 * @remarks
 * The <b>EMRTEXT</b> structure is used as a member in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrexttextouta">EMREXTTEXTOUT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-emrpolytextouta">EMRPOLYTEXTOUT</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrtext
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRTEXT {
    #StructPack 4

    /**
     * The logical coordinates of the reference point used to position the string.
     */
    ptlReference : POINTL

    /**
     * The number of characters in the string.
     */
    nChars : UInt32

    /**
     * The offset to the string.
     */
    offString : UInt32

    /**
     * A value that indicates how to use the application-defined rectangle. This member can be a combination of the ETO_CLIPPED and ETO_OPAQUE values.
     */
    fOptions : UInt32

    /**
     * An optional clipping and/or opaquing rectangle, in logical units.
     */
    rcl : RECTL

    /**
     * The offset to the intercharacter spacing array.
     */
    offDx : UInt32

}
