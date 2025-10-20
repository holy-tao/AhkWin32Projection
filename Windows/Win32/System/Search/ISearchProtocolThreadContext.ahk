#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This optional interface enables the protocol handler to perform an action on the thread used for filtering in the protocol host.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchprotocolthreadcontext
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchProtocolThreadContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchProtocolThreadContext
     * @type {Guid}
     */
    static IID => Guid("{c73106e1-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ThreadInit", "ThreadShutdown", "ThreadIdle"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadinit
     */
    ThreadInit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadshutdown
     */
    ThreadShutdown() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwTimeElaspedSinceLastCallInMS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchprotocolthreadcontext-threadidle
     */
    ThreadIdle(dwTimeElaspedSinceLastCallInMS) {
        result := ComCall(5, this, "uint", dwTimeElaspedSinceLastCallInMS, "HRESULT")
        return result
    }
}
