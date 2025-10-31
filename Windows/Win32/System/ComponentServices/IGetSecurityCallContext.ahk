#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Retrieves a reference to an object created from the SecurityCallContext class that is associated with the current call.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-igetsecuritycallcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IGetSecurityCallContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetSecurityCallContext
     * @type {Guid}
     */
    static IID => Guid("{cafc823f-b441-11d1-b82b-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSecurityCallContext"]

    /**
     * 
     * @param {Pointer<ISecurityCallContext>} ppObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetsecuritycallcontext-getsecuritycallcontext
     */
    GetSecurityCallContext(ppObject) {
        result := ComCall(7, this, "ptr*", ppObject, "HRESULT")
        return result
    }
}
