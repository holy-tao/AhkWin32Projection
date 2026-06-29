#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) private data descriptor. The private data descriptor describes broadcaster-specific data that is not part of the official MPEG-2 standard for broadcast streams.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbprivatedataspecifierdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbPrivateDataSpecifierDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbPrivateDataSpecifierDescriptor
     * @type {Guid}
     */
    static IID := Guid("{5660a019-e75a-4b82-9b4c-ed2256d165a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbPrivateDataSpecifierDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                  : IntPtr
        GetLength               : IntPtr
        GetPrivateDataSpecifier : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbPrivateDataSpecifierDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) private data descriptor.
     * @returns {Integer} Receives the private descriptor identifier tag. For private data descriptors, this value is 0x5F.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) private data descriptor.
     * @returns {Integer} Receives the private data descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the data from a Digital Video Broadcast (DVB) private data descriptor.
     * @returns {Integer} Receives the private descriptor specifier data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbprivatedataspecifierdescriptor-getprivatedataspecifier
     */
    GetPrivateDataSpecifier() {
        result := ComCall(5, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    Query(iid) {
        if (IDvbPrivateDataSpecifierDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetPrivateDataSpecifier := CallbackCreate(GetMethod(implObj, "GetPrivateDataSpecifier"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetPrivateDataSpecifier)
    }
}
