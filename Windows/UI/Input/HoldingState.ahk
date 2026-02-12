#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the state of the [Holding](gesturerecognizer_holding.md) event.
 * @remarks
 * To support [Holding](gesturerecognizer_holding.md) with touch and pen/stylus input, specify [Hold](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
 * 
 * To support [Holding](gesturerecognizer_holding.md) with mouse input, specify [HoldWithMouse](gesturesettings.md) in the [GestureSettings](gesturerecognizer_gesturesettings.md) property.
 * 
 * The [Holding](gesturerecognizer_holding.md) event is fired twice: Once when holding starts (started) and again when holding ends (completed or canceled).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.holdingstate
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class HoldingState extends Win32Enum{

    /**
     * A single contact has been detected and a time threshold is crossed without the contact being lifted, another contact detected, or another gesture started.
     * 
     * > [!NOTE]
     * > The press and hold time threshold can be set in the **Hardware and Sound** control panel.
     * @type {Integer (Int32)}
     */
    static Started => 0

    /**
     * The single contact is lifted.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * An additional contact is detected, a subsequent gesture (such as a slide) is detected, or the [CompleteGesture](gesturerecognizer_completegesture_805659565.md) method is called.
     * @type {Integer (Int32)}
     */
    static Canceled => 2
}
