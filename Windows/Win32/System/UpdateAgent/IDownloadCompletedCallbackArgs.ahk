#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the completion of a download. This interface acts as a parameter to the IDownloadCompletedCallback delegate. The download and installation of the update is asynchronous.
 * @remarks
 * 
  * The <b>IDownloadCompletedCallbackArgs</b> interface is reserved for future use. It has no properties or methods.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadCompletedCallbackArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadCompletedCallbackArgs
     * @type {Guid}
     */
    static IID => Guid("{fa565b23-498c-47a0-979d-e7d5b1813360}")

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
