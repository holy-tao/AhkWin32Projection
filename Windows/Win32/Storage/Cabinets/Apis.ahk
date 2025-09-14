#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 * @version v4.0.30319
 */
class Cabinets {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static INCLUDED_FCI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _A_NAME_IS_UTF => 128

    /**
     * @type {Integer (UInt32)}
     */
    static _A_EXEC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static statusFile => 0

    /**
     * @type {Integer (UInt32)}
     */
    static statusFolder => 1

    /**
     * @type {Integer (UInt32)}
     */
    static statusCabinet => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INCLUDED_TYPES_FCI_FDI => 1

    /**
     * @type {Integer (Int32)}
     */
    static CB_MAX_DISK => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static CB_MAX_FILENAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CB_MAX_CABINET_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CB_MAX_CAB_PATH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CB_MAX_DISK_NAME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static tcompMASK_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static tcompTYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static tcompTYPE_MSZIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static tcompTYPE_QUANTUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static tcompTYPE_LZX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static tcompBAD => 15

    /**
     * @type {Integer (UInt32)}
     */
    static tcompMASK_LZX_WINDOW => 7936

    /**
     * @type {Integer (UInt32)}
     */
    static tcompLZX_WINDOW_LO => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static tcompLZX_WINDOW_HI => 5376

    /**
     * @type {Integer (UInt32)}
     */
    static tcompSHIFT_LZX_WINDOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static tcompMASK_QUANTUM_LEVEL => 240

    /**
     * @type {Integer (UInt32)}
     */
    static tcompQUANTUM_LEVEL_LO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static tcompQUANTUM_LEVEL_HI => 112

    /**
     * @type {Integer (UInt32)}
     */
    static tcompSHIFT_QUANTUM_LEVEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static tcompMASK_QUANTUM_MEM => 7936

    /**
     * @type {Integer (UInt32)}
     */
    static tcompQUANTUM_MEM_LO => 2560

    /**
     * @type {Integer (UInt32)}
     */
    static tcompQUANTUM_MEM_HI => 5376

    /**
     * @type {Integer (UInt32)}
     */
    static tcompSHIFT_QUANTUM_MEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static tcompMASK_RESERVED => 57344

    /**
     * @type {Integer (UInt32)}
     */
    static INCLUDED_FDI => 1
;@endregion Constants

;@region Methods
    /**
     * The FCICreate function creates an FCI context.
     * @remarks
     * FCI supports multiple simultaneous contexts. As a result it is possible to create or extract multiple cabinets at the same time within the same application. If the application is multithreaded, it is also possible to run a different context in each thread; however, an application cannot use the same context simultaneously in multiple threads. For example, <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fciaddfile">FCIAddFile</a> cannot be called from two different threads, using the same FCI context.
     * @param {Pointer<ERF>} perf Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure that receives the error information.
     * @param {Pointer<PFNFCIFILEPLACED>} pfnfcifp Pointer to an application-defined callback function to notify when a file is placed in the cabinet. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcifileplaced">FNFCIFILEPLACED</a> macro.
     * @param {Pointer<PFNFCIALLOC>} pfna Pointer to an application-defined callback function to allocate memory. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcialloc">FNFCIALLOC</a> macro.
     * @param {Pointer<PFNFCIFREE>} pfnf Pointer to an application-defined callback function to free previously allocated memory. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcifree">FNFCIFREE</a> macro.
     * @param {Pointer<PFNFCIOPEN>} pfnopen Pointer to an application-defined callback function to open a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfciopen">FNFCIOPEN</a> macro.
     * @param {Pointer<PFNFCIREAD>} pfnread Pointer to an application-defined callback function to read data from a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfciread">FNFCIREAD</a> macro.
     * @param {Pointer<PFNFCIWRITE>} pfnwrite Pointer to an application-defined callback function to write data to a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfciwrite">FNFCIWRITE</a> macro.
     * @param {Pointer<PFNFCICLOSE>} pfnclose Pointer to an application-defined callback function to close a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfciclose">FNFCICLOSE</a> macro.
     * @param {Pointer<PFNFCISEEK>} pfnseek Pointer to an application-defined callback function to move a file pointer to the specific location. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfciseek">FNFCISEEK</a> macro.
     * @param {Pointer<PFNFCIDELETE>} pfndelete Pointer to an application-defined callback function to delete a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcidelete">FNFCIDELETE</a> macro.
     * @param {Pointer<PFNFCIGETTEMPFILE>} pfnfcigtf Pointer to an application-defined callback function to retrieve a temporary file name. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcigettempfile">FNFCIGETTEMPFILE</a> macro.
     * @param {Pointer<CCAB>} pccab Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/fci/ns-fci-ccab">CCAB</a> structure that contains the parameters for creating a cabinet.
     * @param {Pointer<Void>} pv Pointer to an application-defined value that is passed to callback functions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/fci/nf-fci-fcicreate
     */
    static FCICreate(perf, pfnfcifp, pfna, pfnf, pfnopen, pfnread, pfnwrite, pfnclose, pfnseek, pfndelete, pfnfcigtf, pccab, pv) {
        DllCall("Cabinet.dll\FCICreate", "ptr", perf, "ptr", pfnfcifp, "ptr", pfna, "ptr", pfnf, "ptr", pfnopen, "ptr", pfnread, "ptr", pfnwrite, "ptr", pfnclose, "ptr", pfnseek, "ptr", pfndelete, "ptr", pfnfcigtf, "ptr", pccab, "ptr", pv, "CDecl ")
    }

