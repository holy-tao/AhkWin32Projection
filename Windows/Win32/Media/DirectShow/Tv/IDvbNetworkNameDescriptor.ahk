#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DVB_STRCONV_MODE.ahk" { DVB_STRCONV_MODE }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) network name descriptor. The network name descriptor gets text format information about the network that originated the broadcast.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbnetworknamedescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbNetworkNameDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbNetworkNameDescriptor
     * @type {Guid}
     */
    static IID := Guid("{5b2a80cf-35b9-446c-b3e4-048b761dbc51}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbNetworkNameDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag          : IntPtr
        GetLength       : IntPtr
        GetNetworkName  : IntPtr
        GetNetworkNameW : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbNetworkNameDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Integer} Receives the identifier tag. For DVB network name descriptors, this value is "0x40".
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Integer} Receives the descriptor length, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the network name, in ASCII string format, from a Digital Video Broadcast (DVB) network name descriptor.
     * @returns {Pointer<Integer>} Pointer to a buffer that receives the network name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getnetworkname
     */
    GetNetworkName() {
        result := ComCall(5, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Gets the network name, in Unicode string format, from a Digital Video Broadcast (DVB) network name descriptor.
     * @param {DVB_STRCONV_MODE} convMode 
     * @returns {BSTR} Pointer to a string buffer that receives the network name. The caller is responsible for freeing this memory.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbnetworknamedescriptor-getnetworknamew
     */
    GetNetworkNameW(convMode) {
        pbstrName := BSTR.Owned()
        result := ComCall(6, this, DVB_STRCONV_MODE, convMode, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    Query(iid) {
        if (IDvbNetworkNameDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetNetworkName := CallbackCreate(GetMethod(implObj, "GetNetworkName"), flags, 2)
        this.vtbl.GetNetworkNameW := CallbackCreate(GetMethod(implObj, "GetNetworkNameW"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetNetworkName)
        CallbackFree(this.vtbl.GetNetworkNameW)
    }
}
