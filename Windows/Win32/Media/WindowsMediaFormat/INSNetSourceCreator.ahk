#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INSNetSourceCreator interface creates an administrative network source plug-in.
 * @see https://docs.microsoft.com/windows/win32/api//wmnetsourcecreator/nn-wmnetsourcecreator-insnetsourcecreator
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSNetSourceCreator extends IUnknown{
    /**
     * The interface identifier for INSNetSourceCreator
     * @type {Guid}
     */
    static IID => Guid("{0c0e4080-9081-11d2-beec-0060082f2054}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStreamName 
     * @param {Pointer<IUnknown>} pMonitor 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<IUnknown>} pUserContext 
     * @param {Pointer<IUnknown>} pCallback 
     * @param {Integer} qwContext 
     * @returns {HRESULT} 
     */
    CreateNetSource(pszStreamName, pMonitor, pData, pUserContext, pCallback, qwContext) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(4, this, "ptr", pszStreamName, "ptr", pMonitor, "char*", pData, "ptr", pUserContext, "ptr", pCallback, "uint", qwContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStreamName 
     * @param {Pointer<IUnknown>} ppPropertiesNode 
     * @returns {HRESULT} 
     */
    GetNetSourceProperties(pszStreamName, ppPropertiesNode) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(5, this, "ptr", pszStreamName, "ptr", ppPropertiesNode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppSharedNamespace 
     * @returns {HRESULT} 
     */
    GetNetSourceSharedNamespace(ppSharedNamespace) {
        result := ComCall(6, this, "ptr", ppSharedNamespace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStreamName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetNetSourceAdminInterface(pszStreamName, pVal) {
        pszStreamName := pszStreamName is String ? StrPtr(pszStreamName) : pszStreamName

        result := ComCall(7, this, "ptr", pszStreamName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcProtocols 
     * @returns {HRESULT} 
     */
    GetNumProtocolsSupported(pcProtocols) {
        result := ComCall(8, this, "uint*", pcProtocols, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProtocolNum 
     * @param {PWSTR} pwszProtocolName 
     * @param {Pointer<UInt16>} pcchProtocolName 
     * @returns {HRESULT} 
     */
    GetProtocolName(dwProtocolNum, pwszProtocolName, pcchProtocolName) {
        pwszProtocolName := pwszProtocolName is String ? StrPtr(pwszProtocolName) : pwszProtocolName

        result := ComCall(9, this, "uint", dwProtocolNum, "ptr", pwszProtocolName, "ushort*", pcchProtocolName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
