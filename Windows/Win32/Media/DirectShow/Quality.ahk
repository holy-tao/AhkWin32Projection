#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Quality structure describes a quality message by indicating Flood or Famine in the renderer and specifying the percentage of frames to drop or add to optimize the renderer's performance.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-quality
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class Quality extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Value from the [QualityMessageType](/windows/desktop/api/strmif/ne-strmif-qualitymessagetype) enumeration, indicating whether the downstream filter needs more or less data.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Value that specifies the rate at which DirectShow should continue to send media samples. The base value is 1000, which indicates there should be no change. A percentage increase or decrease from 1000 indicates the percentage of frames to add or drop. If this value is 800, for example, DirectShow will drop 20 percent of the incoming frames to match the renderer's speed.
     * @type {Integer}
     */
    Proportion {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * If a famine exists downstream, this is the amount of time by which the stream is lagging.
     * @type {Integer}
     */
    Late {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Value that specifies the time when DirectShow created this structure, which is usually the start time on a video sample.
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
