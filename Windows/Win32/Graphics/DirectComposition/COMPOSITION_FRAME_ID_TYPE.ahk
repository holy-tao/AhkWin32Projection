#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the status of a compositor frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-composition_frame_id_type
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class COMPOSITION_FRAME_ID_TYPE{

    /**
     * The compositor has started working on the frame.
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_CREATED => 0

    /**
     * CPU work is completed and any presents have taken place.
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_CONFIRMED => 1

    /**
     * GPU work is completed for all render targets associated with the frame.
     * @type {Integer (Int32)}
     */
    static COMPOSITION_FRAME_ID_COMPLETED => 2
}
