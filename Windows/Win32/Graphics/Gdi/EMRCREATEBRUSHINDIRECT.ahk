#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include .\LOGBRUSH32.ahk

/**
 * The EMRCREATEBRUSHINDIRECT structure contains members for the CreateBrushIndirect enhanced metafile record.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-emrcreatebrushindirect
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRCREATEBRUSHINDIRECT extends Win32Struct
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
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * Index of brush in handle table.
     * @type {Integer}
     */
    ihBrush {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush32">LOGBRUSH32</a> structure containing information about the brush. The <b>lbStyle</b> member must be either the BS_SOLID, BS_HOLLOW, BS_NULL, or BS_HATCHED value.
     * 
     * Note, that if your code is used on both 32-bit and 64-bit platforms, you must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush32">LOGBRUSH32</a> structure. This maintains compatibility between the platforms when you record the metafile on one platform and use it on the other platform. If your code remains on one platform, it is sufficient to use <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logbrush">LOGBRUSH</a>.
     * @type {LOGBRUSH32}
     */
    lb{
        get {
            if(!this.HasProp("__lb"))
                this.__lb := LOGBRUSH32(16, this)
            return this.__lb
        }
    }
}
