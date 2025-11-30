#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class FLYOUTPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_HEADER => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_BODY => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LABEL => 3

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINK => 4

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_DIVIDER => 5

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_WINDOW => 6

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINKAREA => 7

    /**
     * @type {Integer (Int32)}
     */
    static FLYOUT_LINKHEADER => 8
}
