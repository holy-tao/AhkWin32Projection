#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMDevice interface encapsulates the generic features of a multimedia device resource.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immdevice
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMMDevice
     * @type {Guid}
     */
    static IID => Guid("{d666063f-1587-4e43-81f1-b948e807363f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "OpenPropertyStore", "GetId", "GetState"]

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Integer} dwClsCtx 
     * @param {Pointer<PROPVARIANT>} pActivationParams 
     * @param {Pointer<Pointer<Void>>} ppInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate
     */
    Activate(iid, dwClsCtx, pActivationParams, ppInterface) {
        result := ComCall(3, this, "ptr", iid, "uint", dwClsCtx, "ptr", pActivationParams, "ptr*", ppInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @param {Pointer<IPropertyStore>} ppProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-openpropertystore
     */
    OpenPropertyStore(stgmAccess, ppProperties) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppstrId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid
     */
    GetId(ppstrId) {
        result := ComCall(5, this, "ptr", ppstrId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getstate
     */
    GetState(pdwState) {
        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwStateMarshal, pdwState, "HRESULT")
        return result
    }
}
