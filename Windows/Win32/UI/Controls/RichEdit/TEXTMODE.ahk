#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the text mode of a rich edit control. The EM_SETTEXTMODE and EM_GETTEXTMODE messages use this enumeration type.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ne-richedit-textmode
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TEXTMODE{

    /**
     * Indicates plain-text mode, in which the control is similar to a standard edit control. For more information about plain-text mode, see the Remarks section of <a href="https://msdn.microsoft.com/d6741234-0ef3-4cd2-8817-6c852f1b500d">EM_SETTEXTMODE</a>.
     * @type {Integer (Int32)}
     */
    static TM_PLAINTEXT => 1

    /**
     * Indicates rich-text mode, in which the control has the standard rich edit functionality. Rich-text mode is the default setting.
     * @type {Integer (Int32)}
     */
    static TM_RICHTEXT => 2

    /**
     * The control allows the user to undo only the last action in the undo queue.
     * @type {Integer (Int32)}
     */
    static TM_SINGLELEVELUNDO => 4

    /**
     * The control supports multiple undo actions. This is the default setting. Use the <a href="https://msdn.microsoft.com/485dbcda-89f4-40de-ad55-cd524958e910">EM_SETUNDOLIMIT</a> message to set the maximum number of undo actions.
     * @type {Integer (Int32)}
     */
    static TM_MULTILEVELUNDO => 8

    /**
     * The control only allows the English keyboard and a keyboard corresponding to the default character set. For example, you could have Greek and English. Note that this prevents Unicode text from entering the control. For example, use this value if a Rich Edit control must be restricted to ANSI text.
     * @type {Integer (Int32)}
     */
    static TM_SINGLECODEPAGE => 16

    /**
     * The control allows multiple code pages and Unicode text into the control. This is the default setting.
     * @type {Integer (Int32)}
     */
    static TM_MULTICODEPAGE => 32
}
