#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes a quality message type.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-qualitymessagetype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class QualityMessageType{

    /**
     * Downstream filter needs more data.
     * @type {Integer (Int32)}
     */
    static Famine => 0

    /**
     * Downstream filter needs less data.
     * @type {Integer (Int32)}
     */
    static Flood => 1
}
