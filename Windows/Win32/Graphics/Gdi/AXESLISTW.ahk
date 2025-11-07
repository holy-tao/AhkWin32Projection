#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AXISINFOW.ahk

/**
 * The AXESLIST structure contains information on all the axes of a multiple master font.
 * @remarks
 * 
 * The PostScript Open Type Font does not support multiple master functionality.
 * 
 * The information on the axes of a multiple master font are specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axisinfoa">AXISINFO</a> structures. The <b>axlNumAxes</b> member specifies the actual size of <b>axlAxisInfo</b>, while MM_MAX_NUMAXES, which equals 16, is the maximum allowed size of <b>axlAxisInfo</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines AXESLIST as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-axeslistw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class AXESLISTW extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Reserved. Must be STAMP_AXESLIST.
     * @type {Integer}
     */
    axlReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of axes for a specified multiple master font.
     * @type {Integer}
     */
    axlNumAxes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axisinfoa">AXISINFO</a> structures. Each <b>AXISINFO</b> structure contains information on an axis of a specified multiple master font. This corresponds to the <b>dvValues</b> array in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a> structure.
     * @type {Array<AXISINFOW>}
     */
    axlAxisInfo{
        get {
            if(!this.HasProp("__axlAxisInfoProxyArray"))
                this.__axlAxisInfoProxyArray := Win32FixedArray(this.ptr + 8, 16, AXISINFOW, "")
            return this.__axlAxisInfoProxyArray
        }
    }
}
