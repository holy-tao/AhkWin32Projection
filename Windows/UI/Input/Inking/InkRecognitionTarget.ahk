#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which strokes you want to include in handwriting recognition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkrecognitiontarget
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkRecognitionTarget extends Win32Enum{

    /**
     * All strokes in the stroke collection are passed to the recognizer.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Selected ([Selected](inkstroke_selected.md)) strokes are passed to the recognizer.
     * @type {Integer (Int32)}
     */
    static Selected => 1

    /**
     * All strokes added after the last recognition pass ([Recognized](inkstroke_recognized.md) is false) are passed to the recognizer.This is useful in incremental recognition scenarios, such as direct tracking of ink input (no indirect controls are used to start recognition).
     * @type {Integer (Int32)}
     */
    static Recent => 2
}
