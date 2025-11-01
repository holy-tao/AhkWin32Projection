#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPortManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPortManager
     * @type {Guid}
     */
    static IID => Guid("{da77c14b-6208-43ca-8ddf-5b60a0a69fac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMapping", "UpdateRemoteAddress", "ReleaseMapping"]

    /**
     * 
     * @param {BSTR} bstrRemoteAddress 
     * @param {Integer} enPortType 
     * @param {Pointer<BSTR>} pbstrInternalLocalAddress 
     * @param {Pointer<Integer>} plInternalLocalPort 
     * @param {Pointer<BSTR>} pbstrExternalLocalAddress 
     * @param {Pointer<Integer>} plExternalLocalPort 
     * @returns {HRESULT} 
     */
    GetMapping(bstrRemoteAddress, enPortType, pbstrInternalLocalAddress, plInternalLocalPort, pbstrExternalLocalAddress, plExternalLocalPort) {
        bstrRemoteAddress := bstrRemoteAddress is String ? BSTR.Alloc(bstrRemoteAddress).Value : bstrRemoteAddress

        plInternalLocalPortMarshal := plInternalLocalPort is VarRef ? "int*" : "ptr"
        plExternalLocalPortMarshal := plExternalLocalPort is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", bstrRemoteAddress, "int", enPortType, "ptr", pbstrInternalLocalAddress, plInternalLocalPortMarshal, plInternalLocalPort, "ptr", pbstrExternalLocalAddress, plExternalLocalPortMarshal, plExternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRemoteAddress 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @param {BSTR} bstrExternalLocalAddress 
     * @param {Integer} lExternalLocalPort 
     * @returns {HRESULT} 
     */
    UpdateRemoteAddress(bstrRemoteAddress, bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalPort) {
        bstrRemoteAddress := bstrRemoteAddress is String ? BSTR.Alloc(bstrRemoteAddress).Value : bstrRemoteAddress
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress
        bstrExternalLocalAddress := bstrExternalLocalAddress is String ? BSTR.Alloc(bstrExternalLocalAddress).Value : bstrExternalLocalAddress

        result := ComCall(4, this, "ptr", bstrRemoteAddress, "ptr", bstrInternalLocalAddress, "int", lInternalLocalPort, "ptr", bstrExternalLocalAddress, "int", lExternalLocalPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInternalLocalAddress 
     * @param {Integer} lInternalLocalPort 
     * @param {BSTR} bstrExternalLocalAddress 
     * @param {Integer} lExternalLocalAddress 
     * @returns {HRESULT} 
     */
    ReleaseMapping(bstrInternalLocalAddress, lInternalLocalPort, bstrExternalLocalAddress, lExternalLocalAddress) {
        bstrInternalLocalAddress := bstrInternalLocalAddress is String ? BSTR.Alloc(bstrInternalLocalAddress).Value : bstrInternalLocalAddress
        bstrExternalLocalAddress := bstrExternalLocalAddress is String ? BSTR.Alloc(bstrExternalLocalAddress).Value : bstrExternalLocalAddress

        result := ComCall(5, this, "ptr", bstrInternalLocalAddress, "int", lInternalLocalPort, "ptr", bstrExternalLocalAddress, "int", lExternalLocalAddress, "HRESULT")
        return result
    }
}
