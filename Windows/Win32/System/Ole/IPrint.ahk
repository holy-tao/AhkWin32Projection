#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables compound documents in general and active documents in particular to support programmatic printing.
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//docobj/nn-docobj-iprint
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
     * 
     * @param {Integer} nFirstPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-iprint-setinitialpagenum
     */
    SetInitialPageNum(nFirstPage) {
        result := ComCall(3, this, "int", nFirstPage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnFirstPage 
     * @param {Pointer<Integer>} pcPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-iprint-getpageinfo
     */
    GetPageInfo(pnFirstPage, pcPages) {
        pnFirstPageMarshal := pnFirstPage is VarRef ? "int*" : "ptr"
        pcPagesMarshal := pcPages is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pnFirstPageMarshal, pnFirstPage, pcPagesMarshal, pcPages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Pointer<Pointer<DVTARGETDEVICE>>} pptd 
     * @param {Pointer<Pointer<PAGESET>>} ppPageSet 
     * @param {Pointer<STGMEDIUM>} pstgmOptions 
     * @param {IContinueCallback} pcallback 
     * @param {Integer} nFirstPage 
     * @param {Pointer<Integer>} pcPagesPrinted 
     * @param {Pointer<Integer>} pnLastPage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/docobj/nf-docobj-iprint-print
     */
    Print(grfFlags, pptd, ppPageSet, pstgmOptions, pcallback, nFirstPage, pcPagesPrinted, pnLastPage) {
        pptdMarshal := pptd is VarRef ? "ptr*" : "ptr"
        ppPageSetMarshal := ppPageSet is VarRef ? "ptr*" : "ptr"
        pcPagesPrintedMarshal := pcPagesPrinted is VarRef ? "int*" : "ptr"
        pnLastPageMarshal := pnLastPage is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", grfFlags, pptdMarshal, pptd, ppPageSetMarshal, ppPageSet, "ptr", pstgmOptions, "ptr", pcallback, "int", nFirstPage, pcPagesPrintedMarshal, pcPagesPrinted, pnLastPageMarshal, pnLastPage, "HRESULT")
        return result
    }
}
