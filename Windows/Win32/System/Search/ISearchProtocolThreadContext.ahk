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
     * 
     * @returns {HRESULT} 
     */
    ThreadInit() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ThreadShutdown() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwTimeElaspedSinceLastCallInMS 
     * @returns {HRESULT} 
     */
    ThreadIdle(dwTimeElaspedSinceLastCallInMS) {
        result := ComCall(5, this, "uint", dwTimeElaspedSinceLastCallInMS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
