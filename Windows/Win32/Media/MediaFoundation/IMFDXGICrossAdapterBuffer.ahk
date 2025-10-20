#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGICrossAdapterBuffer extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} pUnkDevice 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetResourceForDevice(pUnkDevice, riid, ppvObject) {
        result := ComCall(3, this, "ptr", pUnkDevice, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkDevice 
     * @param {Pointer<UInt32>} puSubresource 
     * @returns {HRESULT} 
     */
    GetSubresourceIndexForDevice(pUnkDevice, puSubresource) {
        result := ComCall(4, this, "ptr", pUnkDevice, "uint*", puSubresource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetUnknownForDevice(pUnkDevice, guid, riid, ppvObject) {
        result := ComCall(5, this, "ptr", pUnkDevice, "ptr", guid, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pUnkDevice 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} pUnkData 
     * @returns {HRESULT} 
     */
    SetUnknownForDevice(pUnkDevice, guid, pUnkData) {
        result := ComCall(6, this, "ptr", pUnkDevice, "ptr", guid, "ptr", pUnkData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
