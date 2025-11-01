#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-composition_frame_id_type
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_FRAME_ID_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_CREATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_CONFIRMED => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_COMPLETED => 2
}
