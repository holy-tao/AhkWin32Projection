#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectManipulationCompositor.ahk

/**
 * Represents a compositor object that associates manipulated content with drawing surfaces across multiple processes.
 * @remarks
 * 
 * The content of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> viewport must be manually updated during an input event for custom implementations of <b>IDirectManipulationCompositor2</b>. Call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationupdatemanager-update">Update</a> to redraw the content within the viewport. 
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
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationcompositor2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationCompositor2 extends IDirectManipulationCompositor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationCompositor2
     * @type {Guid}
     */
    static IID => Guid("{d38c7822-f1cb-43cb-b4b9-ac0c767a412e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddContentWithCrossProcessChaining"]

    /**
     * Associates content (owned by the component host) with the compositor, assigns a composition device to the content, and specifies the position of the content in the composition tree relative to other composition visuals.
     * @param {IDirectManipulationPrimaryContent} content The content to add to the composition tree.
     * 
     * <i>content</i> is placed  between <i>parentVisual</i> and <i>childVisual</i> in the composition tree. 
     * 
     * Only primary content, created at the same time as the viewport, is valid.
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
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationcompositor2-addcontentwithcrossprocesschaining
     */
    AddContentWithCrossProcessChaining(content, device, parentVisual, childVisual) {
        result := ComCall(7, this, "ptr", content, "ptr", device, "ptr", parentVisual, "ptr", childVisual, "HRESULT")
        return result
    }
}
