#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IXMLHTTPRequest.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class IServerXMLHTTPRequest extends IXMLHTTPRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerXMLHTTPRequest
     * @type {Guid}
     */
    static IID => Guid("{2e9196bf-13ba-4dd4-91ca-6c571f281495}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setTimeouts", "waitForResponse", "getOption", "setOption"]

    /**
     * 
     * @param {Integer} resolveTimeout 
     * @param {Integer} connectTimeout 
     * @param {Integer} sendTimeout 
     * @param {Integer} receiveTimeout 
     * @returns {HRESULT} 
     */
    setTimeouts(resolveTimeout, connectTimeout, sendTimeout, receiveTimeout) {
        result := ComCall(21, this, "int", resolveTimeout, "int", connectTimeout, "int", sendTimeout, "int", receiveTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} timeoutInSeconds 
     * @param {Pointer<VARIANT_BOOL>} isSuccessful 
     * @returns {HRESULT} 
     */
    waitForResponse(timeoutInSeconds, isSuccessful) {
        result := ComCall(22, this, "ptr", timeoutInSeconds, "ptr", isSuccessful, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    getOption(option, value) {
        result := ComCall(23, this, "int", option, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @param {VARIANT} value 
     * @returns {HRESULT} 
     */
    setOption(option, value) {
        result := ComCall(24, this, "int", option, "ptr", value, "HRESULT")
        return result
    }
}
