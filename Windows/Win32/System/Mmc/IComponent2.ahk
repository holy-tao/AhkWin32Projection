#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\IComponent.ahk

/**
 * The IComponent2 interface, implemented by snap-ins, is introduced in MMC 2.0 and supersedes the IComponent interface.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icomponent2
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
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icomponent2-querydispatch
     */
    QueryDispatch(cookie, type) {
        result := ComCall(10, this, "ptr", cookie, "int", type, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * The GetResultViewType2 method retrieves the result view type. This method supersedes the IComponent::GetResultViewType method.
     * @param {Pointer} cookie A value that specifies the snapin-provided unique identifier for the scope item. For more details about cookies in MMC, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cookies">Cookies</a>.
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure for the result view. If your snap-in implements 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nn-mmc-icomponent2">IComponent2</a>, the <b>pstrPersistableViewDescription</b> member of the <b>RESULT_VIEW_TYPE_INFO</b> structure must contain a valid view description string; otherwise, MMC will not initialize your snap-in. The <b>pstrPersistableViewDescription</b> member must be allocated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. The snap-in must not free <b>pstrPersistableViewDescription</b>, as it will be freed by MMC.
     * @returns {HRESULT} If successful, the return value is S_OK. Other return values indicate an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icomponent2-getresultviewtype2
     */
    GetResultViewType2(cookie, pResultViewType) {
        result := ComCall(11, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }

    /**
     * The RestoreResultView method restores the result view. This method enables a snap-in to restore snap-in-specific details of a result view. For more information, see Restoring Result Views.
     * @param {Pointer} cookie A value that specifies the unique identifier whose result view will be restored.
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-result_view_type_info">RESULT_VIEW_TYPE_INFO</a> structure for the result view.
     * @returns {HRESULT} If successful, the return value is S_OK. The snap-in can return S_FALSE to prevent MMC from restoring the view based on the information in *<i>pResultViewType</i>. Other return values indicate an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icomponent2-restoreresultview
     */
    RestoreResultView(cookie, pResultViewType) {
        result := ComCall(12, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }
}
