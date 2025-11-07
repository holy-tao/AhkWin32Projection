#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the condition at the edges of inline object or text used to determine line-breaking behavior.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_break_condition
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_BREAK_CONDITION{

    /**
     * Indicates whether a break is allowed by determining  the condition of the neighboring text span or inline object.
     * @type {Integer (Int32)}
     */
    static DWRITE_BREAK_CONDITION_NEUTRAL => 0

    /**
     * Indicates that a line break is allowed, unless overruled by the condition of the
     *      neighboring text span or inline object, either prohibited by a
     *      "may not break" condition or forced by a "must break" condition.
     * @type {Integer (Int32)}
     */
    static DWRITE_BREAK_CONDITION_CAN_BREAK => 1

    /**
     * Indicates that there should be no line  break, unless overruled by a "must break" condition from
     *      the neighboring text span or inline object.
     * @type {Integer (Int32)}
     */
    static DWRITE_BREAK_CONDITION_MAY_NOT_BREAK => 2

    /**
     * Indicates that the line break must happen, regardless of the condition of the adjacent
     *      text span or inline object.
     * @type {Integer (Int32)}
     */
    static DWRITE_BREAK_CONDITION_MUST_BREAK => 3
}
