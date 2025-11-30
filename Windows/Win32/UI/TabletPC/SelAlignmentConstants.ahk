#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the alignment of the paragraph relative to the margins of the InkEdit control.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-selalignmentconstants
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class SelAlignmentConstants extends Win32Enum{

    /**
     * Default. The paragraph is aligned along the left margin.
     * @type {Integer (Int32)}
     */
    static rtfLeft => 0

    /**
     * The paragraph is aligned along the right margin.
     * @type {Integer (Int32)}
     */
    static rtfRight => 1

    /**
     * The paragraph is centered between the left and right margins.
     * @type {Integer (Int32)}
     */
    static rtfCenter => 2
}
