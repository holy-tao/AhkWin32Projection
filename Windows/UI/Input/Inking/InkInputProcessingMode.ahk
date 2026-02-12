#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the [InkPresenter](inkpresenter.md) object interprets input from its associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
  * 
  * By default, input is handled as standard ink or erase strokes, or it can be passed as [UnprocessedInput](inkpresenter_unprocessedinput.md) to your app for custom processing.
 * @remarks
 * If [Mode](inkinputprocessingconfiguration_mode.md) is set to **None**, the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) is ignored and input is always passed as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * 
 * If [Mode](inkinputprocessingconfiguration_mode.md) is set to **Inking** or **Erasing**, the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) must be set to [LeaveUnprocessed](inkinputrightdragaction.md) to pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * 
 * To manage how secondary input is processed by your app, see [InkInputProcessingConfiguration](inkinputprocessingconfiguration.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputprocessingmode
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkInputProcessingMode extends Win32Enum{

    /**
     * All input events are passed to the app and are not processed by the [InkPresenter](inkpresenter.md).
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Input is treated as ink.
     * @type {Integer (Int32)}
     */
    static Inking => 1

    /**
     * Input is treated as erase.
     * @type {Integer (Int32)}
     */
    static Erasing => 2
}
