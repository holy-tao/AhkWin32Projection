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
     * 
     * @param {Pointer} cookie 
     * @param {Integer} type 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-querydispatch
     */
    QueryDispatch(cookie, type) {
        result := ComCall(10, this, "ptr", cookie, "int", type, "ptr*", &ppDispatch := 0, "HRESULT")
        return IDispatch(ppDispatch)
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-getresultviewtype2
     */
    GetResultViewType2(cookie, pResultViewType) {
        result := ComCall(11, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cookie 
     * @param {Pointer<RESULT_VIEW_TYPE_INFO>} pResultViewType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icomponent2-restoreresultview
     */
    RestoreResultView(cookie, pResultViewType) {
        result := ComCall(12, this, "ptr", cookie, "ptr", pResultViewType, "HRESULT")
        return result
    }
}
