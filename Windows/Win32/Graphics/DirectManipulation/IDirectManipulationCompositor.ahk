#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a compositor object that associates manipulated content with a drawing surface, such as canvas (Windows app using JavaScript) or Canvas (Windows Store app using C++, C#, or Visual Basic).
 * @remarks
 * 
 * The content of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> viewport must be manually updated during an input event for custom implementations of <b>IDirectManipulationCompositor</b>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update">Update</a> to redraw the content within the viewport. 
 * 
 * You specify manual mode on a viewport by calling either of these functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setviewportoptions">SetViewportOptions</a>, with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_viewport_options">DIRECTMANIPULATION_VIEWPORT_OPTIONS_MANUALUPDATE</a> specified.</li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-setupdatemode">SetUpdateMode</a>, with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_input_mode">DIRECTMANIPULATION_INPUT_MODE_MANUAL</a> specified.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationcompositor
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationCompositor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationCompositor
     * @type {Guid}
     */
    static IID => Guid("{537a0825-0387-4efa-b62f-71eb1f085a7e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddContent", "RemoveContent", "SetUpdateManager", "Flush"]

    /**
     * Associates content (owned by the caller) with the compositor, assigns a composition device to the content, and specifies the position of the content in the composition tree relative to other composition visuals.
     * @param {IDirectManipulationContent} content The content to add to the composition tree.
     * 
     * <i>content</i> is placed  between <i>parentVisual</i> and <i>childVisual</i> in the composition tree.
     * @param {IUnknown} device The device used to compose the content. 
     * 
     * <div class="alert"><b>Note</b>  <i>device</i> is created by the application.</div>
     * <div> </div>
     * @param {IUnknown} parentVisual The parent visuals in the composition tree of the content being added.
     * 
     * <i>parentVisual</i> must also be a parent of <i>childVisual</i> in the composition tree.
     * @param {IUnknown} childVisual The child visuals in the composition tree of the content being added.
     * 
     * <i>parentVisual</i> must also be a parent of <i>childVisual</i> in the composition tree.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-addcontent
     */
    AddContent(content, device, parentVisual, childVisual) {
        result := ComCall(3, this, "ptr", content, "ptr", device, "ptr", parentVisual, "ptr", childVisual, "HRESULT")
        return result
    }

    /**
     * Removes content from the compositor.
     * @param {IDirectManipulationContent} content The content to remove from the composition tree.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-removecontent
     */
    RemoveContent(content) {
        result := ComCall(4, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Sets the update manager used to send compositor updates to Direct Manipulation.
     * @param {IDirectManipulationUpdateManager} updateManager The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">update manager</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-setupdatemanager
     */
    SetUpdateManager(updateManager) {
        result := ComCall(5, this, "ptr", updateManager, "HRESULT")
        return result
    }

    /**
     * Commits all pending updates in the compositor to the system for rendering.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-flush
     */
    Flush() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
