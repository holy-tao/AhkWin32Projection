#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IRadioInstance extends IUnknown{
    /**
     * The interface identifier for IRadioInstance
     * @type {Guid}
     */
    static IID => Guid("{70aa1c9e-f2b4-4c61-86d3-6b9fb75fd1a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidSignature 
     * @returns {HRESULT} 
     */
    GetRadioManagerSignature(pguidSignature) {
        result := ComCall(3, this, "ptr", pguidSignature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrId 
     * @returns {HRESULT} 
     */
    GetInstanceSignature(pbstrId) {
        result := ComCall(4, this, "ptr", pbstrId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(lcid, pbstrName) {
        result := ComCall(5, this, "uint", lcid, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRadioState 
     * @returns {HRESULT} 
     */
    GetRadioState(pRadioState) {
        result := ComCall(6, this, "int*", pRadioState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} radioState 
     * @param {Integer} uTimeoutSec 
     * @returns {HRESULT} 
     */
    SetRadioState(radioState, uTimeoutSec) {
        result := ComCall(7, this, "int", radioState, "uint", uTimeoutSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsMultiComm() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAssociatingDevice() {
        result := ComCall(9, this, "int")
        return result
    }
}
