#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from the default authority descriptor for a content reference identifier (CRID). The default authority descriptor is the first part of the CRID and identifies the body that created the CRID.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbdefaultauthoritydescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbDefaultAuthorityDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbDefaultAuthorityDescriptor
     * @type {Guid}
     */
    static IID := Guid("{05ec24d1-3a31-44e7-b408-67c60a352276}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbDefaultAuthorityDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag              : IntPtr
        GetLength           : IntPtr
        GetDefaultAuthority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbDefaultAuthorityDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag from the default authority descriptor for a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @returns {Integer} Receives the content descriptor tag. For default authority descriptors, this tag value is "0x73".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a default authority descriptor from a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @returns {Integer} Receives the number of bytes in the descriptor.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the string identifying the default authority from a Digital Video Broadcast (DVB) content reference identifier (CRID).
     * @param {Pointer<Integer>} pbLength Receives the length of the default authority string in bytes.
     * @param {Pointer<Pointer<Integer>>} ppbBytes Pointer to a buffer that receives the default authority string. The caller is responsible for releasing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdefaultauthoritydescriptor-getdefaultauthority
     */
    GetDefaultAuthority(pbLength, ppbBytes) {
        pbLengthMarshal := pbLength is VarRef ? "char*" : "ptr"
        ppbBytesMarshal := ppbBytes is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pbLengthMarshal, pbLength, ppbBytesMarshal, ppbBytes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDvbDefaultAuthorityDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetDefaultAuthority := CallbackCreate(GetMethod(implObj, "GetDefaultAuthority"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetDefaultAuthority)
    }
}
