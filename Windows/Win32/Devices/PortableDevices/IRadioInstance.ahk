#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IRadioInstance extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRadioManagerSignature", "GetInstanceSignature", "GetFriendlyName", "GetRadioState", "SetRadioState", "IsMultiComm", "IsAssociatingDevice"]

    /**
     * 
     * @returns {Guid} 
     */
    GetRadioManagerSignature() {
        pguidSignature := Guid()
        result := ComCall(3, this, "ptr", pguidSignature, "HRESULT")
        return pguidSignature
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstanceSignature() {
        pbstrId := BSTR()
        result := ComCall(4, this, "ptr", pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {BSTR} 
     */
    GetFriendlyName(lcid) {
        pbstrName := BSTR()
        result := ComCall(5, this, "uint", lcid, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRadioState() {
        result := ComCall(6, this, "int*", &pRadioState := 0, "HRESULT")
        return pRadioState
    }

    /**
     * 
     * @param {Integer} radioState 
     * @param {Integer} uTimeoutSec 
     * @returns {HRESULT} 
     */
    SetRadioState(radioState, uTimeoutSec) {
        result := ComCall(7, this, "int", radioState, "uint", uTimeoutSec, "HRESULT")
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
