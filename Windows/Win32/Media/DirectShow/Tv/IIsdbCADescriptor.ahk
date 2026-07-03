#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) conditional access (CA) descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbcadescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbCADescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbCADescriptor
     * @type {Guid}
     */
    static IID := Guid("{0570aa47-52bc-42ae-8ca5-969f41e81aea}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbCADescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag              : IntPtr
        GetLength           : IntPtr
        GetCASystemId       : IntPtr
        GetReservedBits     : IntPtr
        GetCAPID            : IntPtr
        GetPrivateDataBytes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbCADescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a conditional access (CA) descriptor.
     * @returns {Integer} Receives the tag value. For conditional access descriptors, this value is 0x09.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a conditional access (CA) descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) system identifier from a conditional access descriptor.
     * @returns {Integer} Receives the conditional access system identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getcasystemid
     */
    GetCASystemId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the reserved bits from a conditional access (CA) descriptor.
     * @returns {Integer} Receives the reserved bits.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getreservedbits
     */
    GetReservedBits() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the conditional access (CA) program identifier (PID) from a conditional access descriptor.
     * @returns {Integer} Receives the conditional access PID value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getcapid
     */
    GetCAPID() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the private data bytes from a conditional access (CA) descriptor.
     * @param {Pointer<Integer>} pbBufferLength On input, specifies the length of the private data being retrieved, in bytes. On output, returns the actual data length.
     * @returns {Integer} Receives the conditional access private data.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbcadescriptor-getprivatedatabytes
     */
    GetPrivateDataBytes(pbBufferLength) {
        pbBufferLengthMarshal := pbBufferLength is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, pbBufferLengthMarshal, pbBufferLength, "char*", &pbBuffer := 0, "HRESULT")
        return pbBuffer
    }

    Query(iid) {
        if (IIsdbCADescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetCASystemId := CallbackCreate(GetMethod(implObj, "GetCASystemId"), flags, 2)
        this.vtbl.GetReservedBits := CallbackCreate(GetMethod(implObj, "GetReservedBits"), flags, 2)
        this.vtbl.GetCAPID := CallbackCreate(GetMethod(implObj, "GetCAPID"), flags, 2)
        this.vtbl.GetPrivateDataBytes := CallbackCreate(GetMethod(implObj, "GetPrivateDataBytes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCASystemId)
        CallbackFree(this.vtbl.GetReservedBits)
        CallbackFree(this.vtbl.GetCAPID)
        CallbackFree(this.vtbl.GetPrivateDataBytes)
    }
}
