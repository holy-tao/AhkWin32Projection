#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGICrossAdapterBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDXGICrossAdapterBuffer
     * @type {Guid}
     */
    static IID => Guid("{b25d03fb-d148-45ef-bfed-f778b7566c07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceForDevice", "GetSubresourceIndexForDevice", "GetUnknownForDevice", "SetUnknownForDevice"]

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetResourceForDevice(pUnkDevice, riid, ppvObject) {
        result := ComCall(3, this, "ptr", pUnkDevice, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Integer>} puSubresource 
     * @returns {HRESULT} 
     */
    GetSubresourceIndexForDevice(pUnkDevice, puSubresource) {
        result := ComCall(4, this, "ptr", pUnkDevice, "uint*", puSubresource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     */
    GetUnknownForDevice(pUnkDevice, guid, riid, ppvObject) {
        result := ComCall(5, this, "ptr", pUnkDevice, "ptr", guid, "ptr", riid, "ptr*", ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pUnkData 
     * @returns {HRESULT} 
     */
    SetUnknownForDevice(pUnkDevice, guid, pUnkData) {
        result := ComCall(6, this, "ptr", pUnkDevice, "ptr", guid, "ptr", pUnkData, "HRESULT")
        return result
    }
}
