#Requires AutoHotkey v2.0.0 64-bit

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
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <i>pszPrinterName</i> parameter must be the full name, not the truncated name as it may appear in a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * 
     * The first version of the Print Schema was released with Windows Vista and is version 1.
     * @param {Pointer<Char>} pszPrinterName A pointer to the full name of a print queue.
     * @param {Pointer<UInt32>} pMaxVersion A pointer to the highest version.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptqueryschemaversionsupport
     * @since windows5.1.2600
     */
    static PTQuerySchemaVersionSupport(pszPrinterName, pMaxVersion) {
        pszPrinterName := pszPrinterName is String? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTQuerySchemaVersionSupport", "ptr", pszPrinterName, "uint*", pMaxVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens an instance of a print ticket provider. (PTOpenProvider)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * <i>pszPrinterName</i> must be the full name, not the truncated name as it may appear in a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * 
     * The first version of the Print Schema was released with Windows Vista and is version 1. This operation fails if <i>version</i> is not supported. Contrast this with <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> which opens a provider even if it supports only versions that are earlier than requested.
     * 
     * To avoid a resource leak, <i>phProvider</i> must be closed with <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptcloseprovider">PTCloseProvider</a>.
     * @param {Pointer<Char>} pszPrinterName A pointer to the full name of a print queue.
     * @param {Integer} dwVersion The version of the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> requested by the caller.
     * @param {Pointer<Void>} phProvider A pointer to a handle for the provider.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptopenprovider
     * @since windows5.1.2600
     */
    static PTOpenProvider(pszPrinterName, dwVersion, phProvider) {
        pszPrinterName := pszPrinterName is String? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTOpenProvider", "ptr", pszPrinterName, "uint", dwVersion, "ptr", phProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Opens an instance of a print ticket provider. (PTOpenProviderEx)
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <i>pszPrinterName</i> parameter must be the full name, not the truncated name as it may appear in a <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * 
     * The first version of the Print Schema was released with Windows Vista and is version 1. If the print ticket provider does not support <i>prefVersion</i>, <b>PTOpenProviderEx</b> successfully opens a handle and returns an earlier version in <i>usedVersion</i>.
     * 
     * To avoid a resource leak, <i>phProvider</i> must be closed with <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptcloseprovider">PTCloseProvider</a>.
     * @param {Pointer<Char>} pszPrinterName A pointer to the full name of a print queue.
     * @param {Integer} dwMaxVersion The latest version of the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> that the caller supports.
     * @param {Integer} dwPrefVersion The version of the Print Schema requested by the caller.
     * @param {Pointer<Void>} phProvider A pointer to a handle for the provider.
     * @param {Pointer<UInt32>} pUsedVersion A pointer to the version of the Print Schema that the print ticket provider will use.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptopenproviderex
     * @since windows5.1.2600
     */
    static PTOpenProviderEx(pszPrinterName, dwMaxVersion, dwPrefVersion, phProvider, pUsedVersion) {
        pszPrinterName := pszPrinterName is String? StrPtr(pszPrinterName) : pszPrinterName

        result := DllCall("prntvpt.dll\PTOpenProviderEx", "ptr", pszPrinterName, "uint", dwMaxVersion, "uint", dwPrefVersion, "ptr", phProvider, "uint*", pUsedVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a print ticket provider handle.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <i>hProvider</i> parameter must be a handle that was opened in the same thread as the thread in which it is used for this function. 
     *       
     * 
     * A handle cannot be used after it is closed.
     * @param {Pointer<Void>} hProvider A handle to the provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptcloseprovider
     * @since windows5.1.2600
     */
    static PTCloseProvider(hProvider) {
        result := DllCall("prntvpt.dll\PTCloseProvider", "ptr", hProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Releases buffers associated with print tickets and print capabilities.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Use this function to release the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> buffer returned by <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptconvertprinttickettodevmode">PTConvertPrintTicketToDevMode</a>.
     * @param {Pointer<Void>} pBuffer A pointer to a buffer allocated during a call to a print ticket API.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptreleasememory
     * @since windows5.1.2600
     */
    static PTReleaseMemory(pBuffer) {
        result := DllCall("prntvpt.dll\PTReleaseMemory", "ptr", pBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the printer's capabilities formatted in compliance with the XML Print Schema.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * <i>hProvider</i> must be a handle that was opened in the same thread as the thread in which it is used for this function. 
     *       
     * 
     * The printer driver uses <i>pPrintTicket</i> values (when the value is not <b>NULL</b>) to create settings when the driver produces printer capabilities that vary depending on the current settings.
     * 
     * When the function returns, the seek position of <i>pPrintTicket</i> is at the end of the print ticket content and the seek position of <i>pCapabilities</i> is at the end of the stream. If the caller uses a memory stream for <i>pCapabilities</i>, such as a stream created by <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-createstreamonhglobal">CreateStreamOnHGlobal</a> , the caller is responsible for resetting the seek position before reading the data.
     * 
     * If <i>pbstrErrorMessage</i> is not <b>NULL</b> when the function returns, the caller must free the string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @param {Pointer<Void>} hProvider A handle to an open provider whose print capabilities are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Pointer<IStream>} pPrintTicket A pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {Pointer<IStream>} pCapabilities A pointer to the stream where the print capabilities will be written, starting at the current seek position.
     * @param {Pointer<Char>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * If the <i>pPrintTicket</i> is not compliant with the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> , the <b>HRESULT</b> is E_PRINTTICKET_FORMAT.
     * 
     * If the <i>pCapabilities</i> is not compliant with the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema</a> , the <b>HRESULT</b> is E_PRINTCAPABILITIES_FORMAT.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * Otherwise, another error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptgetprintcapabilities
     * @since windows5.1.2600
     */
    static PTGetPrintCapabilities(hProvider, pPrintTicket, pCapabilities, pbstrErrorMessage) {
        result := DllCall("prntvpt.dll\PTGetPrintCapabilities", "ptr", hProvider, "ptr", pPrintTicket, "ptr", pCapabilities, "ptr", pbstrErrorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the device printer's capabilities formatted in compliance with the XML Print Schema.
     * @param {Pointer<Void>} hProvider A handle to an open device provider whose print capabilities are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Pointer<IStream>} pPrintTicket An optional pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {Pointer<IStream>} pDeviceCapabilities A pointer to the stream where the device print capabilities will be written, starting at the current seek position.
     * @param {Pointer<Char>} pbstrErrorMessage A pointer to a PDC file or string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.The function uses this parameter only used if <i>pPrintTicket</i> is used.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK. Otherwise, returns an error message.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptgetprintdevicecapabilities
     * @since windows10.0.15063
     */
    static PTGetPrintDeviceCapabilities(hProvider, pPrintTicket, pDeviceCapabilities, pbstrErrorMessage) {
        result := DllCall("prntvpt.dll\PTGetPrintDeviceCapabilities", "ptr", hProvider, "ptr", pPrintTicket, "ptr", pDeviceCapabilities, "ptr", pbstrErrorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * It retrieves the print devices resources for a printer formatted in compliance with the XML Print Schema.
     * @param {Pointer<Void>} hProvider A handle to an open device provider whose print device resources are to be retrieved. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Pointer<Char>} pszLocaleName Optional pointer to the locale name. This parameter can be <b>NULL</b>.
     * @param {Pointer<IStream>} pPrintTicket A pointer to a stream with its seek position at the beginning of the print ticket content. This parameter can be <b>NULL</b>.
     * @param {Pointer<IStream>} pDeviceResources A pointer to the stream where the device print resources will be written, starting at the current seek position.
     * @param {Pointer<Char>} pbstrErrorMessage A pointer to a PDC file or string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this value is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK. Otherwise, returns an error message.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptgetprintdeviceresources
     * @since windows10.0.15063
     */
    static PTGetPrintDeviceResources(hProvider, pszLocaleName, pPrintTicket, pDeviceResources, pbstrErrorMessage) {
        pszLocaleName := pszLocaleName is String? StrPtr(pszLocaleName) : pszLocaleName

        result := DllCall("prntvpt.dll\PTGetPrintDeviceResources", "ptr", hProvider, "ptr", pszLocaleName, "ptr", pPrintTicket, "ptr", pDeviceResources, "ptr", pbstrErrorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Merges two print tickets and returns a valid, viable print ticket.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * <i>hProvider</i> must be a handle that was opened in the same thread as the thread in which it is used for this function. 
     *       
     * 
     * This function validates in two ways: It first validates both input tickets against the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema Framework</a>, reporting errors in <i>pbstrErrorMessage</i>. It then checks the viability of the merged print ticket with the printer driver. If the merged ticket requests functionality that the printer does not support, the nonviable settings are replaced and the printer driver determines what substitute setting to use. Typically, the printer driver uses the user's default print ticket setting. If the printer driver does not use the same print ticket that <i>pBaseTicket</i> points to as the source for substitute values, it is possible that <i>pResultTicket</i> will differ in some settings from both of the input print tickets.
     * 
     * Typically, <i>pBaseTicket</i> contains a full range of job, document and page settings. Usually the user default or the device default print ticket is used for <i>pBaseTicket</i>.
     * 
     * If <i>pDeltaTicket</i> is <b>NULL</b>, the method validates <i>pBaseTicket</i>, checks its viability, and returns it, possibly modified, in the stream pointed to by <i>pResultTicket</i>.
     * 
     * Values of <i>pDeltaTicket</i> that are outside of the <i>scope</i> are ignored. For example, if the scope is only a single page, then job-wide settings and document-wide settings are ignored. Job scope includes document scope and page scope. Document scope includes page scope.
     * 
     * Settings that are outside of the <i>scope</i> are not included in the <i>pResultTicket</i>.
     * 
     * When the function returns a value, the seek position of <i>pResultTicket</i> is at the end of the print ticket content. The caller is responsible for resetting the seek position before reading the data.
     * 
     * If <i>pbstrErrorMessage</i> is not <b>NULL</b> when the function returns, the caller must free the string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @param {Pointer<Void>} hProvider A handle to an open print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Pointer<IStream>} pBaseTicket A pointer to a print ticket. The stream's seek position must be at the beginning of the print ticket content. 
     * 
     * <div class="alert"><b>Note</b>  <b>PTMergeAndValidatePrintTicket</b> will validate the base ticket against the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema Framework</a> before merging.</div>
     * <div> </div>
     * @param {Pointer<IStream>} pDeltaTicket A pointer to a print ticket. The stream's seek position must be at the beginning of the print ticket content. <b>NULL</b> can be passed to this parameter. See Remarks. 
     * 
     * <div class="alert"><b>Note</b>  <b>PTMergeAndValidatePrintTicket</b> will validate the delta ticket against the <a href="https://docs.microsoft.com/windows/desktop/printdocs/printschema">Print Schema Framework</a> before merging.</div>
     * <div> </div>
     * @param {Integer} scope A value specifying whether the scope of <i>pDeltaTicket</i> and <i>pResultTicket</i> is a single page, an entire document, or all documents in the print job. See Remarks.
     * @param {Pointer<IStream>} pResultTicket A pointer to the stream where the viable, merged ticket will be written. The seek position will be at the end of the print ticket. See Remarks.
     * @param {Pointer<Char>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pBaseTicket</i> or <i>pDeltaTicket</i>. If both are valid, this is <b>NULL</b>. Viability problems are not reported in <i>pbstrErrorMessage</i>.
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
     * Otherwise, some other error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptmergeandvalidateprintticket
     * @since windows5.1.2600
     */
    static PTMergeAndValidatePrintTicket(hProvider, pBaseTicket, pDeltaTicket, scope, pResultTicket, pbstrErrorMessage) {
        result := DllCall("prntvpt.dll\PTMergeAndValidatePrintTicket", "ptr", hProvider, "ptr", pBaseTicket, "ptr", pDeltaTicket, "int", scope, "ptr", pResultTicket, "ptr", pbstrErrorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a print ticket into a DEVMODE structure.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The <i>hProvider</i> parameter must be a handle that was opened in the same thread as the thread in which it is used for this function. 
     *       
     * 
     * If <i>baseDevmodeType</i> is kUserDefaultDevmode, but the user's default is not available, then the device's default will be used.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> may be internally inconsistent or conflict with hard printer settings even though each setting within it is viable individually. For example, if the printer supports an optional duplexer but the <i>pPrintTicket</i> calls for duplexing, then the returned <b>DEVMODE</b> will also call for duplexing, even if the duplexer is not installed. Use <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a> to correct the returned <b>DEVMODE</b>.
     * 
     * The buffer in the returned <i>ppDevmode</i> should be released with <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptreleasememory">PTReleaseMemory</a>.
     * 
     * Values of <i>pPrintTicket</i> that are outside of the <i>scope</i> are ignored. For example, if the scope is only a single page, then job-wide settings and document-wide settings are ignored. Job scope includes document scope and page scope. Document scope includes page scope.
     * 
     * If <i>pbstrErrorMessage</i> is not <b>NULL</b> when the function returns, the caller must free the string with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @param {Pointer<Void>} hProvider A handle to an opened print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Pointer<IStream>} pPrintTicket A pointer to an <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream</a> with its seek position at the beginning of the print ticket.
     * @param {Integer} baseDevmodeType A value indicating whether the user's default <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> or the print queue's default <b>DEVMODE</b> is used to provide values to the output <b>DEVMODE</b> when <i>pPrintTicket</i> does not specify every possible setting for a <b>DEVMODE</b>.
     * @param {Integer} scope A value that specifies the scope of <i>pPrintTicket</i>. This value can specify a single page, an entire document, or all documents in the print job. Settings in <i>pPrintTicket</i> that are outside of the specified scope are ignored. See Remarks.
     * @param {Pointer<UInt32>} pcbDevmode A pointer to the size of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> in bytes.
     * @param {Pointer<DEVMODEA>} ppDevmode A pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @param {Pointer<Char>} pbstrErrorMessage A pointer to a string that specifies what, if anything, is invalid about <i>pPrintTicket</i>. If it is valid, this is <b>NULL</b>.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * If <i>pPrintTicket</i> is invalid, the <b>HRESULT</b> is E_PRINTTICKET_FORMAT.
     * 
     * Otherwise, some other error code is returned in the <b>HRESULT</b>. For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptconvertprinttickettodevmode
     * @since windows5.1.2600
     */
    static PTConvertPrintTicketToDevMode(hProvider, pPrintTicket, baseDevmodeType, scope, pcbDevmode, ppDevmode, pbstrErrorMessage) {
        result := DllCall("prntvpt.dll\PTConvertPrintTicketToDevMode", "ptr", hProvider, "ptr", pPrintTicket, "int", baseDevmodeType, "int", scope, "uint*", pcbDevmode, "ptr", ppDevmode, "ptr", pbstrErrorMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts a DEVMODE structure to a print ticket inside an IStream.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * <i>hProvider</i> must be a handle that was opened in the same thread as the thread in which it is used for this function.
     *       
     * 
     * If the <i>pDevmode</i> points to a different printer, its settings may be lost and replaced with defaults.
     * 
     * Settings in <i>pDevmode</i> that are outside the <i>scope</i> are not included in <i>pPrintTicket</i>. For example, if the scope is a single page, then job-wide settings and document-wide settings are not included. A job scope includes document scope and page scope. A document scope includes page scope.
     * 
     * <b>PTConvertDevModeToPrintTicket</b> writes the print ticket to the <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream</a> referenced by <i>pPrintTicket</i> starting at the stream's current seek point. After <b>PTConvertDevModeToPrintTicket</b> returns, the caller must reset the seek point to the initial seek point to read the print ticket returned by the function.
     * @param {Pointer<Void>} hProvider A handle to an open print ticket provider. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenprovider">PTOpenProvider</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/prntvpt/nf-prntvpt-ptopenproviderex">PTOpenProviderEx</a> function.
     * @param {Integer} cbDevmode The size of the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> in bytes.
     * @param {Pointer<DEVMODEA>} pDevmode A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a>.
     * @param {Integer} scope A value that specifies the scope of <i>pPrintTicket</i>. This value can specify a single page, an entire document, or all documents in the print job. Settings in <i>pDevmode</i> that are outside the specified scope will not be included in <i>pPrintTicket</i>. See Remarks.
     * @param {Pointer<IStream>} pPrintTicket A pointer to an <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream</a> with its seek position at the beginning of the print ticket.
     * @returns {HRESULT} If the operation succeeds, the return value is S_OK, otherwise the <b>HRESULT</b> contains an error code.
     * 
     * If <i>hProvider</i> was opened in a different thread, the <b>HRESULT</b> is E_INVALIDARG.
     * 
     * For more information about COM error codes, see <a href="https://docs.microsoft.com/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * @see https://learn.microsoft.com/windows/win32/api/prntvpt/nf-prntvpt-ptconvertdevmodetoprintticket
     * @since windows5.1.2600
     */
    static PTConvertDevModeToPrintTicket(hProvider, cbDevmode, pDevmode, scope, pPrintTicket) {
        result := DllCall("prntvpt.dll\PTConvertDevModeToPrintTicket", "ptr", hProvider, "uint", cbDevmode, "ptr", pDevmode, "int", scope, "ptr", pPrintTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
