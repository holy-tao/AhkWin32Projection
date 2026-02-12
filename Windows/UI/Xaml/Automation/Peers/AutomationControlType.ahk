#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the control type that is exposed to the Microsoft UI Automation client. Used by [GetAutomationControlType](automationpeer_getautomationcontroltype_1156384152.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationcontroltype
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationControlType extends Win32Enum{

    /**
     * A button control.
     * @type {Integer (Int32)}
     */
    static Button => 0

    /**
     * A calendar control, such as a date picker.
     * @type {Integer (Int32)}
     */
    static Calendar => 1

    /**
     * A check box control.
     * @type {Integer (Int32)}
     */
    static CheckBox => 2

    /**
     * A combo box control.
     * @type {Integer (Int32)}
     */
    static ComboBox => 3

    /**
     * An edit control, such as a text box.
     * @type {Integer (Int32)}
     */
    static Edit => 4

    /**
     * A hyperlink control.
     * @type {Integer (Int32)}
     */
    static Hyperlink => 5

    /**
     * An image control.
     * @type {Integer (Int32)}
     */
    static Image => 6

    /**
     * A list item control, which is a child item of a list control.
     * @type {Integer (Int32)}
     */
    static ListItem => 7

    /**
     * A list control, such as a list box.
     * @type {Integer (Int32)}
     */
    static List => 8

    /**
     * A menu control, such as a top-level menu in an application window.
     * @type {Integer (Int32)}
     */
    static Menu => 9

    /**
     * A menu bar control, which generally contains a set of top-level menus.
     * @type {Integer (Int32)}
     */
    static MenuBar => 10

    /**
     * A menu item control.
     * @type {Integer (Int32)}
     */
    static MenuItem => 11

    /**
     * A progress bar control, which visually indicates the progress of a lengthy operation.
     * @type {Integer (Int32)}
     */
    static ProgressBar => 12

    /**
     * A radio button control, which is a selection mechanism allowing exactly one selected item in a group.
     * @type {Integer (Int32)}
     */
    static RadioButton => 13

    /**
     * A scroll bar control, such as a scroll bar in an application window.
     * @type {Integer (Int32)}
     */
    static ScrollBar => 14

    /**
     * A slider control.
     * @type {Integer (Int32)}
     */
    static Slider => 15

    /**
     * A spinner control.
     * @type {Integer (Int32)}
     */
    static Spinner => 16

    /**
     * A status bar control.
     * @type {Integer (Int32)}
     */
    static StatusBar => 17

    /**
     * A tab control.
     * @type {Integer (Int32)}
     */
    static Tab => 18

    /**
     * A tab item control, which represents a page of a tab control.
     * @type {Integer (Int32)}
     */
    static TabItem => 19

    /**
     * An edit control, such as a text box or rich text box.
     * @type {Integer (Int32)}
     */
    static Text => 20

    /**
     * A toolbar, such as the control that contains a set of command buttons in an application window.
     * @type {Integer (Int32)}
     */
    static ToolBar => 21

    /**
     * A tooltip control, an informational window that appears as a result of moving the pointer over a control or sometimes when tabbing to a control using the keyboard.
     * @type {Integer (Int32)}
     */
    static ToolTip => 22

    /**
     * A tree control.
     * @type {Integer (Int32)}
     */
    static Tree => 23

    /**
     * A node in a tree control.
     * @type {Integer (Int32)}
     */
    static TreeItem => 24

    /**
     * A control that is not one of the defined control types.
     * @type {Integer (Int32)}
     */
    static Custom => 25

    /**
     * A group control, which acts as a container for other controls.
     * @type {Integer (Int32)}
     */
    static Group => 26

    /**
     * The control in a scrollbar that can be dragged to a different position.
     * @type {Integer (Int32)}
     */
    static Thumb => 27

    /**
     * A data grid control.
     * @type {Integer (Int32)}
     */
    static DataGrid => 28

    /**
     * A data item control.
     * @type {Integer (Int32)}
     */
    static DataItem => 29

    /**
     * A document control.
     * @type {Integer (Int32)}
     */
    static Document => 30

    /**
     * A split button, which is a button that performs a default action and can also expand to a list of other possible actions.
     * @type {Integer (Int32)}
     */
    static SplitButton => 31

    /**
     * A window frame, which contains child objects.
     * @type {Integer (Int32)}
     */
    static Window => 32

    /**
     * A pane control.
     * @type {Integer (Int32)}
     */
    static Pane => 33

    /**
     * A header control, which is a container for the labels of rows and columns of information.
     * @type {Integer (Int32)}
     */
    static Header => 34

    /**
     * A header item, which is the label for a row or column of information.
     * @type {Integer (Int32)}
     */
    static HeaderItem => 35

    /**
     * A table.
     * @type {Integer (Int32)}
     */
    static Table => 36

    /**
     * The caption bar on a window.
     * @type {Integer (Int32)}
     */
    static TitleBar => 37

    /**
     * A separator, which creates a visual division in controls such as menus and toolbars.
     * @type {Integer (Int32)}
     */
    static Separator => 38

    /**
     * A semantic zoom control.
     * @type {Integer (Int32)}
     */
    static SemanticZoom => 39

    /**
     * **Introduced in .** An app bar control ([AppBar](../windows.ui.xaml.controls/appbar.md)).
     * @type {Integer (Int32)}
     */
    static AppBar => 40
}
