#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsPrintQueue interface represents a printer on a network.
 * @remarks
 * 
  * Use this interface to browse a collection of print jobs in the print queue. To control a printer across a network, use the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsprintqueueoperations">IADsPrintQueueOperations</a> interface. To obtain a collection of the print jobs, call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsprintqueueoperations-printjobs">IADsPrintQueueOperations::PrintJobs</a> method.
  * 
  * In Windows, a printer, or a print queue, is managed by a host computer. If the path to a print queue is known, bind to it as to any other ADSI objects.
  * 
  * The following Visual Basic code example shows the bind operation.
  * 
  * 
  * ```vb
  * Dim pq as IADsPrintQueue
  * Set pq = GetObject("WinNT://aMachine/aPrinter")
  * ```
  * 
  * 
  * The following C++ code example shows the bind operation.
  * 
  * 
  * ```cpp
  * IADsPrintQueue *pq;
  * LPWSTR adsPath = L"WinNT://aMachine/aPrinter";
  * HRESULT hr = ADsGetObject(adsPath,
  *                           IID_IADsPrintQueue,
  *                           (void**)&pq);
  * ```
  * 
  * 
  * <p class="proch"><b>To enumerate all print queues on a given computer</b>
  * 
  * <ol>
  * <li>Bind to the computer object.</li>
  * <li>Determine if the computer contains any "PrintQueue" objects.</li>
  * <li>Enumerate all the found printer objects.</li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsprintqueue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPrintQueue extends IADs{
    /**
     * The interface identifier for IADsPrintQueue
     * @type {Guid}
     */
    static IID => Guid("{b15160d0-1226-11cf-a985-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PrinterPath(retval) {
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrinterPath 
     * @returns {HRESULT} 
     */
    put_PrinterPath(bstrPrinterPath) {
        bstrPrinterPath := bstrPrinterPath is String ? BSTR.Alloc(bstrPrinterPath).Value : bstrPrinterPath

        result := ComCall(21, this, "ptr", bstrPrinterPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Model(retval) {
        result := ComCall(22, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        bstrModel := bstrModel is String ? BSTR.Alloc(bstrModel).Value : bstrModel

        result := ComCall(23, this, "ptr", bstrModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Datatype(retval) {
        result := ComCall(24, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDatatype 
     * @returns {HRESULT} 
     */
    put_Datatype(bstrDatatype) {
        bstrDatatype := bstrDatatype is String ? BSTR.Alloc(bstrDatatype).Value : bstrDatatype

        result := ComCall(25, this, "ptr", bstrDatatype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PrintProcessor(retval) {
        result := ComCall(26, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrintProcessor 
     * @returns {HRESULT} 
     */
    put_PrintProcessor(bstrPrintProcessor) {
        bstrPrintProcessor := bstrPrintProcessor is String ? BSTR.Alloc(bstrPrintProcessor).Value : bstrPrintProcessor

        result := ComCall(27, this, "ptr", bstrPrintProcessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(29, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Location(retval) {
        result := ComCall(30, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        bstrLocation := bstrLocation is String ? BSTR.Alloc(bstrLocation).Value : bstrLocation

        result := ComCall(31, this, "ptr", bstrLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retval 
     * @returns {HRESULT} 
     */
    get_StartTime(retval) {
        result := ComCall(32, this, "double*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} daStartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(daStartTime) {
        result := ComCall(33, this, "double", daStartTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} retval 
     * @returns {HRESULT} 
     */
    get_UntilTime(retval) {
        result := ComCall(34, this, "double*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} daUntilTime 
     * @returns {HRESULT} 
     */
    put_UntilTime(daUntilTime) {
        result := ComCall(35, this, "double", daUntilTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_DefaultJobPriority(retval) {
        result := ComCall(36, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnDefaultJobPriority 
     * @returns {HRESULT} 
     */
    put_DefaultJobPriority(lnDefaultJobPriority) {
        result := ComCall(37, this, "int", lnDefaultJobPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Priority(retval) {
        result := ComCall(38, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lnPriority) {
        result := ComCall(39, this, "int", lnPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_BannerPage(retval) {
        result := ComCall(40, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBannerPage 
     * @returns {HRESULT} 
     */
    put_BannerPage(bstrBannerPage) {
        bstrBannerPage := bstrBannerPage is String ? BSTR.Alloc(bstrBannerPage).Value : bstrBannerPage

        result := ComCall(41, this, "ptr", bstrBannerPage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_PrintDevices(retval) {
        result := ComCall(42, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vPrintDevices 
     * @returns {HRESULT} 
     */
    put_PrintDevices(vPrintDevices) {
        result := ComCall(43, this, "ptr", vPrintDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_NetAddresses(retval) {
        result := ComCall(44, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(45, this, "ptr", vNetAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
