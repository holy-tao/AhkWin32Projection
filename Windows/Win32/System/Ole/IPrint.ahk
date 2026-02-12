#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables compound documents in general and active documents in particular to support programmatic printing.
 * @remarks
 * After a document is loaded, containers and other clients can call <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iprint-print">IPrint::Print</a> to instruct a document to print itself, specifying printing control flags, the target device, the particular pages to print, and other options. The client can control the continuation of printing by calling the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-icontinuecallback">IContinueCallback</a> interface. 
 * 
 * 
 * An object that implements <b>IPrint</b> registers itself with the <b>Printable</b> key stored under its CLSID as follows:
 * 
 * 
 * <b>HKEY_CLASSES_ROOT\CLSID\{...}\Printable</b>
 * 
 * 
 * 
 * Callers determine whether a particular object class supports programmatic printing of its persistent state by looking in the registry for this key.
 * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nn-docobj-iprint
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPrint extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrint
     * @type {Guid}
     */
    static IID => Guid("{b722bcc9-4e68-101b-a2bc-00aa00404770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInitialPageNum", "GetPageInfo", "Print"]

    /**
     * Sets the page number of the first page of a document.
     * @remarks
     * Setting the first page to a negative number is valid. This may be useful in printing a portion of the document with page numbers that specify an offset from the usual pagination.
     * 
     * Not all implementations permit the initial page number to be set, as some implementations simply lack the information as to how the page number should be presented in the final output.
     * @param {Integer} nFirstPage The page number of the first page.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-iprint-setinitialpagenum
     */
    SetInitialPageNum(nFirstPage) {
        result := ComCall(3, this, "int", nFirstPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the number of a document's first page and the total number of pages.
     * @param {Pointer<Integer>} pnFirstPage A pointer to a variable that receives the page number of the first page. This parameter can be <b>NULL</b>, indicating that the caller is not interested in this number. If <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iprint-setinitialpagenum">IPrint::SetInitialPageNum</a> has been called, this parameter should contain the same value passed to that method. Otherwise, the value is the document's internal first page number.
     * @param {Pointer<Integer>} pcPages A pointer to a variable that receives the total number of pages in this document. This parameter can be <b>NULL</b>, indicating that the caller is not interested in this number.
     * @returns {HRESULT} This method can return the standard return values E_UNEXPECTED and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-iprint-getpageinfo
     */
    GetPageInfo(pnFirstPage, pcPages) {
        pnFirstPageMarshal := pnFirstPage is VarRef ? "int*" : "ptr"
        pcPagesMarshal := pcPages is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnFirstPageMarshal, pnFirstPage, pcPagesMarshal, pcPages, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prints an object on the specified printer, using the specified job requirements.
     * @remarks
     * The printer on which the object is to be printed is indicated by the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure pointed to by <i>pptd</i>. The <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure in the target device indicates whole-job printer-specific options, such as number of copies, paper size, and print quality. The <b>DEVMODE</b> structure may also contain orientation information in the <b>dmOrientation</b> member (this is indicated in the <b>dmFields</b> member). If present, then this paper orientation should be used; if absent, then natural orientation as determined by the object content is to be used.
     * 
     * Due to the possibility of user input, the parameters <i>pptd</i> and <i>ppPageSet</i> are both [in,out] structures. In the absence of user interaction (that is, if the PRINTFLAG_PROMPTUSER flag is not set), both the target device and the page set will necessarily be the same for input and output. However, if the user is prompted for print options, then the object returns target device and page-set information appropriate to what the user has actually chosen.
     * 
     * The <i>pstgmOptions</i> parameter is also [in,out]. On exit, the object should write to *<i>pstgmOptions</i> any object-specific information that it would need to reproduce this exact print job. Examples might include whether the user selected "sheet, notes, or both" in a spreadsheet application. The data passed is in the format of a serialized property set. The data is normally useful only when passed back in a subsequent call to the same object. Because a subsequent call may specify different user interaction flags, target device, or other settings, the caller can cause the document to be printed multiple times in the same way in slightly different printing contexts.
     * @param {Integer} grfFlags A bitfield specifying print options from the <b>PRINTFLAG</b> enumeration.
     * @param {Pointer<Pointer<DVTARGETDEVICE>>} pptd A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-dvtargetdevice">DVTARGETDEVICE</a> structure that describes the target print device.
     * @param {Pointer<Pointer<PAGESET>>} ppPageSet A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/docobj/ns-docobj-pageset">PAGESET</a> pointer variable that receives a pointer to the structure that indicates which pages are to be printed.
     * @param {Pointer<STGMEDIUM>} pstgmOptions A pointer to object-specific printing options in a serialized OLE property set. This parameter can be <b>NULL</b> on input or return.
     * @param {IContinueCallback} pcallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nn-docobj-icontinuecallback">IContinueCallback</a> interface on the view site, which is to be periodically polled at human-response speeds to determine whether printing should be abandoned. This parameter can be <b>NULL</b>.
     * @param {Integer} nFirstPage The page number of the first page to be printed. This value overrides any value previously passed to <a href="https://docs.microsoft.com/windows/desktop/api/docobj/nf-docobj-iprint-setinitialpagenum">IPrint::SetInitialPageNum</a>.
     * @param {Pointer<Integer>} pcPagesPrinted A pointer to a variable that receives the actual number of pages that were successfully printed.
     * @param {Pointer<Integer>} pnLastPage A pointer to a variable that receives the page number of the last page that was printed.
     * @returns {HRESULT} This method can return the standard return value E_UNEXPECTED, as well as the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PRINT_E_CANCELED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The print process was canceled before completion. *<i>pcPagesPrinted</i> indicates the number of pages that were in fact successfully printed before this error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>PRINT_E_NOSUCHPAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A page specified in **<i>ppPageSet</i> or <i>nFirstPage</i> does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/docobj/nf-docobj-iprint-print
     */
    Print(grfFlags, pptd, ppPageSet, pstgmOptions, pcallback, nFirstPage, pcPagesPrinted, pnLastPage) {
        pptdMarshal := pptd is VarRef ? "ptr*" : "ptr"
        ppPageSetMarshal := ppPageSet is VarRef ? "ptr*" : "ptr"
        pcPagesPrintedMarshal := pcPagesPrinted is VarRef ? "int*" : "ptr"
        pnLastPageMarshal := pnLastPage is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", grfFlags, pptdMarshal, pptd, ppPageSetMarshal, ppPageSet, "ptr", pstgmOptions, "ptr", pcallback, "int", nFirstPage, pcPagesPrintedMarshal, pcPagesPrinted, pnLastPageMarshal, pnLastPage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
