#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the control pattern that the [GetPattern](automationpeer_getpattern_2046576749.md) method returns.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.patterninterface
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class PatternInterface extends Win32Enum{

    /**
     * The [IInvokeProvider](../windows.ui.xaml.automation.provider/iinvokeprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Invoke => 0

    /**
     * The [ISelectionProvider](../windows.ui.xaml.automation.provider/iselectionprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Selection => 1

    /**
     * The [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Value => 2

    /**
     * The [IRangeValueProvider](../windows.ui.xaml.automation.provider/irangevalueprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static RangeValue => 3

    /**
     * The [IScrollProvider](../windows.ui.xaml.automation.provider/iscrollprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Scroll => 4

    /**
     * The [IScrollItemProvider](../windows.ui.xaml.automation.provider/iscrollitemprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static ScrollItem => 5

    /**
     * The [IExpandCollapseProvider](../windows.ui.xaml.automation.provider/iexpandcollapseprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static ExpandCollapse => 6

    /**
     * The [IGridProvider](../windows.ui.xaml.automation.provider/igridprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Grid => 7

    /**
     * The [IGridItemProvider](../windows.ui.xaml.automation.provider/igriditemprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static GridItem => 8

    /**
     * The [IMultipleViewProvider](../windows.ui.xaml.automation.provider/imultipleviewprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static MultipleView => 9

    /**
     * The [IWindowProvider](../windows.ui.xaml.automation.provider/iwindowprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Window => 10

    /**
     * The [ISelectionItemProvider](../windows.ui.xaml.automation.provider/iselectionitemprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static SelectionItem => 11

    /**
     * The [IDockProvider](../windows.ui.xaml.automation.provider/idockprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Dock => 12

    /**
     * The [ITableProvider](../windows.ui.xaml.automation.provider/itableprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Table => 13

    /**
     * The [ITableItemProvider](../windows.ui.xaml.automation.provider/itableitemprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static TableItem => 14

    /**
     * The [IToggleProvider](../windows.ui.xaml.automation.provider/itoggleprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Toggle => 15

    /**
     * The [ITransformProvider](../windows.ui.xaml.automation.provider/itransformprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Transform => 16

    /**
     * The [ITextProvider](../windows.ui.xaml.automation.provider/itextprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static Text => 17

    /**
     * The [IItemContainerProvider](../windows.ui.xaml.automation.provider/iitemcontainerprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static ItemContainer => 18

    /**
     * The [IVirtualizedItemProvider](../windows.ui.xaml.automation.provider/ivirtualizeditemprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static VirtualizedItem => 19

    /**
     * The [ITextProvider2](../windows.ui.xaml.automation.provider/itextprovider2.md) interface.
     * @type {Integer (Int32)}
     */
    static Text2 => 20

    /**
     * The [ITextChildProvider](../windows.ui.xaml.automation.provider/itextchildprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static TextChild => 21

    /**
     * The [ITextRangeProvider](../windows.ui.xaml.automation.provider/itextrangeprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static TextRange => 22

    /**
     * The [IAnnotationProvider](../windows.ui.xaml.automation.provider/iannotationprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static Annotation => 23

    /**
     * The [IDragProvider](../windows.ui.xaml.automation.provider/idragprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static Drag => 24

    /**
     * The [IDropTargetProvider](../windows.ui.xaml.automation.provider/idroptargetprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static DropTarget => 25

    /**
     * The [IObjectModelProvider](../windows.ui.xaml.automation.provider/iobjectmodelprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static ObjectModel => 26

    /**
     * The [ISpreadsheetProvider ](../windows.ui.xaml.automation.provider/ispreadsheetprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static Spreadsheet => 27

    /**
     * The [ISpreadsheetItemProvider](../windows.ui.xaml.automation.provider/ispreadsheetitemprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static SpreadsheetItem => 28

    /**
     * The [IStylesProvider](../windows.ui.xaml.automation.provider/istylesprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static Styles => 29

    /**
     * The [ITransformProvider2](../windows.ui.xaml.automation.provider/itransformprovider2.md) interface.
     * @type {Integer (Int32)}
     */
    static Transform2 => 30

    /**
     * The [ISynchronizedInputProvider](../windows.ui.xaml.automation.provider/isynchronizedinputprovider.md) interface.
     * @type {Integer (Int32)}
     */
    static SynchronizedInput => 31

    /**
     * The [TextEdit](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itexteditprovider) control pattern interface.
     * @type {Integer (Int32)}
     */
    static TextEdit => 32

    /**
     * The [CustomNavigation](../windows.ui.xaml.automation.provider/icustomnavigationprovider.md) control pattern interface.
     * @type {Integer (Int32)}
     */
    static CustomNavigation => 33
}