    /**
     * The FCIAddFile adds a file to the cabinet under construction.
     * @remarks
     * When set, the _A_EXEC attribute is added to the file entry in the CAB. This mechanism is used in some Microsoft self-extracting executables, and could be used for this purpose in any custom extraction application.
     * @param {Pointer<Void>} hfci A valid FCI context handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fcicreate">FCICreate</a> function.
     * @param {Pointer<PSTR>} pszSourceFile The name of the file to add; this value should include path information.
     * @param {Pointer<PSTR>} pszFileName The name under which to store the file in the cabinet.
     * @param {Integer} fExecute If set <b>TRUE</b>, the file will be executed when extracted.
     * @param {Pointer<PFNFCIGETNEXTCABINET>} pfnfcignc Pointer to an application-defined callback function to obtain specifications on the next cabinet to create. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcigetnextcabinet">FNFCIGETNEXTCABINET</a> macro.
     * @param {Pointer<PFNFCISTATUS>} pfnfcis Pointer to an application-defined callback function to update the progress information available to the user. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcistatus">FNFCISTATUS</a> macro.
     * @param {Pointer<PFNFCIGETOPENINFO>} pfnfcigoi Pointer to an application-defined callback function to open a file and retrieve the file date, time, and attributes. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcigetopeninfo">FNFCIGETOPENINFO</a> macro.
     * @param {Integer} typeCompress The compression type to use.
     * 
     * <div class="alert"><b>Note</b>  To indicate LZX compression, use the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/nf-fdi_fci_types-tcompfromlzxwindow">TCOMPfromLZXWindow</a> macro.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tcompTYPE_NONE"></a><a id="tcomptype_none"></a><a id="TCOMPTYPE_NONE"></a><dl>
     * <dt><b>tcompTYPE_NONE</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="tcompTYPE_MSZIP"></a><a id="tcomptype_mszip"></a><a id="TCOMPTYPE_MSZIP"></a><dl>
     * <dt><b>tcompTYPE_MSZIP</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft ZIP compression.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FCI context.
     * @see https://learn.microsoft.com/windows/win32/api/fci/nf-fci-fciaddfile
     */
    static FCIAddFile(hfci, pszSourceFile, pszFileName, fExecute, pfnfcignc, pfnfcis, pfnfcigoi, typeCompress) {
        result := DllCall("Cabinet.dll\FCIAddFile", "ptr", hfci, "ptr", pszSourceFile, "ptr", pszFileName, "int", fExecute, "ptr", pfnfcignc, "ptr", pfnfcis, "ptr", pfnfcigoi, "ushort", typeCompress, "CDecl int")
        return result
    }

    /**
     * The FCIFlushCabinet function completes the current cabinet.
     * @remarks
     * The <b>FCIFlushCabinet</b> API forces the current cabinet under construction to be completed immediately and then written to disk. Further calls to <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fciaddfile">FCIAddFile</a> will result in files being added to another cabinet.
     * 
     *  In the event the current cabinet has reached the application-specified media size limit, the pending data within an FCI's internal buffers will be placed into another cabinet.
     * 
     * The <i>fGetNextCab</i> flag determines whether the function pointed to by the <i>GetNextCab</i> parameter will be called. If <i>fGetNextCab</i> is set <b>TRUE</b>, <i>GetNextCab</i> is called to obtain continuation information. If <b>FALSE</b>, then <i>GetNextCab</i> is called only in the event the cabinet overflows.
     * @param {Pointer<Void>} hfci A valid FCI context handle returned by the<a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fcicreate">FCICreate</a> function.
     * @param {Integer} fGetNextCab Specifies whether the function pointed to by the supplied <i>GetNextCab</i> parameter will be called.
     * @param {Pointer<PFNFCIGETNEXTCABINET>} pfnfcignc Pointer to an application-defined callback function to obtain specifications on the next cabinet to create. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcigetnextcabinet">FNFCIGETNEXTCABINET</a> macro.
     * @param {Pointer<PFNFCISTATUS>} pfnfcis Pointer to an application-defined callback function to update the user. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcistatus">FNFCISTATUS</a> macro.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FCI context.
     * @see https://learn.microsoft.com/windows/win32/api/fci/nf-fci-fciflushcabinet
     */
    static FCIFlushCabinet(hfci, fGetNextCab, pfnfcignc, pfnfcis) {
        result := DllCall("Cabinet.dll\FCIFlushCabinet", "ptr", hfci, "int", fGetNextCab, "ptr", pfnfcignc, "ptr", pfnfcis, "CDecl int")
        return result
    }

