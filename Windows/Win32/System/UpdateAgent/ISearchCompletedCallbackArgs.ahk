#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the completion of an asynchronous search. It also acts as a parameter to the SearchCompletedCallback delegate.
 * @remarks
 * 
  * The <b>ISearchCompletedCallbackArgs</b> interface is reserved for future use and has no properties or methods.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-isearchcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ISearchCompletedCallbackArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchCompletedCallbackArgs
     * @type {Guid}
     */
    static IID => Guid("{a700a634-2850-4c47-938a-9e4b6e5af9a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
