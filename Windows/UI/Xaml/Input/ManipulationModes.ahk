#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how a target UI element interprets manipulation events. This enumeration is flagwise, so you can set multiple modes for the [ManipulationMode](../windows.ui.xaml/uielement_manipulationmode.md) property.
 * @remarks
 * > [!NOTE]
 * > [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal) defines a manipulation as the scrolling or zooming of some part of the application UI.
 * 
 * This enumeration provides the value for the [UIElement.ManipulationMode](../windows.ui.xaml/uielement_manipulationmode.md) property. By setting this property you can enable app code handling for manipulation events such as [ManipulationStarted](../windows.ui.xaml/uielement_manipulationstarted.md). You must set the [ManipulationMode](../windows.ui.xaml/uielement_manipulationmode.md) to a value other than **System** or **None** to enable handling the events from that element. For more info on manipulations, see [Handle pointer input](/windows/uwp/design/input/handle-pointer-input).
 * 
 * Value enforcement for possible combinations is documented in the Remarks for the [UIElement.ManipulationMode](../windows.ui.xaml/uielement_manipulationmode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationmodes
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationModes extends Win32BitflagEnum{

    /**
     * Do not present graphic interaction with manipulation events.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Permit manipulation actions that translate the target on the X axis.
     * @type {Integer (UInt32)}
     */
    static TranslateX => 1

    /**
     * Permit manipulation actions that translate the target on the Y axis.
     * @type {Integer (UInt32)}
     */
    static TranslateY => 2

    /**
     * Permit manipulation actions that translate the target on the X axis but using a rails mode.
     * @type {Integer (UInt32)}
     */
    static TranslateRailsX => 4

    /**
     * Permit manipulation actions that translate the target on the Y axis but using a rails mode.
     * @type {Integer (UInt32)}
     */
    static TranslateRailsY => 8

    /**
     * Permit manipulation actions that rotate the target.
     * @type {Integer (UInt32)}
     */
    static Rotate => 16

    /**
     * Permit manipulation actions that scale the target.
     * @type {Integer (UInt32)}
     */
    static Scale => 32

    /**
     * Apply inertia to translate actions.
     * @type {Integer (UInt32)}
     */
    static TranslateInertia => 64

    /**
     * Apply inertia to rotate actions.
     * @type {Integer (UInt32)}
     */
    static RotateInertia => 128

    /**
     * Apply inertia to scale actions.
     * @type {Integer (UInt32)}
     */
    static ScaleInertia => 256

    /**
     * Enable all manipulation interaction modes except those supported through [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal)
     * @type {Integer (UInt32)}
     */
    static All => 65535

    /**
     * Enable system-driven touch interactions supported through [Direct Manipulation](/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal).
     * @type {Integer (UInt32)}
     */
    static System => 65536
}
