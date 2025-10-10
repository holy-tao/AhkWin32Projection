#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TsActiveSelEnd enumeration specify which end of a text store selection is active.
 * @remarks
 * 
  * The active end of a selection is the end likely to respond to user actions. For example, in many applications, holding down the SHIFT key while using the arrow keys will change the selection. The end of the selection that moves is the active end of the selection.
  * 
  * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/textstor/ns-textstor-ts_selectionstyle">TS_SELECTIONSTYLE</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ne-textstor-tsactiveselend
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TsActiveSelEnd{

    /**
     * The selection has no active end. This is typical for all selections other than the default selection.
     * @type {Integer (Int32)}
     */
    static TS_AE_NONE => 0

    /**
     * The active end of the selection is at the start of the range of text.
     * @type {Integer (Int32)}
     */
    static TS_AE_START => 1

    /**
     * The active end of the selection is at the end of the range of text.
     * @type {Integer (Int32)}
     */
    static TS_AE_END => 2
}
