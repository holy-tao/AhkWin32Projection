#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssProviderNotifications interface manages providers registered with VSS.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivssprovidernotifications
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssProviderNotifications extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssProviderNotifications
     * @type {Guid}
     */
    static IID => Guid("{e561901f-03a5-4afe-86d0-72baeece7004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnLoad", "OnUnload"]

    /**
     * 
     * @param {IUnknown} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidernotifications-onload
     */
    OnLoad(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bForceUnload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsprov/nf-vsprov-ivssprovidernotifications-onunload
     */
    OnUnload(bForceUnload) {
        result := ComCall(4, this, "int", bForceUnload, "HRESULT")
        return result
    }
}
