#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the set of platform commands (with pre-defined properties such as icon, keyboard accelerator, and description) that can be used with a [StandardUICommand](standarduicommand.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.standarduicommandkind
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class StandardUICommandKind extends Win32Enum{

    /**
     * No command.  Default.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies the cut command.
     * @type {Integer (Int32)}
     */
    static Cut => 1

    /**
     * Specifies the copy command.
     * @type {Integer (Int32)}
     */
    static Copy => 2

    /**
     * Specifies the paste command.
     * @type {Integer (Int32)}
     */
    static Paste => 3

    /**
     * Specifies the select all command.
     * @type {Integer (Int32)}
     */
    static SelectAll => 4

    /**
     * Specifies the delete command.
     * @type {Integer (Int32)}
     */
    static Delete => 5

    /**
     * Specifies the share command.
     * @type {Integer (Int32)}
     */
    static Share => 6

    /**
     * Specifies the save command.
     * @type {Integer (Int32)}
     */
    static Save => 7

    /**
     * Specifies the open command.
     * @type {Integer (Int32)}
     */
    static Open => 8

    /**
     * Specifies the close command.
     * @type {Integer (Int32)}
     */
    static Close => 9

    /**
     * Specifies the pause command.
     * @type {Integer (Int32)}
     */
    static Pause => 10

    /**
     * Specifies the play command.
     * @type {Integer (Int32)}
     */
    static Play => 11

    /**
     * Specifies the stop command.
     * @type {Integer (Int32)}
     */
    static Stop => 12

    /**
     * Specifies the forward command.
     * @type {Integer (Int32)}
     */
    static Forward => 13

    /**
     * Specifies the backward command.
     * @type {Integer (Int32)}
     */
    static Backward => 14

    /**
     * Specifies the undo command.
     * @type {Integer (Int32)}
     */
    static Undo => 15

    /**
     * Specifies the redo command.
     * @type {Integer (Int32)}
     */
    static Redo => 16
}
