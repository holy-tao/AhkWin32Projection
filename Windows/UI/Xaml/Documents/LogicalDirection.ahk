#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a logical direction in which to perform certain text operations, such as inserting, retrieving, or navigating through text relative to a specified position (a [TextPointer](textpointer.md)).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.logicaldirection
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class LogicalDirection extends Win32Enum{

    /**
     * Backward, or from right to left.
     * @type {Integer (Int32)}
     */
    static Backward => 0

    /**
     * Forward, or from left to right.
     * @type {Integer (Int32)}
     */
    static Forward => 1
}
