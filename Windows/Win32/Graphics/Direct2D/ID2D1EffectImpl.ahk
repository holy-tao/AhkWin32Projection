#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a custom effect's interface and behavior to be specified by the effect author.
 * @remarks
 * 
 * This interface is created by the effect author from a static factory registered through 
 *       the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1factory1-registereffectfromstring">ID2D1Factory::RegisterEffect</a>  method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1effectimpl
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1EffectImpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1EffectImpl
     * @type {Guid}
     */
    static IID => Guid("{a248fd3f-3e6c-4e63-9f03-7f68ecc91db9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "PrepareForRender", "SetGraph"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {ID2D1EffectContext} effectContext 
     * @param {ID2D1TransformGraph} transformGraph 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(effectContext, transformGraph) {
        result := ComCall(3, this, "ptr", effectContext, "ptr", transformGraph, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} changeType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-prepareforrender
     */
    PrepareForRender(changeType) {
        result := ComCall(4, this, "int", changeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID2D1TransformGraph} transformGraph 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectimpl-setgraph
     */
    SetGraph(transformGraph) {
        result := ComCall(5, this, "ptr", transformGraph, "HRESULT")
        return result
    }
}
