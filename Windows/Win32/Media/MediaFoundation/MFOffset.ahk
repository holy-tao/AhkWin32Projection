#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies an offset as a fixed-point real number.
 * @remarks
 * The value of the number is <b>value</b> + (<b>fract</b> / 65536.0f).
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfoffset
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFOffset {
    #StructPack 2

    /**
     * The fractional part of the number.
     */
    fract : UInt16

    /**
     * The integer part of the number.
     */
    value : Int16

}
