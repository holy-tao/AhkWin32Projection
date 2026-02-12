#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables controls and containers to avoid performance bottlenecks on loading controls. It combines the load-time or initialization-time handshaking between the control and its container into a single call.
 * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nn-ocidl-iquickactivate
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IQuickActivate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQuickActivate
     * @type {Guid}
     */
    static IID => Guid("{cf51ed10-62fe-11cf-bf86-00a0c9034836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QuickActivate", "SetContentExtent", "GetContentExtent"]

    /**
     * Quick activates a control.
     * @remarks
     * If the control does not support <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-iquickactivate">IQuickActivate</a>, the container performs certain handshaking operations when it loads the control. The container calls certain interfaces on the control and the control, in turn, calls back to certain interfaces on the container's client site. First, the container creates the control object and calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to query for interfaces that it needs. Then, the container calls <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-ioleobject-setclientsite">IOleObject::SetClientSite</a> on the control, passing a pointer to its client site. Next, the control calls <b>QueryInterface</b> on this site, retrieving a pointer to additional necessary interfaces.
     * 
     * Using the <b>QuickActivate</b> method, the container passes a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontainer">QACONTAINER</a> structure. The structure contains pointers to interfaces which are needed by the control and the values of some ambient properties that the control may need. Upon return, the control passes a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontrol">QACONTROL</a> structure that contains pointers to its own interfaces that the container requires, and additional status information.
     * 
     * The <b>IPersist*::Load</b> and <b>IPersist*::InitNew</b> methods should be called after quick activation occurs. The control should establish its connections to the container's sinks during quick activation. However, these connections are not live until <b>IPersist*::Load</b> or <b>IPersist*::InitNew</b> has been called.
     * @param {Pointer<QACONTAINER>} pQaContainer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontainer">QACONTAINER</a> structure containing information about the container.
     * @param {Pointer<QACONTROL>} pQaControl A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/ns-ocidl-qacontrol">QACONTROL</a> structure filled in by the control to return information about the control to the container. The container calling this method must reserve memory for this structure.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iquickactivate-quickactivate
     */
    QuickActivate(pQaContainer, pQaControl) {
        result := ComCall(3, this, "ptr", pQaContainer, "ptr", pQaControl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the content extent of a control.
     * @param {Pointer<SIZE>} pSizel The size of the content extent.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iquickactivate-setcontentextent
     */
    SetContentExtent(pSizel) {
        result := ComCall(4, this, "ptr", pSizel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the content extent of a control.
     * @remarks
     * The <b>SIZEL</b> structure is defined in Wtypes.h as follows.
     * 
     * 
     * ``` syntax
     * typedef struct tagSIZEL
     *     {
     *     LONG cx;
     *     LONG cy;
     *     } 	SIZEL;
     * 
     * typedef struct tagSIZEL *PSIZEL;
     * 
     * typedef struct tagSIZEL *LPSIZEL;
     * ```
     * @returns {SIZE} A pointer to a structure that contains size of the content extent.
     * @see https://learn.microsoft.com/windows/win32/api//content/ocidl/nf-ocidl-iquickactivate-getcontentextent
     */
    GetContentExtent() {
        pSizel := SIZE()
        result := ComCall(5, this, "ptr", pSizel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSizel
    }
}
