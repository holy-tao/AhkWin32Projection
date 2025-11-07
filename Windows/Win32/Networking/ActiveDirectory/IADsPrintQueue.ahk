#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PrinterPath", "put_PrinterPath", "get_Model", "put_Model", "get_Datatype", "put_Datatype", "get_PrintProcessor", "put_PrintProcessor", "get_Description", "put_Description", "get_Location", "put_Location", "get_StartTime", "put_StartTime", "get_UntilTime", "put_UntilTime", "get_DefaultJobPriority", "put_DefaultJobPriority", "get_Priority", "put_Priority", "get_BannerPage", "put_BannerPage", "get_PrintDevices", "put_PrintDevices", "get_NetAddresses", "put_NetAddresses"]

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrinterPath() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrinterPath 
     * @returns {HRESULT} 
     */
    put_PrinterPath(bstrPrinterPath) {
        bstrPrinterPath := bstrPrinterPath is String ? BSTR.Alloc(bstrPrinterPath).Value : bstrPrinterPath

        result := ComCall(21, this, "ptr", bstrPrinterPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Model() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        bstrModel := bstrModel is String ? BSTR.Alloc(bstrModel).Value : bstrModel

        result := ComCall(23, this, "ptr", bstrModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Datatype() {
        retval := BSTR()
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDatatype 
     * @returns {HRESULT} 
     */
    put_Datatype(bstrDatatype) {
        bstrDatatype := bstrDatatype is String ? BSTR.Alloc(bstrDatatype).Value : bstrDatatype

        result := ComCall(25, this, "ptr", bstrDatatype, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrintProcessor() {
        retval := BSTR()
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrintProcessor 
     * @returns {HRESULT} 
     */
    put_PrintProcessor(bstrPrintProcessor) {
        bstrPrintProcessor := bstrPrintProcessor is String ? BSTR.Alloc(bstrPrintProcessor).Value : bstrPrintProcessor

        result := ComCall(27, this, "ptr", bstrPrintProcessor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(29, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        retval := BSTR()
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        bstrLocation := bstrLocation is String ? BSTR.Alloc(bstrLocation).Value : bstrLocation

        result := ComCall(31, this, "ptr", bstrLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartTime() {
        result := ComCall(32, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daStartTime 
     * @returns {HRESULT} 
     */
    put_StartTime(daStartTime) {
        result := ComCall(33, this, "double", daStartTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_UntilTime() {
        result := ComCall(34, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Float} daUntilTime 
     * @returns {HRESULT} 
     */
    put_UntilTime(daUntilTime) {
        result := ComCall(35, this, "double", daUntilTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultJobPriority() {
        result := ComCall(36, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnDefaultJobPriority 
     * @returns {HRESULT} 
     */
    put_DefaultJobPriority(lnDefaultJobPriority) {
        result := ComCall(37, this, "int", lnDefaultJobPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(38, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnPriority 
     * @returns {HRESULT} 
     */
    put_Priority(lnPriority) {
        result := ComCall(39, this, "int", lnPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_BannerPage() {
        retval := BSTR()
        result := ComCall(40, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrBannerPage 
     * @returns {HRESULT} 
     */
    put_BannerPage(bstrBannerPage) {
        bstrBannerPage := bstrBannerPage is String ? BSTR.Alloc(bstrBannerPage).Value : bstrBannerPage

        result := ComCall(41, this, "ptr", bstrBannerPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PrintDevices() {
        retval := VARIANT()
        result := ComCall(42, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPrintDevices 
     * @returns {HRESULT} 
     */
    put_PrintDevices(vPrintDevices) {
        result := ComCall(43, this, "ptr", vPrintDevices, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NetAddresses() {
        retval := VARIANT()
        result := ComCall(44, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(45, this, "ptr", vNetAddresses, "HRESULT")
        return result
    }
}
