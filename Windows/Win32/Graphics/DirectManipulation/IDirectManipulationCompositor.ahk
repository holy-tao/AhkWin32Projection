#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a compositor object that associates manipulated content with a drawing surface, such as canvas (Windows app using JavaScript) or Canvas (Windows Store app using C++, C#, or Visual Basic).
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor
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
     * @remarks
     * This method inserts a small visual tree (owned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> device) between the <i>parentVisual</i> and the <i>childVisual</i>. Transforms can then be applied to the inserted content.  
     * 
     * 
     * All content, regardless of type, must be added to the compositor. This can be primary content, obtained from the viewport by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getprimarycontent">GetPrimaryContent</a>, or secondary content, such as a panning indicator, created by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-createcontent">CreateContent</a>.
     * 
     * 
     * If the application uses a system-provided <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>:
     * 
     * <ul>
     * <li><i>device</i> must be an  <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> object, and parent and child visuals must be <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> objects.</li>
     * <li><i>device</i>, <i>parentVisual</i>, and <i>childVisual</i> cannot be NULL. </li>
     * <li><i>device</i>, <i>parentVisual</i>, and <i>childVisual</i> objects are created and owned by the application.
     * </li>
     * <li>When content is added to the composition tree using this method, the new composition visuals are inserted between <i>parentVisual</i> and <i>childVisual</i>. The new visuals should not be destroyed until they are disassociated from the compositor with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-removecontent">RemoveContent</a>.</li>
     * </ul>
     * If the application uses a custom implementation of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor">IDirectManipulationCompositor</a>:
     * 
     * <ul>
     * <li><i>device</i>, <i>parentVisual</i>, and <i>childVisual</i> must be a valid type for the compositor. They do not have to be <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> objects.</li>
     * <li><i>device</i>, <i>parentVisual</i>, and <i>childVisual</i> can be NULL, depending on the compositor. </li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-addcontent
     */
    AddContent(content, device, parentVisual, childVisual) {
        result := ComCall(3, this, "ptr", content, "ptr", device, "ptr", parentVisual, "ptr", childVisual, "HRESULT")
        return result
    }

    /**
     * Removes content from the compositor.
     * @remarks
     * This method removes content added with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-addcontent">AddContent</a> and restores the original relationships between parent visuals and child visuals in the composition tree. In other words, <b>RemoveContent</b> undoes <b>AddContent</b>.
     * @param {IDirectManipulationContent} content The content to remove from the composition tree.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-removecontent
     */
    RemoveContent(content) {
        result := ComCall(4, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Sets the update manager used to send compositor updates to Direct Manipulation.
     * @remarks
     * Retrieve <i>updateManager</i>  by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager-getupdatemanager">GetUpdateManager</a>.
     * 
     * Call this method during <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> initialization to connect the compositor to the <i>update manager</i>.
     * @param {IDirectManipulationUpdateManager} updateManager The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationupdatemanager">update manager</a>.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-setupdatemanager
     */
    SetUpdateManager(updateManager) {
        result := ComCall(5, this, "ptr", updateManager, "HRESULT")
        return result
    }

    /**
     * Commits all pending updates in the compositor to the system for rendering.
     * @remarks
     * This method enables <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> to flush any pending changes to its visuals before a system event, such as a process suspension.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor-flush
     */
    Flush() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
