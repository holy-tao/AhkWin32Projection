#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the format of a the text in a [TextActionEntity](textactionentity.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actionentitytextformat
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionEntityTextFormat extends Win32Enum{

    /**
     * Plain text.
     * @type {Integer (Int32)}
     */
    static Plain => 0

    /**
     * Mardown.
     * @type {Integer (Int32)}
     */
    static Markdown => 1
}
