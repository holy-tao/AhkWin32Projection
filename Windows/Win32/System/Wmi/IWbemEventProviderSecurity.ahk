#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemEventProviderSecurity interface is optionally implemented by event providers who want to restrict consumer access to their event. For more information about when to use this interface, see Securing WMI Events.
 * @remarks
 * 
 * This method is automatically called by Windows Management whenever a new consumer attempts to subscribe to an event where the event provider has implemented 
 * <b>IWbemEventProviderSecurity</b>. If the consumer has access permission for the event the consumer is subscribed to the event; otherwise, the subscription is denied.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemeventprovidersecurity
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemEventProviderSecurity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemEventProviderSecurity
     * @type {Guid}
     */
    static IID => Guid("{631f7d96-d993-11d2-b339-00105a1f4aaf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AccessCheck"]

    /**
     * Determines whether a security descriptor grants a specified set of access rights to the client identified by an access token.
     * @param {Pointer<Integer>} wszQueryLanguage 
     * @param {Pointer<Integer>} wszQuery 
     * @param {Integer} lSidLength 
     * @param {Pointer<Integer>} pSid 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     *       
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-accesscheck
     */
    AccessCheck(wszQueryLanguage, wszQuery, lSidLength, pSid) {
        wszQueryLanguageMarshal := wszQueryLanguage is VarRef ? "ushort*" : "ptr"
        wszQueryMarshal := wszQuery is VarRef ? "ushort*" : "ptr"
        pSidMarshal := pSid is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, wszQueryLanguageMarshal, wszQueryLanguage, wszQueryMarshal, wszQuery, "int", lSidLength, pSidMarshal, pSid, "HRESULT")
        return result
    }
}
