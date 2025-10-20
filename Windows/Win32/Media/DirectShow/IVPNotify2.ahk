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
     * 
     * @param {BOOL} bVPSyncMaster 
     * @returns {HRESULT} 
     */
    SetVPSyncMaster(bVPSyncMaster) {
        result := ComCall(6, this, "int", bVPSyncMaster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbVPSyncMaster 
     * @returns {HRESULT} 
     */
    GetVPSyncMaster(pbVPSyncMaster) {
        result := ComCall(7, this, "ptr", pbVPSyncMaster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
