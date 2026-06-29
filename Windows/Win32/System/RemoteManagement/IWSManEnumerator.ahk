#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents a stream of results returned from operations such as a WS-Management protocol WS-Enumeration:Enumerate operation.
 * @remarks
 * The corresponding scripting object is <a href="https://docs.microsoft.com/windows/desktop/WinRM/enumerator">Enumerator</a>.
 * 
 * To limit the number of items that are read, set the <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmansession-get_batchitems">IWSManSession::BatchItems</a> property.
 * 
 * Be aware that freeing the enumeration object clears pending enumeration requests.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanenumerator
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManEnumerator extends IDispatch {
    /**
     * The interface identifier for IWSManEnumerator
     * @type {Guid}
     */
    static IID := Guid("{f3457ca9-abb9-4fa5-b850-90e8ca300e7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManEnumerator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ReadItem          : IntPtr
        get_AtEndOfStream : IntPtr
        get_Error         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AtEndOfStream {
        get => this.get_AtEndOfStream()
    }

    /**
     * @type {BSTR} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Retrieves an item from the resource and returns an XML representation of the item.
     * @remarks
     * To start an enumeration, use <a href="https://docs.microsoft.com/windows/desktop/api/wsmandisp/nf-wsmandisp-iwsmansession-enumerate">IWSManSession.Enumerate</a>. To perform a WS-Eventing:Pull operation that continues reading items in the enumeration, use <b>IWSManEnumerator.ReadItem</b>.
     * 
     * To limit the number of items that are read, set the <a href="https://docs.microsoft.com/windows/desktop/WinRM/session-batchitems">Session.BatchItems</a> property.
     * 
     * Be aware that freeing the enumeration object clears pending enumeration requests.
     * @returns {BSTR} The XML representation of the item.
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-readitem
     */
    ReadItem() {
        resource := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, resource, "HRESULT")
        return resource
    }

    /**
     * Indicates that the end of items in the IWSManEnumerator object has been reached by calls to IWSManEnumerator::ReadItem.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-get_atendofstream
     */
    get_AtEndOfStream() {
        result := ComCall(8, this, VARIANT_BOOL.Ptr, &eos := 0, "HRESULT")
        return eos
    }

    /**
     * Gets an XML representation of additional error information. (IWSManEnumerator.get_Error)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanenumerator-get_error
     */
    get_Error() {
        value := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWSManEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadItem := CallbackCreate(GetMethod(implObj, "ReadItem"), flags, 2)
        this.vtbl.get_AtEndOfStream := CallbackCreate(GetMethod(implObj, "get_AtEndOfStream"), flags, 2)
        this.vtbl.get_Error := CallbackCreate(GetMethod(implObj, "get_Error"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadItem)
        CallbackFree(this.vtbl.get_AtEndOfStream)
        CallbackFree(this.vtbl.get_Error)
    }
}
