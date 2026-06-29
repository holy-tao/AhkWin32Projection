#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implements methods that get data from a Digital Video Broadcast (DVB) data broadcast ID descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbdatabroadcastiddescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbDataBroadcastIDDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbDataBroadcastIDDescriptor
     * @type {Guid}
     */
    static IID := Guid("{5f26f518-65c8-4048-91f2-9290f59f7b90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbDataBroadcastIDDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag             : IntPtr
        GetLength          : IntPtr
        GetDataBroadcastID : IntPtr
        GetIDSelectorBytes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbDataBroadcastIDDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the tag that identifies a Digital Video Broadcast (DVB) data broadcast ID descriptor.
     * @returns {Integer} Receives the descriptor tag. For data broadcast ID descriptors, this value is 0x66.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastiddescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the length (in bytes) of a Digital Video Broadcast (DVB) data broadcast ID descriptor.
     * @returns {Integer} Receives the descriptor length.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastiddescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the identifier that identifies the network broadcast from a Digital Video Broadcast (DVB) data broadcast descriptor.
     * @returns {Integer} Receives the broadcaster ID.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastiddescriptor-getdatabroadcastid
     */
    GetDataBroadcastID() {
        result := ComCall(5, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the data from the selector in a Digital Video Broadcast (DVB) data broadcast ID descriptor. The selector is defined by the broadcast standard for the network.
     * @param {Pointer<Integer>} pbLen Specifies or gets the number of selector bytes for this descriptor.
     * @returns {Integer} Receives the selector bytes.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbdatabroadcastiddescriptor-getidselectorbytes
     */
    GetIDSelectorBytes(pbLen) {
        pbLenMarshal := pbLen is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pbLenMarshal, pbLen, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDvbDataBroadcastIDDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetDataBroadcastID := CallbackCreate(GetMethod(implObj, "GetDataBroadcastID"), flags, 2)
        this.vtbl.GetIDSelectorBytes := CallbackCreate(GetMethod(implObj, "GetIDSelectorBytes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetDataBroadcastID)
        CallbackFree(this.vtbl.GetIDSelectorBytes)
    }
}
