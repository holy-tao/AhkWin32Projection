#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D2D1_CHANGE_TYPE.ahk" { D2D1_CHANGE_TYPE }
#Import ".\ID2D1TransformGraph.ahk" { ID2D1TransformGraph }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID2D1EffectContext.ahk" { ID2D1EffectContext }

/**
 * Allows a custom effect's interface and behavior to be specified by the effect author.
 * @remarks
 * This interface is created by the effect author from a static factory registered through 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring">ID2D1Factory::RegisterEffect</a>  method.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1effectimpl
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1EffectImpl extends IUnknown {
    /**
     * The interface identifier for ID2D1EffectImpl
     * @type {Guid}
     */
    static IID := Guid("{a248fd3f-3e6c-4e63-9f03-7f68ecc91db9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1EffectImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize       : IntPtr
        PrepareForRender : IntPtr
        SetGraph         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1EffectImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The effect can use this method to do one time initialization tasks.
     * @remarks
     * This moves resource creation cost to the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect">CreateEffect</a> call, rather than during rendering.
     * 
     * If the implementation fails this call, the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect">ID2D1DeviceContext::CreateEffect</a> call also fails.
     * 
     * The following example shows an effect implementing an initialize method.
     * @param {ID2D1EffectContext} effectContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1effectcontext">ID2D1EffectContext</a>*</b>
     * 
     * An internal context interface that creates and returns effect author–centric types.
     * @param {ID2D1TransformGraph} transformGraph Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformgraph">ID2D1TransformGraph</a>*</b>
     * 
     * The effect can
     *     populate the transform graph with a topology and can update it later.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-initialize
     */
    Initialize(effectContext, transformGraph) {
        result := ComCall(3, this, "ptr", effectContext, "ptr", transformGraph, "HRESULT")
        return result
    }

    /**
     * Prepares an effect for the rendering process.
     * @remarks
     * This method is called by the renderer when the effect is within an effect graph that is drawn.
     * 
     *  The method will be called:
     * 
     * <ul>
     * <li>If the effect has been initialized but has not previously been drawn.</li>
     * <li>If an effect property has been set since the last draw call.</li>
     * <li>If the context state has changed since the effect was last drawn.</li>
     * </ul>
     * The method will not otherwise be called. The transforms created by the effect will be called to handle their input and output rectangles for every draw call.
     * 
     * Most effects defer creating any resources or specifying a topology until this call is made. They store their properties and map them to a concrete set of rendering techniques when first drawn.
     * @param {D2D1_CHANGE_TYPE} _changeType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_change_type">D2D1_CHANGE_TYPE</a></b>
     * 
     * Indicates the type of change the effect should expect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-prepareforrender
     */
    PrepareForRender(_changeType) {
        result := ComCall(4, this, D2D1_CHANGE_TYPE, _changeType, "HRESULT")
        return result
    }

    /**
     * The renderer calls this method to provide the effect implementation with a way to specify its transform graph and transform graph changes.
     * @param {ID2D1TransformGraph} transformGraph Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1transformgraph">ID2D1TransformGraph</a>*</b>
     * 
     * The graph to which the effect describes its transform topology through the SetDescription call.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * An error that prevents the effect from being initialized if called as part of the CreateEffect call. If the effect fails a subsequent SetGraph call:
     * 
     * <ul>
     * <li>The error will be returned from the property method that caused the number of inputs to the effect to change.
     * </li>
     * <li>The effect object will be placed into an error state, if subsequently used to render, the context will be placed into a temporary error state, that particular effect will fail to render and the failure will be returned on the next EndDraw or Flush call.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-setgraph
     */
    SetGraph(transformGraph) {
        result := ComCall(5, this, "ptr", transformGraph, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1EffectImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.PrepareForRender := CallbackCreate(GetMethod(implObj, "PrepareForRender"), flags, 2)
        this.vtbl.SetGraph := CallbackCreate(GetMethod(implObj, "SetGraph"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.PrepareForRender)
        CallbackFree(this.vtbl.SetGraph)
    }
}
