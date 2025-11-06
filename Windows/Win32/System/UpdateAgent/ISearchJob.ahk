#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains properties and methods that are available to a search operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-isearchjob
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ISearchJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchJob
     * @type {Guid}
     */
    static IID => Guid("{7366ea16-7a1a-4ea2-b042-973d3e9cd99b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AsyncState", "get_IsCompleted", "CleanUp", "RequestAbort"]

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-cleanup
     */
    CleanUp() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-isearchjob-requestabort
     */
    RequestAbort() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
