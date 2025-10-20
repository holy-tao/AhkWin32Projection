#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDeviceActivator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDeviceActivator
     * @type {Guid}
     */
    static IID => Guid("{3b0d0ea4-d0a9-4b0e-935b-09516746fac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate"]

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {IMMDevice} pDevice 
     * @param {Pointer<PROPVARIANT>} pActivationParams 
     * @param {Pointer<Pointer<Void>>} ppInterface 
     * @returns {HRESULT} 
     */
    Activate(iid, pDevice, pActivationParams, ppInterface) {
        result := ComCall(3, this, "ptr", iid, "ptr", pDevice, "ptr", pActivationParams, "ptr*", ppInterface, "HRESULT")
        return result
    }
}
