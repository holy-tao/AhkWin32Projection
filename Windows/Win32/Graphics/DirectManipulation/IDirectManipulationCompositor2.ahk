#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDirectManipulationPrimaryContent.ahk" { IDirectManipulationPrimaryContent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectManipulationCompositor.ahk" { IDirectManipulationCompositor }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a compositor object that associates manipulated content with drawing surfaces across multiple processes.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationcompositor2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationCompositor2 extends IDirectManipulationCompositor {
    /**
     * The interface identifier for IDirectManipulationCompositor2
     * @type {Guid}
     */
    static IID := Guid("{d38c7822-f1cb-43cb-b4b9-ac0c767a412e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationCompositor2 interfaces
    */
    struct Vtbl extends IDirectManipulationCompositor.Vtbl {
        AddContentWithCrossProcessChaining : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationCompositor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates content (owned by the component host) with the compositor, assigns a composition device to the content, and specifies the position of the content in the composition tree relative to other composition visuals.
     * @remarks
     * This method inserts a small visual tree (owned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> device) between the <i>parentVisual</i> and the <i>childVisual</i>. Transforms can then be applied to the inserted content.  
     * 
     * 
     * All content, regardless of type, must be added to the compositor. 
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
     * The cross-process pointer events (<a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerroutedaway">WM_POINTERROUTEDAWAY</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerroutedreleased">WM_POINTERROUTEDRELEASED</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/inputmsg/wm-pointerroutedto">WM_POINTERROUTEDTO</a>) should be handled appropriately.
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
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationcompositor2-addcontentwithcrossprocesschaining
     */
    AddContentWithCrossProcessChaining(content, device, parentVisual, childVisual) {
        result := ComCall(7, this, "ptr", content, "ptr", device, "ptr", parentVisual, "ptr", childVisual, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationCompositor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddContentWithCrossProcessChaining := CallbackCreate(GetMethod(implObj, "AddContentWithCrossProcessChaining"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddContentWithCrossProcessChaining)
    }
}
