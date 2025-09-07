#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\COLORADJUSTMENT.ahk

/**
 * The EMRSETCOLORADJUSTMENT structure contains members for the SetColorAdjustment enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrsetcoloradjustment
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETCOLORADJUSTMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The base structure for all record types.
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-coloradjustment">COLORADJUSTMENT</a> structure.
     * @type {COLORADJUSTMENT}
     */
    ColorAdjustment{
        get {
            if(!this.HasProp("__ColorAdjustment"))
                this.__ColorAdjustment := COLORADJUSTMENT(this.ptr + 8)
            return this.__ColorAdjustment
        }
    }
}
