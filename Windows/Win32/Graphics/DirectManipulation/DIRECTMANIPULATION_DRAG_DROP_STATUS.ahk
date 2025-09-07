#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the drag-and-drop interaction states for the viewport.
 * @remarks
 * For each interaction, the status always starts at <b>DIRECTMANIPULATION_DRAG_DROP_READY</b> and ends at either <b>DIRECTMANIPULATION_DRAG_DROP_CANCELLED</b> or <b>DIRECTMANIPULATION_DRAG_DROP_COMMITTED</b>. There are no explicit callbacks for the transition from CANCELLED/COMMITTED to READY.
  * 
  * 
  * The meaning of the CANCELLED and COMMITTED values depend on the previous status.
  * 
  * <ul>
  * <li>For <b>DIRECTMANIPULATION_DRAG_DROP_PRESELECT</b>, they mean the same thing: the content goes back to the original location and no other actions should be taken.</li>
  * <li>FOR <b>DIRECTMANIPULATION_DRAG_DROP_SELECTING</b>, COMMITTED means apply the selection change; CANCELLED means avoid the selection change.</li>
  * <li>For <b>DIRECTMANIPULATION_DRAG_DROP_DRAGGING</b>, COMMITTED means perform the drop action; CANCELLED means cancel the drop action.</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_status
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class DIRECTMANIPULATION_DRAG_DROP_STATUS{

    /**
     * The viewport is at rest and ready for input.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_READY => 0

    /**
     * The viewport is updating its content and the content is not selected.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_PRESELECT => 1

    /**
     * The viewport is updating its content and the content is selected.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_SELECTING => 2

    /**
     * The viewport is updating its content and the content is being dragged.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_DRAGGING => 3

    /**
     * The viewport has concluded the interaction and requests a revert.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_CANCELLED => 4

    /**
     * The viewport has concluded the interaction and requests a commit.
     * @type {Integer (Int32)}
     */
    static DIRECTMANIPULATION_DRAG_DROP_COMMITTED => 5
}
