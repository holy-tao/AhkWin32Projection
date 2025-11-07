#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the input behavior options for the viewport.
 * @remarks
 * 
 * <b>DIRECTMANIPULATION_VIEWPORT_OPTIONS</b> is used in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions">SetViewportOptions</a> method. These flags can be combined to set the input behavior for a viewport.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/ne-directmanipulation-directmanipulation_viewport_options
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_VIEWPORT_OPTIONS{

    /**
     * No special behaviors. This is the default value used to set or revert to default behavior.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_DEFAULT => 0

    /**
     * At the end of an interaction, the viewport transitions to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_status">DIRECTMANIPULATION_READY</a> and then immediately to <b>DIRECTMANIPULATION_DISABLED</b>. The viewport must be explicitly enabled through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-enable">Enable</a> method before the next interaction can be processed.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_AUTODISABLE => 1

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update">Update</a> must be called to redraw the content within the viewport. The content is not updated automatically during an input event.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_MANUALUPDATE => 2

    /**
     * All input from a contact associated with the viewport is passed to the UI thread for processing.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_INPUT => 4

    /**
     * If set, all <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerdown">WM_POINTERDOWN</a> messages are passed to the application for hit testing. Otherwise, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> will process the messages for hit testing against the existing list of running viewports, and the application will not see the input.
 * 
 * Applies only when viewport state is <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_status">DIRECTMANIPULATION_RUNNING</a> or <b>DIRECTMANIPULATION_INERTIA</b>.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_EXPLICITHITTEST => 8

    /**
     * Specifies that pixel snapping during a manipulation is disabled.
 * 
 * Anti-aliasing can create irregular edge rendering. Artifacts, commonly seen as blurry, or semi-transparent, edges can occur when the location of an edge falls in the middle of a device pixel rather than between device pixels.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_VIEWPORT_OPTIONS_DISABLEPIXELSNAPPING => 16
}
