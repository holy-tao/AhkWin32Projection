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
     * 
     * @param {Integer} nFirstPage 
     * @returns {HRESULT} 
     */
    SetInitialPageNum(nFirstPage) {
        result := ComCall(3, this, "int", nFirstPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnFirstPage 
     * @param {Pointer<Int32>} pcPages 
     * @returns {HRESULT} 
     */
    GetPageInfo(pnFirstPage, pcPages) {
        result := ComCall(4, this, "int*", pnFirstPage, "int*", pcPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfFlags 
     * @param {Pointer<DVTARGETDEVICE>} pptd 
     * @param {Pointer<PAGESET>} ppPageSet 
     * @param {Pointer<STGMEDIUM>} pstgmOptions 
     * @param {Pointer<IContinueCallback>} pcallback 
     * @param {Integer} nFirstPage 
     * @param {Pointer<Int32>} pcPagesPrinted 
     * @param {Pointer<Int32>} pnLastPage 
     * @returns {HRESULT} 
     */
    Print(grfFlags, pptd, ppPageSet, pstgmOptions, pcallback, nFirstPage, pcPagesPrinted, pnLastPage) {
        result := ComCall(5, this, "uint", grfFlags, "ptr", pptd, "ptr", ppPageSet, "ptr", pstgmOptions, "ptr", pcallback, "int", nFirstPage, "int*", pcPagesPrinted, "int*", pnLastPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
