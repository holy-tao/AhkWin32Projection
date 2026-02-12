#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the inking behavior of one or more contact points. Used with [SetPredefinedConfiguration](inkpresenter_setpredefinedconfiguration_1107454914.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenterpredefinedconfiguration
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPresenterPredefinedConfiguration extends Win32Enum{

    /**
     * A single, primary contact point is used to draw an [InkStroke](inkstroke.md).
     * @type {Integer (Int32)}
     */
    static SimpleSinglePointer => 0

    /**
     * Each contact point is used to draw an [InkStroke](inkstroke.md). 
     * 
     * > [!NOTE]
     * > Multi-pointer inking requires ink input to be processed in custom drying mode. [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) must be called before setting [SetPredefinedConfiguration](inkpresenter_setpredefinedconfiguration_1107454914.md) to SimpleMultiplePointer.
     * @type {Integer (Int32)}
     */
    static SimpleMultiplePointer => 1
}
