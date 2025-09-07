#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TfActiveSelEnd enumeration specify which end of a selected range of text is active.
 * @remarks
 * The active end of a selected range is the end likely to respond to user actions. For example, in many applications, holding the SHIFT key down while using the arrow keys will change the selected range. The end of the selected range that moves is the active end of the selected range.
  * 
  * This enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/ns-msctf-tf_selectionstyle">TF_SELECTIONSTYLE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tfactiveselend
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfActiveSelEnd{

    /**
     * The selected range has no active end. This is typical for selected ranges other than the default selected range.
     * @type {Integer (Int32)}
     */
    static TF_AE_NONE => 0

    /**
     * The active end is at the start of the selected range.
     * @type {Integer (Int32)}
     */
    static TF_AE_START => 1

    /**
     * The active end is at the end of the selected range.
     * @type {Integer (Int32)}
     */
    static TF_AE_END => 2
}
