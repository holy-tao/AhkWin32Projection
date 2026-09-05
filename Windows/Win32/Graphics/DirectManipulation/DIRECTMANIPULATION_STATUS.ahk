#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_status
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_STATUS extends Win32Enum {

    /**
     * The viewport is being initialized and is not yet able to process input.
     * Native name: DIRECTMANIPULATION_BUILDING
     * @type {Integer (Int32)}
     */
    static BUILDING => 0

    /**
     * The viewport was successfully enabled.
     * Native name: DIRECTMANIPULATION_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 1

    /**
     * The viewport is disabled and cannot process input or callbacks. The viewport can be enabled by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable">Enable</a>.
     * Native name: DIRECTMANIPULATION_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 2

    /**
     * The viewport is currently processing input and updating content.
     * Native name: DIRECTMANIPULATION_RUNNING
     * @type {Integer (Int32)}
     */
    static RUNNING => 3

    /**
     * The viewport is moving content due to inertia.
     * Native name: DIRECTMANIPULATION_INERTIA
     * @type {Integer (Int32)}
     */
    static INERTIA => 4

    /**
     * The viewport has completed the previous interaction.
     * Native name: DIRECTMANIPULATION_READY
     * @type {Integer (Int32)}
     */
    static READY => 5

    /**
     * The transient state of the viewport when input has been promoted to an ancestor in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> chain.
     * Native name: DIRECTMANIPULATION_SUSPENDED
     * @type {Integer (Int32)}
     */
    static SUSPENDED => 6
}
