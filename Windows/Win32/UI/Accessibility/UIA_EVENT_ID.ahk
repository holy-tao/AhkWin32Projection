#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UIA_EVENT_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ToolTipOpenedEventId => 20000

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ToolTipClosedEventId => 20001

    /**
     * @type {Integer (Int32)}
     */
    static UIA_StructureChangedEventId => 20002

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MenuOpenedEventId => 20003

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AutomationPropertyChangedEventId => 20004

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AutomationFocusChangedEventId => 20005

    /**
     * @type {Integer (Int32)}
     */
    static UIA_AsyncContentLoadedEventId => 20006

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MenuClosedEventId => 20007

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LayoutInvalidatedEventId => 20008

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Invoke_InvokedEventId => 20009

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionItem_ElementAddedToSelectionEventId => 20010

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionItem_ElementRemovedFromSelectionEventId => 20011

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SelectionItem_ElementSelectedEventId => 20012

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Selection_InvalidatedEventId => 20013

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Text_TextSelectionChangedEventId => 20014

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Text_TextChangedEventId => 20015

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Window_WindowOpenedEventId => 20016

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Window_WindowClosedEventId => 20017

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MenuModeStartEventId => 20018

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MenuModeEndEventId => 20019

    /**
     * @type {Integer (Int32)}
     */
    static UIA_InputReachedTargetEventId => 20020

    /**
     * @type {Integer (Int32)}
     */
    static UIA_InputReachedOtherElementEventId => 20021

    /**
     * @type {Integer (Int32)}
     */
    static UIA_InputDiscardedEventId => 20022

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SystemAlertEventId => 20023

    /**
     * @type {Integer (Int32)}
     */
    static UIA_LiveRegionChangedEventId => 20024

    /**
     * @type {Integer (Int32)}
     */
    static UIA_HostedFragmentRootsInvalidatedEventId => 20025

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Drag_DragStartEventId => 20026

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Drag_DragCancelEventId => 20027

    /**
     * @type {Integer (Int32)}
     */
    static UIA_Drag_DragCompleteEventId => 20028

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DropTarget_DragEnterEventId => 20029

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DropTarget_DragLeaveEventId => 20030

    /**
     * @type {Integer (Int32)}
     */
    static UIA_DropTarget_DroppedEventId => 20031

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TextEdit_TextChangedEventId => 20032

    /**
     * @type {Integer (Int32)}
     */
    static UIA_TextEdit_ConversionTargetChangedEventId => 20033

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ChangesEventId => 20034

    /**
     * @type {Integer (Int32)}
     */
    static UIA_NotificationEventId => 20035

    /**
     * @type {Integer (Int32)}
     */
    static UIA_ActiveTextPositionChangedEventId => 20036
}
