#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the visual feedback behaviors available to CreateSyntheticPointerDevice.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_feedback_mode
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class POINTER_FEEDBACK_MODE extends Win32Enum {

    /**
     * Visual feedback might be suppressed by the user's pen (Settings -&gt; Devices -&gt; Pen &amp; Windows Ink) and touch (Settings -&gt; Ease of Access -&gt; Cursor &amp; pointer size) settings.
     * Native name: POINTER_FEEDBACK_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1

    /**
     * Visual feedback overrides the user's pen and touch settings.
     * Native name: POINTER_FEEDBACK_INDIRECT
     * @type {Integer (Int32)}
     */
    static INDIRECT => 2

    /**
     * Visual feedback is disabled.
     * Native name: POINTER_FEEDBACK_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 3
}
