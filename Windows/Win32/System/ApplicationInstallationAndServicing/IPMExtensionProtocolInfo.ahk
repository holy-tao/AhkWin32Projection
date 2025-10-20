#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionProtocolInfo extends IUnknown{
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
     * 
     * @param {Pointer<BSTR>} pProtocol 
     * @returns {HRESULT} 
     */
    get_Protocol(pProtocol) {
        result := ComCall(3, this, "ptr", pProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(4, this, "ptr", pImageUrn, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
