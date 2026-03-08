#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IComponent.ahk

/**
 * The IComponent2 interface, implemented by snap-ins, is introduced in MMC 2.0 and supersedes the IComponent interface.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-icomponent2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IComponent2 extends IComponent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponent2
     * @type {Guid}
     */
    static IID => Guid("{79a2d615-4a10-4ed4-8c65-8633f9335095}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryDispatch", "GetResultViewType2", "RestoreResultView"]

    /**
     * The QueryDispatch method returns the snap-in IDispatch interface for a specified item.
     * @param {Pointer} cookie A value that specifies the context item (or items) for which the IDispatch interface is requested. The cookie value is previously provided by the snap-in, and MMC uses it in this method call.
     * @param {Integer} type A value that specifies the data object as one of the following constant values, which, are members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ne-mmc-data_object_types">DATA_OBJECT_TYPES</a> enumeration.
     * @returns {IDispatch} A dispatch interface pointer. The snap-in sets *ppDispatch to the IDispatch interface that corresponds  to the cookie value.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-querydispatch
     */
    QueryDispatch(cookie, type) {
        result := ComCall(10, this, "ptr", cookie, "int", type, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * The GetResultViewType2 method retrieves the result view type. This method supersedes the IComponent::GetResultViewType method.
     * @remarks
     * During result view creation, MMC calls the snap-in's <b>IComponent2::GetResultViewType2</b> method. When the user revisits the result view named by the <b>pstrPersistableViewDescription</b> member of *<i>pResultViewType</i>, MMC will call the snap-in's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent2-restoreresultview">IComponent2::RestoreResultView</a> method, at which time the snap-in can provide snap-in-specific details (if any) for the restored result view. The user revisits the result view by means of the MMC <b>Back/Forward</b> buttons or the loading of a saved console file. For more information about the use of the <b>IComponent2::GetResultViewType2</b> and <b>IComponent2::RestoreResultView</b> methods, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/restoring-result-views">Restoring Result Views</a>.
     * 
     * If the snap-in is implementing an OCX (ActiveX control) view, then the snap-in creates the OCX and provides MMC with the OCX 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer in the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure (specifically, the structure's <b>pUnkControl</b> member). The snap-in has control over the OCX creation, so the snap-in can address licensing or security issues as required. During the call to 
     * <b>GetResultViewType2</b>, the snap-in can also initialize the OCX (the snap-in will not receive a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/mmcn-initocx">MMCN_INITOCX</a> notification).
     * @param {Pointer} cookie A value that specifies the snapin-provided unique identifier for the scope item. For more details about cookies in MMC, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cookies">Cookies</a>.
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure for the result view. If your snap-in implements 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent2">IComponent2</a>, the <b>pstrPersistableViewDescription</b> member of the <b>RESULT_VIEW_TYPE_INFO</b> structure must contain a valid view description string; otherwise, MMC will not initialize your snap-in. The <b>pstrPersistableViewDescription</b> member must be allocated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The snap-in must not free <b>pstrPersistableViewDescription</b>, as it will be freed by MMC.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-getresultviewtype2
     */
    GetResultViewType2(cookie, pResultViewType) {
        result := ComCall(11, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }

    /**
     * The RestoreResultView method restores the result view. This method enables a snap-in to restore snap-in-specific details of a result view. For more information, see Restoring Result Views.
     * @remarks
     * The <b>pstrPersistableViewDescription</b> member of *<i>pResultViewType</i> specifies the name assigned to the result view.  To restore the result view identified by the <b>pstrPersistableViewDescription</b> member, the snap-in fills in the remaining members of *<i>pResultViewType</i>. The name of the result view is originally assigned during the snap-in's implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent2-getresultviewtype2">IComponent2::GetResultViewType2</a>. MMC calls <b>IComponent2::RestoreResultView</b> so that the snap-in can restore internal view settings when the result view is revisited by the user.
     * 
     * When the user customizes the view, some of the settings (such as view options or view mode) are known by MMC, and some (such as <b>Oldest First</b> in the Event Viewer snap-in) are internal to the snap-in. Prior to MMC 2.0, there was no mechanism for MMC to communicate to the snap-in to restore the internal view settings. The <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-icomponent2-getresultviewtype2">IComponent2::GetResultViewType2</a> and <b>IComponent2::RestoreResultView</b> methods in MMC 2.0, however, provide the mechanism whereby internal view settings are restored. The snap-in persists internal view settings against the <b>pstrPersistableViewDescription</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure. When MMC calls <b>IComponent2::RestoreResultView</b> to restore the result view, the snap-in uses the persisted settings to complete the view restoration.
     * 
     * The user revisits the result view by pressing the MMC <b>Back/Forward</b> buttons or loading a saved console file.
     * @param {Pointer} cookie A value that specifies the unique identifier whose result view will be restored.
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure for the result view.
     * @returns {HRESULT} If successful, the return value is S_OK. The snap-in can return S_FALSE to prevent MMC from restoring the view based on the information in *<i>pResultViewType</i>. Other return values indicate an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-restoreresultview
     */
    RestoreResultView(cookie, pResultViewType) {
        result := ComCall(12, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }
}