    /**
     * The FCIFlushFolder function forces the current folder under construction to be completed immediately.
     * @remarks
     * The <b>FCIFlushFolder</b> API forces the folder currently under construction to be completed immediately; effectively resetting the compression history if a compression method is in use.
     * 
     * The callback function indicated by <i>GetNextCab</i> will be called if the cabinet overflows, which occurs if the pending data buffered inside an FCI causes the application-specified cabinet media size to be exceeded.
     * @param {Pointer<Void>} hfci A valid FCI context handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fcicreate">FCICreate</a> function.
     * @param {Pointer<PFNFCIGETNEXTCABINET>} pfnfcignc Pointer to an application-defined callback function to obtain specifications on the next cabinet to create. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcigetnextcabinet">FNFCIGETNEXTCABINET</a> macro.
     * @param {Pointer<PFNFCISTATUS>} pfnfcis Pointer to an application-defined callback function to update the user. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fnfcistatus">FNFCISTATUS</a> macro.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FCI context.
     * @see https://learn.microsoft.com/windows/win32/api/fci/nf-fci-fciflushfolder
     */
    static FCIFlushFolder(hfci, pfnfcignc, pfnfcis) {
        result := DllCall("Cabinet.dll\FCIFlushFolder", "ptr", hfci, "ptr", pfnfcignc, "ptr", pfnfcis, "CDecl int")
        return result
    }

    /**
     * The FCIDestroy function deletes an open FCI context, freeing any memory and temporary files associated with the context.
     * @param {Pointer<Void>} hfci A valid FCI context handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fci/nf-fci-fcicreate">FCICreate</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FCI context.
     * @see https://learn.microsoft.com/windows/win32/api/fci/nf-fci-fcidestroy
     */
    static FCIDestroy(hfci) {
        result := DllCall("Cabinet.dll\FCIDestroy", "ptr", hfci, "CDecl int")
        return result
    }

    /**
     * The FDICreate function creates an FDI context.
     * @param {Pointer<PFNALLOC>} pfnalloc Pointer to an application-defined callback function to allocate memory. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnalloc">FNALLOC</a> macro.
     * @param {Pointer<PFNFREE>} pfnfree Pointer to an application-defined callback function to free previously allocated memory. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnfree">FNFREE</a> macro.
     * @param {Pointer<PFNOPEN>} pfnopen Pointer to an application-defined callback function to open a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnopen">FNOPEN</a> macro.
     * @param {Pointer<PFNREAD>} pfnread Pointer to an application-defined callback function to read data from a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnread">FNREAD</a> macro.
     * @param {Pointer<PFNWRITE>} pfnwrite Pointer to an application-defined callback function to write data to a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnwrite">FNWRITE</a> macro.
     * @param {Pointer<PFNCLOSE>} pfnclose Pointer to an application-defined callback function to close a file. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnclose">FNCLOSE</a> macro.
     * @param {Pointer<PFNSEEK>} pfnseek Pointer to an application-defined callback function to move a file pointer to the specified location. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnseek">FNSEEK</a> macro.
     * @param {Integer} cpuType 
     * @param {Pointer<ERF>} perf Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure that receives the error information.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/fdi/nf-fdi-fdicreate
     * @since windows5.0
     */
    static FDICreate(pfnalloc, pfnfree, pfnopen, pfnread, pfnwrite, pfnclose, pfnseek, cpuType, perf) {
        DllCall("Cabinet.dll\FDICreate", "ptr", pfnalloc, "ptr", pfnfree, "ptr", pfnopen, "ptr", pfnread, "ptr", pfnwrite, "ptr", pfnclose, "ptr", pfnseek, "int", cpuType, "ptr", perf, "CDecl ")
    }

