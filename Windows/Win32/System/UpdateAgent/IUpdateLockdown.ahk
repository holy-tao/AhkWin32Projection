#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Restricts access to methods and properties of objects that implements the method of this interface.
 * @remarks
 * 
  * The <b>IUpdateLockdown</b> interface is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, not <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>. It cannot be accessed by using a script. This interface restricts access to the Windows Update  website.
  * 
  * The following classes implement the <b>IUpdateLockdown</b> interface:
  * 
  * 
  * 
  * <ul>
  * <li>AutomaticUpdates</li>
  * <li>UpdateDownloader</li>
  * <li>UpdateInstaller</li>
  * <li>UpdateServiceManager</li>
  * <li>WebProxy</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatelockdown
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateLockdown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateLockdown
     * @type {Guid}
     */
    static IID => Guid("{a976c28d-75a1-42aa-94ae-8af8b872089a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LockDown"]

    /**
     * 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatelockdown-lockdown
     */
    LockDown(flags) {
        result := ComCall(3, this, "int", flags, "HRESULT")
        return result
    }
}
