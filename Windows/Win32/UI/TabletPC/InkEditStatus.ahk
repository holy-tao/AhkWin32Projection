#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the InkEdit control is idle, collecting ink, or recognizing ink.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-inkeditstatus
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkEditStatus extends Win32Enum{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is neither collecting nor recognizing ink.
     * @type {Integer (Int32)}
     */
    static IES_Idle => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is collecting ink.
     * @type {Integer (Int32)}
     */
    static IES_Collecting => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/tablet/inkedit-control-reference">InkEdit</a> control is recognizing ink.
     * @type {Integer (Int32)}
     */
    static IES_Recognizing => 2
}
