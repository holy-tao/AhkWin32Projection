#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies properties of the Interaction Context object.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ne-interactioncontext-interaction_context_property
 * @namespace Windows.Win32.UI.InteractionContext
 */
class INTERACTION_CONTEXT_PROPERTY extends Win32Enum {

    /**
     * Measurement units used by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/input_intcontext/interaction-context-portal">Interaction Context</a> object: himetric (0.01mm) or screen pixels.
     * Native name: INTERACTION_CONTEXT_PROPERTY_MEASUREMENT_UNITS
     * @type {Integer (Int32)}
     */
    static MEASUREMENT_UNITS => 1

    /**
     * UI feedback is provided.
     * Native name: INTERACTION_CONTEXT_PROPERTY_INTERACTION_UI_FEEDBACK
     * @type {Integer (Int32)}
     */
    static INTERACTION_UI_FEEDBACK => 2

    /**
     * Pointer filtering is active.
     * Native name: INTERACTION_CONTEXT_PROPERTY_FILTER_POINTERS
     * @type {Integer (Int32)}
     */
    static FILTER_POINTERS => 3

    /**
     * Maximum number of interactions exceeded.
     * Native name: INTERACTION_CONTEXT_PROPERTY_MAX
     * @type {Integer (Int32)}
     */
    static MAX => -1
}
