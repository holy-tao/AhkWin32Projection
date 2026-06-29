#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QualityMessageType.ahk" { QualityMessageType }

/**
 * The Quality structure describes a quality message by indicating Flood or Famine in the renderer and specifying the percentage of frames to drop or add to optimize the renderer's performance.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-quality
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct Quality {
    #StructPack 8

    /**
     * Value from the [QualityMessageType](/windows/desktop/api/strmif/ne-strmif-qualitymessagetype) enumeration, indicating whether the downstream filter needs more or less data.
     */
    Type : QualityMessageType

    /**
     * Value that specifies the rate at which DirectShow should continue to send media samples. The base value is 1000, which indicates there should be no change. A percentage increase or decrease from 1000 indicates the percentage of frames to add or drop. If this value is 800, for example, DirectShow will drop 20 percent of the incoming frames to match the renderer's speed.
     */
    Proportion : Int32

    /**
     * If a famine exists downstream, this is the amount of time by which the stream is lagging.
     */
    Late : Int64

    /**
     * Value that specifies the time when DirectShow created this structure, which is usually the start time on a video sample.
     */
    TimeStamp : Int64

}
