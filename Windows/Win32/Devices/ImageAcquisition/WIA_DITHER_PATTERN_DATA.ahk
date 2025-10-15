#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * The WIA_DITHER_PATTERN_DATA structure specifies a dither pattern for scanners. It is used in conjunction with the scanner device property constant WIA_DPS_DITHER_PATTERN_DATA.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/ns-wia_xp-wia_dither_pattern_data
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_DITHER_PATTERN_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the size of this structure in bytes. Should be set to <b>sizeof(WIA_DITHER_PATTERN_DATA)</b>.
     * @type {Integer}
     */
    lSize {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that contains the name of this dither pattern.
     * @type {BSTR}
     */
    bstrPatternName{
        get {
            if(!this.HasProp("__bstrPatternName"))
                this.__bstrPatternName := BSTR(this.ptr + 8)
            return this.__bstrPatternName
        }
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Indicates the width of the dither pattern in bytes.
     * @type {Integer}
     */
    lPatternWidth {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Indicates the length of the dither pattern in bytes.
     * @type {Integer}
     */
    lPatternLength {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the total number of bytes in the array pointed to by the <b>pbPattern</b> member.
     * @type {Integer}
     */
    cbPattern {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>BYTE*</b>
     * 
     * Specifies a pointer to a buffer that contains the dither pattern.
     * @type {Pointer<Byte>}
     */
    pbPattern {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
