#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the sequence in which text is written on its parent element.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_WRITING_MODE extends Win32Enum {

    /**
     * Text is written from left to right and top to bottom.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_LRTB
     * @type {Integer (Int32)}
     */
    static LRTB => 0

    /**
     * Text is written from right to left and top to bottom.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_RLTB
     * @type {Integer (Int32)}
     */
    static RLTB => 1

    /**
     * Text is written from top to bottom and right to left.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_TBRL
     * @type {Integer (Int32)}
     */
    static TBRL => 2

    /**
     * Text is written from top to bottom and left to right.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_TBLR
     * @type {Integer (Int32)}
     */
    static TBLR => 3

    /**
     * Text is written from left to right.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_LR
     * @type {Integer (Int32)}
     */
    static LR => 4

    /**
     * Text is written from right to left.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_RL
     * @type {Integer (Int32)}
     */
    static RL => 5

    /**
     * Text is written from top to bottom.
     * Native name: MF_TIMED_TEXT_WRITING_MODE_TB
     * @type {Integer (Int32)}
     */
    static TB => 6
}
