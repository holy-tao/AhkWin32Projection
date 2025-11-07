#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
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
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-activate
     */
    Activate(iid, dwClsCtx, pActivationParams) {
        result := ComCall(3, this, "ptr", iid, "uint", dwClsCtx, "ptr", pActivationParams, "ptr*", &ppInterface := 0, "HRESULT")
        return ppInterface
    }

    /**
     * 
     * @param {Integer} stgmAccess 
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-openpropertystore
     */
    OpenPropertyStore(stgmAccess) {
        result := ComCall(4, this, "uint", stgmAccess, "ptr*", &ppProperties := 0, "HRESULT")
        return IPropertyStore(ppProperties)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid
     */
    GetId() {
        result := ComCall(5, this, "ptr*", &ppstrId := 0, "HRESULT")
        return ppstrId
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getstate
     */
    GetState() {
        result := ComCall(6, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }
}
