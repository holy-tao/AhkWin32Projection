#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_RATIONAL.ahk

/**
 * Specifies the pixel aspect ratio (PAR) for the source and destination rectangles.
 * @remarks
 * Pixel aspect ratios of the form 0/<i>n</i> and <i>n</i>/0 are not valid.
 * 
 * If the <b>Enable</b> member is <b>FALSE</b>, the device ignores the values of <b>SourceAspectRatio</b> and <b>DestinationAspectRatio</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_aspect_ratio_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_ASPECT_RATIO_DATA extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * <b>If TRUE</b>, the <b>SourceAspectRatio</b> and <b>DestinationAspectRatio</b> members contain valid values<b></b>. Otherwise, the pixel aspect ratios are unspecified.
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that contains the source PAR. The default state value is 1:1 (square pixels).
     * @type {DXVAHD_RATIONAL}
     */
    SourceAspectRatio{
        get {
            if(!this.HasProp("__SourceAspectRatio"))
                this.__SourceAspectRatio := DXVAHD_RATIONAL(4, this)
            return this.__SourceAspectRatio
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that contains the destination PAR. The default state value is 1:1 (square pixels).
     * @type {DXVAHD_RATIONAL}
     */
    DestinationAspectRatio{
        get {
            if(!this.HasProp("__DestinationAspectRatio"))
                this.__DestinationAspectRatio := DXVAHD_RATIONAL(12, this)
            return this.__DestinationAspectRatio
        }
    }
}
