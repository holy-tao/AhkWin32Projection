#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible states of Direct Manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_status
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_STATUS extends Win32Enum{

    /**
     * The viewport is being initialized and is not yet able to process input.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_BUILDING => 0

    /**
     * The viewport was successfully enabled.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_ENABLED => 1

    /**
     * The viewport is disabled and cannot process input or callbacks. The viewport can be enabled by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable">Enable</a>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DISABLED => 2

    /**
     * The viewport is currently processing input and updating content.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_RUNNING => 3

    /**
     * The viewport is moving content due to inertia.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_INERTIA => 4

    /**
     * The viewport has completed the previous interaction.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_READY => 5

    /**
     * The transient state of the viewport when input has been promoted to an ancestor in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setcontact">SetContact</a> chain.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_SUSPENDED => 6
}
