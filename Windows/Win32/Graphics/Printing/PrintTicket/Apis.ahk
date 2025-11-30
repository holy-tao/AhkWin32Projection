#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing.PrintTicket
 * @version v4.0.30319
 */
class PrintTicket {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PRINTTICKET_ISTREAM_APIS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static S_PT_NO_CONFLICT => 262145

    /**
     * @type {Integer (UInt32)}
     */
    static S_PT_CONFLICT_RESOLVED => 262146

    /**
     * @type {Integer (UInt32)}
     */
    static E_PRINTTICKET_FORMAT => 2147745795

    /**
     * @type {Integer (UInt32)}
     */
    static E_PRINTCAPABILITIES_FORMAT => 2147745796

    /**
     * @type {Integer (UInt32)}
     */
    static E_DELTA_PRINTTICKET_FORMAT => 2147745797

    /**
     * @type {Integer (UInt32)}
     */
    static E_PRINTDEVICECAPABILITIES_FORMAT => 2147745798
;@endregion Constants

;@region Methods
    /**
     * Retrieves the highest (latest) version of the Print Schema that the specified printer supports.
     * @param {PWSTR} pszPrinterName A pointer to the full name of a print queue.
     * @returns {Integer} A pointer to the highest version.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptqueryschemaversionsupport
     * @since windows5.1.2600
     */
    static PTQuerySchemaVersionSupport(pszPrinterName) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTQuerySchemaVersionSupport", "ptr", pszPrinterName, "uint*", &pMaxVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pMaxVersion
    }

    /**
     * Opens an instance of a print ticket provider.
     * @param {PWSTR} pszPrinterName A pointer to the full name of a print queue.
     * @param {Integer} dwVersion The version of the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> requested by the caller.
     * @param {Pointer<HPTPROVIDER>} phProvider A pointer to a handle for the provider.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptopenprovider
     * @since windows5.1.2600
     */
    static PTOpenProvider(pszPrinterName, dwVersion, phProvider) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTOpenProvider", "ptr", pszPrinterName, "uint", dwVersion, "ptr", phProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Opens an instance of a print ticket provider.
     * @param {PWSTR} pszPrinterName A pointer to the full name of a print queue.
     * @param {Integer} dwMaxVersion The latest version of the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> that the caller supports.
     * @param {Integer} dwPrefVersion The version of the Print Schema requested by the caller.
     * @param {Pointer<HPTPROVIDER>} phProvider A pointer to a handle for the provider.
     * @returns {Integer} A pointer to the version of the Print Schema that the print ticket provider will use.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptopenproviderex
     * @since windows5.1.2600
     */
    static PTOpenProviderEx(pszPrinterName, dwMaxVersion, dwPrefVersion, phProvider) {
        pszPrinterName := pszPrinterName is String ? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTOpenProviderEx", "ptr", pszPrinterName, "uint", dwMaxVersion, "uint", dwPrefVersion, "ptr", phProvider, "uint*", &pUsedVersion := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pUsedVersion
    }

    /**
     * Closes a print ticket provider handle.
     * @param {HPTPROVIDER} hProvider A handle to the provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptcloseprovider
     * @since windows5.1.2600
     */
    static PTCloseProvider(hProvider) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        result := DllCall("prntvpt.dll\PTCloseProvider", "ptr", hProvider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases buffers associated with print tickets and print capabilities.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer allocated during a call to a print ticket API.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptreleasememory
     * @since windows5.1.2600
     */
    static PTReleaseMemory(pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall("prntvpt.dll\PTReleaseMemory", pBufferMarshal, pBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the printer's capabilities formatted in compliance with the XML Print Schema.
     * @param {HPTPROVIDER} hProvider A handle to an open provider whose print capabilities are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {IStream} pPrintTicket A pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {IStream} pCapabilities A pointer to the stream where the print capabilities will be written, starting at the current seek position.
     * @param {Pointer<BSTR>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * If the <i>pPrintTicket</i> is not compliant with the <a href="/windows/desktop/printdocs/printschema">Print Schema</a> , the <b>HRESULT</b> is E_PRINTTICKET_FORMAT.
     * 
     * If the <i>pCapabilities</i> is not compliant with the <a href="/windows/desktop/printdocs/printschema">Print Schema</a> , the <b>HRESULT</b> is E_PRINTCAPABILITIES_FORMAT.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * Otherwise, another error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptgetprintcapabilities
     * @since windows5.1.2600
     */
    static PTGetPrintCapabilities(hProvider, pPrintTicket, pCapabilities, pbstrErrorMessage) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        result := DllCall("prntvpt.dll\PTGetPrintCapabilities", "ptr", hProvider, "ptr", pPrintTicket, "ptr", pCapabilities, "ptr", pbstrErrorMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the device printer's capabilities formatted in compliance with the XML Print Schema.
     * @param {HPTPROVIDER} hProvider A handle to an open device provider whose print capabilities are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {IStream} pPrintTicket An optional pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {IStream} pDeviceCapabilities A pointer to the stream where the device print capabilities will be written, starting at the current seek position.
     * @param {Pointer<BSTR>} pbstrErrorMessage A pointer to a PDC file or string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.The function uses this parameter only used if <i>pPrintTicket</i> is used.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK. Otherwise, returns an error message.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptgetprintdevicecapabilities
     * @since windows10.0.15063
     */
    static PTGetPrintDeviceCapabilities(hProvider, pPrintTicket, pDeviceCapabilities, pbstrErrorMessage) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        result := DllCall("prntvpt.dll\PTGetPrintDeviceCapabilities", "ptr", hProvider, "ptr", pPrintTicket, "ptr", pDeviceCapabilities, "ptr", pbstrErrorMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * It retrieves the print devices resources for a printer formatted in compliance with the XML Print Schema.
     * @param {HPTPROVIDER} hProvider A handle to an open device provider whose print device resources are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {PWSTR} pszLocaleName Optional pointer to the locale name. This parameter can be <b>NULL</b>.
     * @param {IStream} pPrintTicket A pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {IStream} pDeviceResources A pointer to the stream where the device print resources will be written, starting at the current seek position.
     * @param {Pointer<BSTR>} pbstrErrorMessage A pointer to a PDC file or string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK. Otherwise, returns an error message.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptgetprintdeviceresources
     * @since windows10.0.15063
     */
    static PTGetPrintDeviceResources(hProvider, pszLocaleName, pPrintTicket, pDeviceResources, pbstrErrorMessage) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := DllCall("prntvpt.dll\PTGetPrintDeviceResources", "ptr", hProvider, "ptr", pszLocaleName, "ptr", pPrintTicket, "ptr", pDeviceResources, "ptr", pbstrErrorMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Merges two print tickets and returns a valid, viable print ticket.
     * @param {HPTPROVIDER} hProvider A handle to an open print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {IStream} pBaseTicket A pointer to a print ticket. The stream's seek position must be at the beginning of the print ticket content. 
     * 
     * <div class="alert"><b>Note</b>  <b>PTMergeAndValidatePrintTicket</b> will validate the base ticket against the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema Framework</a> before merging.</div>
     * <div> </div>
     * @param {IStream} pDeltaTicket A pointer to a print ticket. The stream's seek position must be at the beginning of the print ticket content. <b>NULL</b> can be passed to this parameter. See Remarks. 
     * 
     * <div class="alert"><b>Note</b>  <b>PTMergeAndValidatePrintTicket</b> will validate the delta ticket against the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema Framework</a> before merging.</div>
     * <div> </div>
     * @param {Integer} scope A value specifying whether the scope of <i>pDeltaTicket</i> and <i>pResultTicket</i> is a single page, an entire document, or all documents in the print job. See Remarks.
     * @param {IStream} pResultTicket A pointer to the stream where the viable, merged ticket will be written. The seek position will be at the end of the print ticket. See Remarks.
     * @param {Pointer<BSTR>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pBaseTicket</i> or <i>pDeltaTicket</i>. If both are valid, this is <b>NULL</b>. Viability problems are not reported in <i>pbstrErrorMessage</i>.
     * @returns {HRESULT} If the operation succeeds with no conflict between the settings of the merged ticket and the capabilities of the printer, the <b>HRESULT</b> is S_PT_NO_CONFLICT.
     * 
     * If the operation succeeds but the merged ticket had to be changed in one or more settings because it requested functionality that the printer does not support, the <b>HRESULT</b> is S_PT_CONFLICT_RESOLVED. See Remarks.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * If <i>pBaseTicket</i> is invalid, the <b>HRESULT</b> is E_PRINTTICKET_FORMAT.
     * 
     * If <i>pDeltaTicket</i> is invalid, the <b>HRESULT</b> is E_DELTA_PRINTTICKET_FORMAT.
     * 
     * Otherwise, some other error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptmergeandvalidateprintticket
     * @since windows5.1.2600
     */
    static PTMergeAndValidatePrintTicket(hProvider, pBaseTicket, pDeltaTicket, scope, pResultTicket, pbstrErrorMessage) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        result := DllCall("prntvpt.dll\PTMergeAndValidatePrintTicket", "ptr", hProvider, "ptr", pBaseTicket, "ptr", pDeltaTicket, "int", scope, "ptr", pResultTicket, "ptr", pbstrErrorMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a print ticket into a DEVMODE structure.
     * @param {HPTPROVIDER} hProvider A handle to an opened print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {IStream} pPrintTicket A pointer to an <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream</a> with its seek position at the beginning of the print ticket.
     * @param {Integer} baseDevmodeType A value indicating whether the user's default <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> or the print queue's default <b>DEVMODE</b> is used to provide values to the output <b>DEVMODE</b> when <i>pPrintTicket</i> does not specify every possible setting for a <b>DEVMODE</b>.
     * @param {Integer} scope A value that specifies the scope of <i>pPrintTicket</i>. This value can specify a single page, an entire document, or all documents in the print job. Settings in <i>pPrintTicket</i> that are outside of the specified scope are ignored. See Remarks.
     * @param {Pointer<Integer>} pcbDevmode A pointer to the size of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> in bytes.
     * @param {Pointer<Pointer<DEVMODEA>>} ppDevmode A pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @param {Pointer<BSTR>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * If <i>pPrintTicket</i> is invalid, the <b>HRESULT</b> is E_PRINTTICKET_FORMAT.
     * 
     * Otherwise, some other error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptconvertprinttickettodevmode
     * @since windows5.1.2600
     */
    static PTConvertPrintTicketToDevMode(hProvider, pPrintTicket, baseDevmodeType, scope, pcbDevmode, ppDevmode, pbstrErrorMessage) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        pcbDevmodeMarshal := pcbDevmode is VarRef ? "uint*" : "ptr"
        ppDevmodeMarshal := ppDevmode is VarRef ? "ptr*" : "ptr"

        result := DllCall("prntvpt.dll\PTConvertPrintTicketToDevMode", "ptr", hProvider, "ptr", pPrintTicket, "int", baseDevmodeType, "int", scope, pcbDevmodeMarshal, pcbDevmode, ppDevmodeMarshal, ppDevmode, "ptr", pbstrErrorMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Converts a DEVMODE structure to a print ticket inside an IStream.
     * @param {HPTPROVIDER} hProvider A handle to an open print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Integer} cbDevmode The size of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> in bytes.
     * @param {Pointer<DEVMODEA>} pDevmode A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @param {Integer} scope A value that specifies the scope of <i>pPrintTicket</i>. This value can specify a single page, an entire document, or all documents in the print job. Settings in <i>pDevmode</i> that are outside the specified scope will not be included in <i>pPrintTicket</i>. See Remarks.
     * @param {IStream} pPrintTicket A pointer to an <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream</a> with its seek position at the beginning of the print ticket.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://docs.microsoft.com/windows/win32/api//prntvpt/nf-prntvpt-ptconvertdevmodetoprintticket
     * @since windows5.1.2600
     */
    static PTConvertDevModeToPrintTicket(hProvider, cbDevmode, pDevmode, scope, pPrintTicket) {
        hProvider := hProvider is Win32Handle ? NumGet(hProvider, "ptr") : hProvider

        result := DllCall("prntvpt.dll\PTConvertDevModeToPrintTicket", "ptr", hProvider, "uint", cbDevmode, "ptr", pDevmode, "int", scope, "ptr", pPrintTicket, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
