#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the sequence in which text is written on its parent element.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_WRITING_MODE extends Win32Enum{

    /**
     * Text is written from left to right and top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_LRTB => 0

    /**
     * Text is written from right to left and top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_RLTB => 1

    /**
     * Text is written from top to bottom and right to left.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TBRL => 2

    /**
     * Text is written from top to bottom and left to right.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TBLR => 3

    /**
     * Text is written from left to right.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_LR => 4

    /**
     * Text is written from right to left.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_RL => 5

    /**
     * Text is written from top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TB => 6
}
