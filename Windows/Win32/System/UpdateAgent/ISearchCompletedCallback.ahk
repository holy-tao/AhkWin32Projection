#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Contains a method that handles the notification about the completion of an asynchronous search operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-isearchcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ISearchCompletedCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchCompletedCallback
     * @type {Guid}
     */
    static IID => Guid("{88aee058-d4b0-4725-a2f1-814a67ae964c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Handles the notification of the completion of an asynchronous search that is initiated by calling the IUpdateSearcher.BeginSearch method.
     * @param {ISearchJob} searchJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-isearchjob">ISearchJob</a> interface that contains search information.
     * @param {ISearchCompletedCallbackArgs} callbackArgs This parameter is reserved for future use and can be ignored. An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/aa386067(v=vs.85)">ISearchCompletedCallbackArgs</a> interface that contains information on the completion of an asynchronous search.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-isearchcompletedcallback-invoke
     */
    Invoke(searchJob, callbackArgs) {
        result := ComCall(3, this, "ptr", searchJob, "ptr", callbackArgs, "HRESULT")
        return result
    }
}
