#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Enables the caller to control an object pool.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-ipoolmanager
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IPoolManager extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPoolManager
     * @type {Guid}
     */
    static IID => Guid("{0a469861-5a91-43a0-99b6-d5e179bb0631}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShutdownPool"]

    /**
     * 
     * @param {BSTR} CLSIDOrProgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-ipoolmanager-shutdownpool
     */
    ShutdownPool(CLSIDOrProgID) {
        CLSIDOrProgID := CLSIDOrProgID is String ? BSTR.Alloc(CLSIDOrProgID).Value : CLSIDOrProgID

        result := ComCall(7, this, "ptr", CLSIDOrProgID, "HRESULT")
        return result
    }
}
