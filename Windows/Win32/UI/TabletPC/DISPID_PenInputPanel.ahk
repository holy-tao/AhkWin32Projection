#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_PenInputPanel extends Win32Enum {

    /**
     * Native name: DISPID_PIPAttachedEditWindow
     * @type {Integer (Int32)}
     */
    static PIPAttachedEditWindow => 0

    /**
     * Native name: DISPID_PIPFactoid
     * @type {Integer (Int32)}
     */
    static PIPFactoid => 1

    /**
     * Native name: DISPID_PIPCurrentPanel
     * @type {Integer (Int32)}
     */
    static PIPCurrentPanel => 2

    /**
     * Native name: DISPID_PIPDefaultPanel
     * @type {Integer (Int32)}
     */
    static PIPDefaultPanel => 3

    /**
     * Native name: DISPID_PIPVisible
     * @type {Integer (Int32)}
     */
    static PIPVisible => 4

    /**
     * Native name: DISPID_PIPTop
     * @type {Integer (Int32)}
     */
    static PIPTop => 5

    /**
     * Native name: DISPID_PIPLeft
     * @type {Integer (Int32)}
     */
    static PIPLeft => 6

    /**
     * Native name: DISPID_PIPWidth
     * @type {Integer (Int32)}
     */
    static PIPWidth => 7

    /**
     * Native name: DISPID_PIPHeight
     * @type {Integer (Int32)}
     */
    static PIPHeight => 8

    /**
     * Native name: DISPID_PIPMoveTo
     * @type {Integer (Int32)}
     */
    static PIPMoveTo => 9

    /**
     * Native name: DISPID_PIPCommitPendingInput
     * @type {Integer (Int32)}
     */
    static PIPCommitPendingInput => 10

    /**
     * Native name: DISPID_PIPRefresh
     * @type {Integer (Int32)}
     */
    static PIPRefresh => 11

    /**
     * Native name: DISPID_PIPBusy
     * @type {Integer (Int32)}
     */
    static PIPBusy => 12

    /**
     * Native name: DISPID_PIPVerticalOffset
     * @type {Integer (Int32)}
     */
    static PIPVerticalOffset => 13

    /**
     * Native name: DISPID_PIPHorizontalOffset
     * @type {Integer (Int32)}
     */
    static PIPHorizontalOffset => 14

    /**
     * Native name: DISPID_PIPEnableTsf
     * @type {Integer (Int32)}
     */
    static PIPEnableTsf => 15

    /**
     * Native name: DISPID_PIPAutoShow
     * @type {Integer (Int32)}
     */
    static PIPAutoShow => 16
}
