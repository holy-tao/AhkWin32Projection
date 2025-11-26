#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwianotifydevmgr
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaNotifyDevMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaNotifyDevMgr
     * @type {Guid}
     */
    static IID => Guid("{70681ea0-e7bf-4291-9fb1-4e8813a3f78e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NewDeviceArrival"]

    /**
     * This method is not implemented.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwianotifydevmgr-newdevicearrival
     */
    NewDeviceArrival() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
