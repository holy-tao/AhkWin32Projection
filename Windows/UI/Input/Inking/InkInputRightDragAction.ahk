#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the [InkPresenter](inkpresenter.md) object handles secondary input from a pen barrel button, pen eraser tip, right mouse button, or similar.
  * 
  * By default, this secondary input is processed as primary input and rendered as an [InkStroke](inkstroke.md) (see remarks).
 * @remarks
 * To manage how secondary input is processed by your app, see [InkInputProcessingConfiguration](inkinputprocessingconfiguration.md).
 * 
 * To pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing, set [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) to **LeaveUnprocessed**.
 * 
 * If [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md) is set to [Inking](inkinputprocessingmode.md) or [Erasing](inkinputprocessingmode.md), the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) must be set to **LeaveUnprocessed** to pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * 
 * If [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md) is set to [None](inkinputprocessingmode.md), the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) is ignored and input is always passed as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputrightdragaction
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkInputRightDragAction extends Win32Enum{

    /**
     * All input is [UnprocessedInput](inkpresenter_unprocessedinput.md). This passes all input through to the app for custom processing.
     * @type {Integer (Int32)}
     */
    static LeaveUnprocessed => 0

    /**
     * All input is unmodified by a secondary affordance and is processed as standard ink input by the [InkPresenter](inkpresenter.md).
     * @type {Integer (Int32)}
     */
    static AllowProcessing => 1
}
