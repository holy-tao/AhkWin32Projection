#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPBDA_EIT.ahk" { IPBDA_EIT }
#Import ".\IPBDA_Services.ahk" { IPBDA_Services }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that retrieve program and system information protocol (PSIP) and service information (SI) tables from a Protected Broadcast Driver Architecture (PBDA) transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-ipbdasiparser
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPBDASiParser extends IUnknown {
    /**
     * The interface identifier for IPBDASiParser
     * @type {Guid}
     */
    static IID := Guid("{9de49a74-aba2-4a18-93e1-21f17f95c3c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPBDASiParser interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize  : IntPtr
        GetEIT      : IntPtr
        GetServices : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPBDASiParser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes a program and system information protocol (PSIP) parser for a Protected Broadcast Driver Architecture (PBDA) transport stream.
     * @param {IUnknown} punk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the new object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdasiparser-initialize
     */
    Initialize(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * Gets the event information table (EIT) from the program and system information protocol (PSIP) tables in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwSize Reserved. Set to zero.
     * @param {Pointer<Integer>} pBuffer Reserved. Set to <b>NULL</b>.
     * @returns {IPBDA_EIT} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-ipbda_eit">IPBDA_EIT</a> interface.  The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdasiparser-geteit
     */
    GetEIT(dwSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", &ppEIT := 0, "HRESULT")
        return IPBDA_EIT(ppEIT)
    }

    /**
     * Retrieves a list of services from the program and system information protocol (PSIP) tables in a Protected Broadcast Device Architecture (PBDA) transport stream.
     * @param {Integer} dwSize Size of the buffer that receives the service list, in bytes.
     * @param {Pointer<Integer>} pBuffer Receives the buffer for services.
     * @returns {IPBDA_Services} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-ipbda_services">IPBDA_Services</a> interface pointer.  The caller must release this interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-ipbdasiparser-getservices
     */
    GetServices(dwSize, pBuffer) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", dwSize, pBufferMarshal, pBuffer, "ptr*", &ppServices := 0, "HRESULT")
        return IPBDA_Services(ppServices)
    }

    Query(iid) {
        if (IPBDASiParser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.GetEIT := CallbackCreate(GetMethod(implObj, "GetEIT"), flags, 4)
        this.vtbl.GetServices := CallbackCreate(GetMethod(implObj, "GetServices"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetEIT)
        CallbackFree(this.vtbl.GetServices)
    }
}