    /**
     * The FDIIsCabinet function determines whether a file is a cabinet and, if it is, returns information about it.
     * @param {Pointer<Void>} hfdi A valid FDI context handle returned  by <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fdicreate">FDICreate</a>.
     * @param {Pointer} hf An application-defined value to keep track of the opened file. This value must be of the same type as values used by the File I/O functions passed to <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fdicreate">FDICreate</a>.
     * @param {Pointer<FDICABINETINFO>} pfdici Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/fdi/ns-fdi-fdicabinetinfo">FDICABINETINFO</a> structure that receives the cabinet details, in the event the file is actually a cabinet.
     * @returns {Integer} If the file is a cabinet, the function returns <b>TRUE</b> ; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FDI context.
     * @see https://learn.microsoft.com/windows/win32/api/fdi/nf-fdi-fdiiscabinet
     * @since windows5.0
     */
    static FDIIsCabinet(hfdi, hf, pfdici) {
        result := DllCall("Cabinet.dll\FDIIsCabinet", "ptr", hfdi, "ptr", hf, "ptr", pfdici, "CDecl int")
        return result
    }

    /**
     * The FDICopy function extracts files from cabinets.
     * @param {Pointer<Void>} hfdi A valid FDI context handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fdicreate">FDICreate</a> function.
     * @param {Pointer<PSTR>} pszCabinet The name of the cabinet file, excluding any path information, from which to extract files. If a file is split over multiple cabinets, <b>FDICopy</b>  allows for subsequent cabinets to be opened.
     * @param {Pointer<PSTR>} pszCabPath The pathname of the cabinet file, but not including the name of the file itself. For example, "C:\MyCabs\". 
     * 
     * The contents of <i>pszCabinet</i> are appended to <i>pszCabPath</i> to create the full pathname of the cabinet.
     * @param {Integer} flags No flags are currently defined and this parameter should be set to zero.
     * @param {Pointer<PFNFDINOTIFY>} pfnfdin Pointer to an application-defined callback notification function to update the application on the status of the decoder. The function should be declared using the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fnfdinotify">FNFDINOTIFY</a> macro.
     * @param {Pointer<PFNFDIDECRYPT>} pfnfdid Not currently used by FDI. This parameter should be set to <b>NULL</b>.
     * @param {Pointer<Void>} pvUser Pointer to an application-specified value to pass to the notification function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FDI context.
     * @see https://learn.microsoft.com/windows/win32/api/fdi/nf-fdi-fdicopy
     * @since windows5.0
     */
    static FDICopy(hfdi, pszCabinet, pszCabPath, flags, pfnfdin, pfnfdid, pvUser) {
        result := DllCall("Cabinet.dll\FDICopy", "ptr", hfdi, "ptr", pszCabinet, "ptr", pszCabPath, "int", flags, "ptr", pfnfdin, "ptr", pfnfdid, "ptr", pvUser, "CDecl int")
        return result
    }

    /**
     * The FDIDestroy function deletes an open FDI context.
     * @param {Pointer<Void>} hfdi A valid FDI context handle returned by  the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fdicreate">FDICreate</a> function.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FDI context.
     * @see https://learn.microsoft.com/windows/win32/api/fdi/nf-fdi-fdidestroy
     * @since windows5.0
     */
    static FDIDestroy(hfdi) {
        result := DllCall("Cabinet.dll\FDIDestroy", "ptr", hfdi, "CDecl int")
        return result
    }

    /**
     * The FDITruncateCabinet function truncates a cabinet file starting at the specified folder number.
     * @param {Pointer<Void>} hfdi A valid FDI context handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/fdi/nf-fdi-fdicreate">FDICreate</a> function.
     * @param {Pointer<PSTR>} pszCabinetName The full cabinet filename.
     * @param {Integer} iFolderToDelete The index of the first folder to delete.
     * @returns {Integer} If the function succeeds, it returns <b>TRUE</b>; otherwise, <b>FALSE</b>.
     * 
     * Extended error information is provided in the <a href="https://docs.microsoft.com/windows/desktop/api/fdi_fci_types/ns-fdi_fci_types-erf">ERF</a> structure used to create the FDI context.
     * @see https://learn.microsoft.com/windows/win32/api/fdi/nf-fdi-fditruncatecabinet
     */
    static FDITruncateCabinet(hfdi, pszCabinetName, iFolderToDelete) {
        result := DllCall("Cabinet.dll\FDITruncateCabinet", "ptr", hfdi, "ptr", pszCabinetName, "ushort", iFolderToDelete, "CDecl int")
        return result
    }

;@endregion Methods
}
