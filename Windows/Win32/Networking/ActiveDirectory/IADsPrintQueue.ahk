#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsPrintQueue interface represents a printer on a network.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsprintqueue
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPrintQueue extends IADs {
    /**
     * The interface identifier for IADsPrintQueue
     * @type {Guid}
     */
    static IID := Guid("{b15160d0-1226-11cf-a985-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPrintQueue interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_PrinterPath        : IntPtr
        put_PrinterPath        : IntPtr
        get_Model              : IntPtr
        put_Model              : IntPtr
        get_Datatype           : IntPtr
        put_Datatype           : IntPtr
        get_PrintProcessor     : IntPtr
        put_PrintProcessor     : IntPtr
        get_Description        : IntPtr
        put_Description        : IntPtr
        get_Location           : IntPtr
        put_Location           : IntPtr
        get_StartTime          : IntPtr
        put_StartTime          : IntPtr
        get_UntilTime          : IntPtr
        put_UntilTime          : IntPtr
        get_DefaultJobPriority : IntPtr
        put_DefaultJobPriority : IntPtr
        get_Priority           : IntPtr
        put_Priority           : IntPtr
        get_BannerPage         : IntPtr
        put_BannerPage         : IntPtr
        get_PrintDevices       : IntPtr
        put_PrintDevices       : IntPtr
        get_NetAddresses       : IntPtr
        put_NetAddresses       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPrintQueue.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    PrinterPath {
        get => this.get_PrinterPath()
        set => this.put_PrinterPath(value)
    }

    /**
     * @type {BSTR} 
     */
    Model {
        get => this.get_Model()
        set => this.put_Model(value)
    }

    /**
     * @type {BSTR} 
     */
    Datatype {
        get => this.get_Datatype()
        set => this.put_Datatype(value)
    }

    /**
     * @type {BSTR} 
     */
    PrintProcessor {
        get => this.get_PrintProcessor()
        set => this.put_PrintProcessor(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {Float} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {Float} 
     */
    UntilTime {
        get => this.get_UntilTime()
        set => this.put_UntilTime(value)
    }

    /**
     * @type {Integer} 
     */
    DefaultJobPriority {
        get => this.get_DefaultJobPriority()
        set => this.put_DefaultJobPriority(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {BSTR} 
     */
    BannerPage {
        get => this.get_BannerPage()
        set => this.put_BannerPage(value)
    }

    /**
     * @type {VARIANT} 
     */
    PrintDevices {
        get => this.get_PrintDevices()
        set => this.put_PrintDevices(value)
    }

    /**
     * @type {VARIANT} 
     */
    NetAddresses {
        get => this.get_NetAddresses()
        set => this.put_NetAddresses(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrinterPath() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrinterPath 
     * @returns {HRESULT} 
     */
    put_PrinterPath(bstrPrinterPath) {
        bstrPrinterPath := bstrPrinterPath is String ? BSTR.Alloc(bstrPrinterPath).Value : bstrPrinterPath

        result := ComCall(21, this, BSTR, bstrPrinterPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Model() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        bstrModel := bstrModel is String ? BSTR.Alloc(bstrModel).Value : bstrModel

        result := ComCall(23, this, BSTR, bstrModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Datatype() {
        retval := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDatatype 
     * @returns {HRESULT} 
     */
    put_Datatype(bstrDatatype) {
        bstrDatatype := bstrDatatype is String ? BSTR.Alloc(bstrDatatype).Value : bstrDatatype

        result := ComCall(25, this, BSTR, bstrDatatype, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrintProcessor() {
        retval := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrintProcessor 
     * @returns {HRESULT} 
     */
    put_PrintProcessor(bstrPrintProcessor) {
        bstrPrintProcessor := bstrPrintProcessor is String ? BSTR.Alloc(bstrPrintProcessor).Value : bstrPrintProcessor

        result := ComCall(27, this, BSTR, bstrPrintProcessor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(29, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        retval := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        bstrLocation := bstrLocation is String ? BSTR.Alloc(bstrLocation).Value : bstrLocation

        result := ComCall(31, this, BSTR, bstrLocation, "HRESULT")
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
        retval := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrBannerPage 
     * @returns {HRESULT} 
     */
    put_BannerPage(bstrBannerPage) {
        bstrBannerPage := bstrBannerPage is String ? BSTR.Alloc(bstrBannerPage).Value : bstrBannerPage

        result := ComCall(41, this, BSTR, bstrBannerPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PrintDevices() {
        retval := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPrintDevices 
     * @returns {HRESULT} 
     */
    put_PrintDevices(vPrintDevices) {
        result := ComCall(43, this, VARIANT, vPrintDevices, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NetAddresses() {
        retval := VARIANT()
        result := ComCall(44, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(45, this, VARIANT, vNetAddresses, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPrintQueue.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PrinterPath := CallbackCreate(GetMethod(implObj, "get_PrinterPath"), flags, 2)
        this.vtbl.put_PrinterPath := CallbackCreate(GetMethod(implObj, "put_PrinterPath"), flags, 2)
        this.vtbl.get_Model := CallbackCreate(GetMethod(implObj, "get_Model"), flags, 2)
        this.vtbl.put_Model := CallbackCreate(GetMethod(implObj, "put_Model"), flags, 2)
        this.vtbl.get_Datatype := CallbackCreate(GetMethod(implObj, "get_Datatype"), flags, 2)
        this.vtbl.put_Datatype := CallbackCreate(GetMethod(implObj, "put_Datatype"), flags, 2)
        this.vtbl.get_PrintProcessor := CallbackCreate(GetMethod(implObj, "get_PrintProcessor"), flags, 2)
        this.vtbl.put_PrintProcessor := CallbackCreate(GetMethod(implObj, "put_PrintProcessor"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Location := CallbackCreate(GetMethod(implObj, "get_Location"), flags, 2)
        this.vtbl.put_Location := CallbackCreate(GetMethod(implObj, "put_Location"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
        this.vtbl.get_UntilTime := CallbackCreate(GetMethod(implObj, "get_UntilTime"), flags, 2)
        this.vtbl.put_UntilTime := CallbackCreate(GetMethod(implObj, "put_UntilTime"), flags, 2)
        this.vtbl.get_DefaultJobPriority := CallbackCreate(GetMethod(implObj, "get_DefaultJobPriority"), flags, 2)
        this.vtbl.put_DefaultJobPriority := CallbackCreate(GetMethod(implObj, "put_DefaultJobPriority"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_BannerPage := CallbackCreate(GetMethod(implObj, "get_BannerPage"), flags, 2)
        this.vtbl.put_BannerPage := CallbackCreate(GetMethod(implObj, "put_BannerPage"), flags, 2)
        this.vtbl.get_PrintDevices := CallbackCreate(GetMethod(implObj, "get_PrintDevices"), flags, 2)
        this.vtbl.put_PrintDevices := CallbackCreate(GetMethod(implObj, "put_PrintDevices"), flags, 2)
        this.vtbl.get_NetAddresses := CallbackCreate(GetMethod(implObj, "get_NetAddresses"), flags, 2)
        this.vtbl.put_NetAddresses := CallbackCreate(GetMethod(implObj, "put_NetAddresses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PrinterPath)
        CallbackFree(this.vtbl.put_PrinterPath)
        CallbackFree(this.vtbl.get_Model)
        CallbackFree(this.vtbl.put_Model)
        CallbackFree(this.vtbl.get_Datatype)
        CallbackFree(this.vtbl.put_Datatype)
        CallbackFree(this.vtbl.get_PrintProcessor)
        CallbackFree(this.vtbl.put_PrintProcessor)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Location)
        CallbackFree(this.vtbl.put_Location)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
        CallbackFree(this.vtbl.get_UntilTime)
        CallbackFree(this.vtbl.put_UntilTime)
        CallbackFree(this.vtbl.get_DefaultJobPriority)
        CallbackFree(this.vtbl.put_DefaultJobPriority)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_BannerPage)
        CallbackFree(this.vtbl.put_BannerPage)
        CallbackFree(this.vtbl.get_PrintDevices)
        CallbackFree(this.vtbl.put_PrintDevices)
        CallbackFree(this.vtbl.get_NetAddresses)
        CallbackFree(this.vtbl.put_NetAddresses)
    }
}
