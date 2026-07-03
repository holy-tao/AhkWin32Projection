#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdbhierarchicaltransmissiondescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IIsdbHierarchicalTransmissionDescriptor extends IUnknown {
    /**
     * The interface identifier for IIsdbHierarchicalTransmissionDescriptor
     * @type {Guid}
     */
    static IID := Guid("{b7b3ae90-ee0b-446d-8769-f7e2aa266aa6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIsdbHierarchicalTransmissionDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag          : IntPtr
        GetLength       : IntPtr
        GetFutureUse1   : IntPtr
        GetQualityLevel : IntPtr
        GetFutureUse2   : IntPtr
        GetReferencePid : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIsdbHierarchicalTransmissionDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a hierarchical transmission descriptor.
     * @returns {Integer} Receives the tag value. For hierarchical transmission descriptors, this value is 0xC0.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the 7-bit reserved_future_use field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
     * @returns {Integer} Receives the 7-bit reserved_future_use field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getfutureuse1
     */
    GetFutureUse1() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the quality_flag field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor. This field indicates the quality level of the hierarchical stream construction.
     * @returns {Integer} Receives the quality_flag field value. A value of 1 indicates a high-quality stream; a value of 0 indicates a low-quality stream.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getqualitylevel
     */
    GetQualityLevel() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the 3-bit reserved_future_use field from an Integrated Services Digital Broadcasting (ISDB) hierarchical transmission descriptor.
     * @returns {Integer} Receives the 3-bit reserved_future_use field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getfutureuse2
     */
    GetFutureUse2() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the program ID (PID) of the primary hierarchical stream from a hierarchical transmission descriptor.
     * @returns {Integer} Receives the PID value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbhierarchicaltransmissiondescriptor-getreferencepid
     */
    GetReferencePid() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    Query(iid) {
        if (IIsdbHierarchicalTransmissionDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetFutureUse1 := CallbackCreate(GetMethod(implObj, "GetFutureUse1"), flags, 2)
        this.vtbl.GetQualityLevel := CallbackCreate(GetMethod(implObj, "GetQualityLevel"), flags, 2)
        this.vtbl.GetFutureUse2 := CallbackCreate(GetMethod(implObj, "GetFutureUse2"), flags, 2)
        this.vtbl.GetReferencePid := CallbackCreate(GetMethod(implObj, "GetReferencePid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetFutureUse1)
        CallbackFree(this.vtbl.GetQualityLevel)
        CallbackFree(this.vtbl.GetFutureUse2)
        CallbackFree(this.vtbl.GetReferencePid)
    }
}
