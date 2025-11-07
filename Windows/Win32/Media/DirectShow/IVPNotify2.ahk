#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVPNotify.ahk

/**
 * The IVPNotify2 interface inherits from IVPNotify and is implemented by the Overlay Mixer filter.
 * @remarks
 * 
 * Include Vptype.h before Vpnotify.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vpnotify/nn-vpnotify-ivpnotify2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPNotify2 extends IVPNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVPNotify2
     * @type {Guid}
     */
    static IID => Guid("{ebf47183-8764-11d1-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetVPSyncMaster", "GetVPSyncMaster"]

    /**
     * 
     * @param {BOOL} bVPSyncMaster 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify2-setvpsyncmaster
     */
    SetVPSyncMaster(bVPSyncMaster) {
        result := ComCall(6, this, "int", bVPSyncMaster, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbVPSyncMaster 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify2-getvpsyncmaster
     */
    GetVPSyncMaster(pbVPSyncMaster) {
        pbVPSyncMasterMarshal := pbVPSyncMaster is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pbVPSyncMasterMarshal, pbVPSyncMaster, "HRESULT")
        return result
    }
}
