#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
class UIA_EVENT_ID extends Win32Enum {

    /**
     * Native name: UIA_ToolTipOpenedEventId
     * @type {Integer (Int32)}
     */
    static ToolTipOpenedEventId => 20000

    /**
     * Native name: UIA_ToolTipClosedEventId
     * @type {Integer (Int32)}
     */
    static ToolTipClosedEventId => 20001

    /**
     * Native name: UIA_StructureChangedEventId
     * @type {Integer (Int32)}
     */
    static StructureChangedEventId => 20002

    /**
     * Native name: UIA_MenuOpenedEventId
     * @type {Integer (Int32)}
     */
    static MenuOpenedEventId => 20003

    /**
     * Native name: UIA_AutomationPropertyChangedEventId
     * @type {Integer (Int32)}
     */
    static AutomationPropertyChangedEventId => 20004

    /**
     * Native name: UIA_AutomationFocusChangedEventId
     * @type {Integer (Int32)}
     */
    static AutomationFocusChangedEventId => 20005

    /**
     * Native name: UIA_AsyncContentLoadedEventId
     * @type {Integer (Int32)}
     */
    static AsyncContentLoadedEventId => 20006

    /**
     * Native name: UIA_MenuClosedEventId
     * @type {Integer (Int32)}
     */
    static MenuClosedEventId => 20007

    /**
     * Native name: UIA_LayoutInvalidatedEventId
     * @type {Integer (Int32)}
     */
    static LayoutInvalidatedEventId => 20008

    /**
     * Native name: UIA_Invoke_InvokedEventId
     * @type {Integer (Int32)}
     */
    static Invoke_InvokedEventId => 20009

    /**
     * Native name: UIA_SelectionItem_ElementAddedToSelectionEventId
     * @type {Integer (Int32)}
     */
    static SelectionItem_ElementAddedToSelectionEventId => 20010

    /**
     * Native name: UIA_SelectionItem_ElementRemovedFromSelectionEventId
     * @type {Integer (Int32)}
     */
    static SelectionItem_ElementRemovedFromSelectionEventId => 20011

    /**
     * Native name: UIA_SelectionItem_ElementSelectedEventId
     * @type {Integer (Int32)}
     */
    static SelectionItem_ElementSelectedEventId => 20012

    /**
     * Native name: UIA_Selection_InvalidatedEventId
     * @type {Integer (Int32)}
     */
    static Selection_InvalidatedEventId => 20013

    /**
     * Native name: UIA_Text_TextSelectionChangedEventId
     * @type {Integer (Int32)}
     */
    static Text_TextSelectionChangedEventId => 20014

    /**
     * Native name: UIA_Text_TextChangedEventId
     * @type {Integer (Int32)}
     */
    static Text_TextChangedEventId => 20015

    /**
     * Native name: UIA_Window_WindowOpenedEventId
     * @type {Integer (Int32)}
     */
    static Window_WindowOpenedEventId => 20016

    /**
     * Native name: UIA_Window_WindowClosedEventId
     * @type {Integer (Int32)}
     */
    static Window_WindowClosedEventId => 20017

    /**
     * Native name: UIA_MenuModeStartEventId
     * @type {Integer (Int32)}
     */
    static MenuModeStartEventId => 20018

    /**
     * Native name: UIA_MenuModeEndEventId
     * @type {Integer (Int32)}
     */
    static MenuModeEndEventId => 20019

    /**
     * Native name: UIA_InputReachedTargetEventId
     * @type {Integer (Int32)}
     */
    static InputReachedTargetEventId => 20020

    /**
     * Native name: UIA_InputReachedOtherElementEventId
     * @type {Integer (Int32)}
     */
    static InputReachedOtherElementEventId => 20021

    /**
     * Native name: UIA_InputDiscardedEventId
     * @type {Integer (Int32)}
     */
    static InputDiscardedEventId => 20022

    /**
     * Native name: UIA_SystemAlertEventId
     * @type {Integer (Int32)}
     */
    static SystemAlertEventId => 20023

    /**
     * Native name: UIA_LiveRegionChangedEventId
     * @type {Integer (Int32)}
     */
    static LiveRegionChangedEventId => 20024

    /**
     * Native name: UIA_HostedFragmentRootsInvalidatedEventId
     * @type {Integer (Int32)}
     */
    static HostedFragmentRootsInvalidatedEventId => 20025

    /**
     * Native name: UIA_Drag_DragStartEventId
     * @type {Integer (Int32)}
     */
    static Drag_DragStartEventId => 20026

    /**
     * Native name: UIA_Drag_DragCancelEventId
     * @type {Integer (Int32)}
     */
    static Drag_DragCancelEventId => 20027

    /**
     * Native name: UIA_Drag_DragCompleteEventId
     * @type {Integer (Int32)}
     */
    static Drag_DragCompleteEventId => 20028

    /**
     * Native name: UIA_DropTarget_DragEnterEventId
     * @type {Integer (Int32)}
     */
    static DropTarget_DragEnterEventId => 20029

    /**
     * Native name: UIA_DropTarget_DragLeaveEventId
     * @type {Integer (Int32)}
     */
    static DropTarget_DragLeaveEventId => 20030

    /**
     * Native name: UIA_DropTarget_DroppedEventId
     * @type {Integer (Int32)}
     */
    static DropTarget_DroppedEventId => 20031

    /**
     * Native name: UIA_TextEdit_TextChangedEventId
     * @type {Integer (Int32)}
     */
    static TextEdit_TextChangedEventId => 20032

    /**
     * Native name: UIA_TextEdit_ConversionTargetChangedEventId
     * @type {Integer (Int32)}
     */
    static TextEdit_ConversionTargetChangedEventId => 20033

    /**
     * Native name: UIA_ChangesEventId
     * @type {Integer (Int32)}
     */
    static ChangesEventId => 20034

    /**
     * Native name: UIA_NotificationEventId
     * @type {Integer (Int32)}
     */
    static NotificationEventId => 20035

    /**
     * Native name: UIA_ActiveTextPositionChangedEventId
     * @type {Integer (Int32)}
     */
    static ActiveTextPositionChangedEventId => 20036
}
