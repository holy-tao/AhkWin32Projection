#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a general mechanism for objects to offer services to other objects on the same host.
 * @remarks
 * 
  * Objects that expose a service first call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on their host for this interface, then execute <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iprofferservice-profferservice">IProfferService::ProfferService</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iprofferservice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IProfferService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProfferService
     * @type {Guid}
     */
    static IID => Guid("{cb728b20-f786-11ce-92ad-00aa00a74cd0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProfferService", "RevokeService"]

    /**
     * 
     * @param {Pointer<Guid>} serviceId 
     * @param {IServiceProvider} serviceProvider 
     * @param {Pointer<Integer>} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iprofferservice-profferservice
     */
    ProfferService(serviceId, serviceProvider, cookie) {
        result := ComCall(3, this, "ptr", serviceId, "ptr", serviceProvider, "uint*", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iprofferservice-revokeservice
     */
    RevokeService(cookie) {
        result := ComCall(4, this, "uint", cookie, "HRESULT")
        return result
    }
}
