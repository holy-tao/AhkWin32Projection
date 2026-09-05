#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the status of a compositor frame.
 * @see https://learn.microsoft.com/windows/win32/api/dcomptypes/ne-dcomptypes-composition_frame_id_type
 * @namespace Windows.Win32.Graphics.DirectComposition
 */
class COMPOSITION_FRAME_ID_TYPE extends Win32Enum {

    /**
     * The compositor has started working on the frame.
     * Native name: COMPOSITION_FRAME_ID_CREATED
     * @type {Integer (Int32)}
     */
    static CREATED => 0

    /**
     * CPU work is completed and any presents have taken place.
     * Native name: COMPOSITION_FRAME_ID_CONFIRMED
     * @type {Integer (Int32)}
     */
    static CONFIRMED => 1

    /**
     * GPU work is completed for all render targets associated with the frame.
     * Native name: COMPOSITION_FRAME_ID_COMPLETED
     * @type {Integer (Int32)}
     */
    static COMPLETED => 2
}
