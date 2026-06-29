#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods that get data from a Digital Video Broadcast (DVB) linkage descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvblinkagedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbLinkageDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbLinkageDescriptor
     * @type {Guid}
     */
    static IID := Guid("{1cdf8b31-994a-46fc-acfd-6a6be8934dd5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbLinkageDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag               : IntPtr
        GetLength            : IntPtr
        GetTSId              : IntPtr
        GetONId              : IntPtr
        GetServiceId         : IntPtr
        GetLinkageType       : IntPtr
        GetPrivateDataLength : IntPtr
        GetPrivateData       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbLinkageDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB linkage descriptors, this value is "0x4A".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier of the transport stream containing the information service from a DVB linkage descriptor.
     * @returns {Integer} Receives the transport stream identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-gettsid
     */
    GetTSId() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the network identifier of the broadcast system that originated an information service from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the network identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getonid
     */
    GetONId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the identifier that identifies an information service in a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the service identifier.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getserviceid
     */
    GetServiceId() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets a code that uniquely identifies the linkage type from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the linkage type code. For a list of linkage type codes, see Table 58 in Section 6.2.19 of the <i>DVB Specification for Service Information (SI) in DVB
     * systems
     * DVB (Document A038 Rev. 4)</i>.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getlinkagetype
     */
    GetLinkageType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length of the private data field from a Digital Video Broadcast (DVB) linkage descriptor.
     * @returns {Integer} Receives the length of the private data field, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedatalength
     */
    GetPrivateDataLength() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the private data from a Digital Video Broadcast (DVB) linkage descriptor.
     * @param {Pointer<Integer>} pbLen On input, specifies the size of the buffer (pointed to by the <i>pbData</i> parameter) allocated for the private data, in bytes. On output, gets the actual length of the private  data that is received.
     * @returns {Integer} Receives private data from the DVB linkage descriptor.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvblinkagedescriptor-getprivatedata
     */
    GetPrivateData(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbLenMarshal, pbLen, "char*", &pbData := 0, "HRESULT")
        return pbData
    }

    Query(iid) {
        if (IDvbLinkageDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetTSId := CallbackCreate(GetMethod(implObj, "GetTSId"), flags, 2)
        this.vtbl.GetONId := CallbackCreate(GetMethod(implObj, "GetONId"), flags, 2)
        this.vtbl.GetServiceId := CallbackCreate(GetMethod(implObj, "GetServiceId"), flags, 2)
        this.vtbl.GetLinkageType := CallbackCreate(GetMethod(implObj, "GetLinkageType"), flags, 2)
        this.vtbl.GetPrivateDataLength := CallbackCreate(GetMethod(implObj, "GetPrivateDataLength"), flags, 2)
        this.vtbl.GetPrivateData := CallbackCreate(GetMethod(implObj, "GetPrivateData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetTSId)
        CallbackFree(this.vtbl.GetONId)
        CallbackFree(this.vtbl.GetServiceId)
        CallbackFree(this.vtbl.GetLinkageType)
        CallbackFree(this.vtbl.GetPrivateDataLength)
        CallbackFree(this.vtbl.GetPrivateData)
    }
}
