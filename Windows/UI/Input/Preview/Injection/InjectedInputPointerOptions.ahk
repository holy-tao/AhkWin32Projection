#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various options, or modifiers, used to simulate pointer input through [InjectedInputMouseInfo](injectedinputmouseinfo.md), [InjectedInputPenInfo](injectedinputpeninfo.md), and [InjectedInputTouchInfo](injectedinputtouchinfo.md).
 * @remarks
 * > [!Important]
 * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
 * 
 * Using input injection requires the following be added to the Package.appxmanifest:
 * 
 * - To `<Package>`
 *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *     - `IgnorableNamespaces="rescap"`
 * - To `<Capabilities>`
 *     - `<rescap:Capability Name="inputInjectionBrokered" />`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpointeroptions
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPointerOptions extends Win32BitflagEnum{

    /**
     * No pointer modifier. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Indicates the arrival of a new pointer.
     * @type {Integer (UInt32)}
     */
    static New => 1

    /**
     * Indicates that the pointer continues to exist. When this flag is not set, it indicates the pointer has left detection range.
     * @type {Integer (UInt32)}
     */
    static InRange => 2

    /**
     * Indicates that the pointer is in contact with the digitizer surface or area. When this flag is not set, it indicates a hovering pointer.
     * @type {Integer (UInt32)}
     */
    static InContact => 4

    /**
     * Indicates a primary action.
     * 
     * A touch pointer has this flag set when it is in contact with the digitizer surface.
     * 
     * A pen pointer has this flag set when it is in contact with the digitizer surface with no buttons pressed.
     * 
     * A mouse pointer has this flag set when the left mouse button is down.
     * @type {Integer (UInt32)}
     */
    static FirstButton => 16

    /**
     * Indicates a secondary action.
     * 
     * A touch pointer does not use this flag.
     * 
     * A pen pointer has this flag set when it is in contact with the digitizer surface with the pen barrel button pressed.
     * 
     * A mouse pointer has this flag set when the right mouse button is down.
     * @type {Integer (UInt32)}
     */
    static SecondButton => 32

    /**
     * Indicates that the pointer can perform actions beyond those available to non-primary pointers. For example, when a primary pointer makes contact with a window’s surface, it might provide the window an opportunity to activate.
     * 
     * The primary pointer is identified from all current user interactions on the system (mouse, touch, pen, and so on). As such, the primary pointer might not be associated with your app. The first contact in a multi-touch interaction is set as the primary pointer. Once a primary pointer is identified, all contacts must be lifted before a new contact can be identified as a primary pointer. For apps that don't process pointer input, only the primary pointer's events are promoted to mouse events.
     * @type {Integer (UInt32)}
     */
    static Primary => 8192

    /**
     * Indicates a suggestion from the source device about whether the pointer represents an intended or accidental interaction, which is especially relevant for touch pointers where an accidental interaction (such as with the palm of the hand) can trigger input. The presence of this flag indicates that the source device has high confidence that this input is part of an intended interaction.
     * @type {Integer (UInt32)}
     */
    static Confidence => 16384

    /**
     * Indicates that the pointer is departing in an abnormal manner, such as when the system receives invalid input for the pointer or when a device with active pointers departs abruptly. If the application receiving the input is in a position to do so, it should treat the interaction as not completed and reverse any effects of the pointer.
     * @type {Integer (UInt32)}
     */
    static Canceled => 32768

    /**
     * Indicates that this pointer made contact with the digitizer surface. A touch pointer has this flag set when it is in contact with the digitizer surface.
     * 
     * A pen pointer has this flag set when it is in contact with the digitizer surface.
     * 
     * A mouse pointer has this flag set when a mouse button is pressed.
     * @type {Integer (UInt32)}
     */
    static PointerDown => 65536

    /**
     * Indicates a simple update that does not include pointer state changes.
     * @type {Integer (UInt32)}
     */
    static Update => 131072

    /**
     * Indicates that this pointer ended contact with the digitizer surface. A touch pointer has this flag set when it ends contact with the digitizer surface.
     * 
     * A pen pointer has this flag set when it ends contact with the digitizer surface.
     * 
     * A mouse pointer has this flag set when a mouse button is released.
     * @type {Integer (UInt32)}
     */
    static PointerUp => 262144

    /**
     * Indicates that this pointer was captured by (associated with) another element and the original element has lost capture.
     * @type {Integer (UInt32)}
     */
    static CaptureChanged => 2097152
}
