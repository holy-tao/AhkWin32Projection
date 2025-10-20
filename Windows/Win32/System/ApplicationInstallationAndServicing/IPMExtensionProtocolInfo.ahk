#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionProtocolInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionProtocolInfo
     * @type {Guid}
     */
    static IID => Guid("{1e3fa036-51eb-4453-baff-b8d8e4b46c8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Protocol", "get_InvocationInfo"]

    /**
     * 
     * @param {Pointer<BSTR>} pProtocol 
     * @returns {HRESULT} 
     */
    get_Protocol(pProtocol) {
        result := ComCall(3, this, "ptr", pProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(4, this, "ptr", pImageUrn, "ptr", pParameters, "HRESULT")
        return result
    }
}
