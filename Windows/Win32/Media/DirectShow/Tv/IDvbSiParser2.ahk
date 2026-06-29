#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDvbSiParser.ahk" { IDvbSiParser }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDVB_EIT2.ahk" { IDVB_EIT2 }

/**
 * The IDvbSiParser2 interface retrieves program specific information (PSI) and service information (SI) tables from a DVB transport stream.
 * @remarks
 * To get a pointer to this interface, call <b>CoCreateInstance</b>. Use the following CLSID:
 * 
 * 
 * ```cpp
 * F6B96EDA-1A94-4476-A85F-4D3DC7B39C3F
 * ```
 * 
 * 
 * This CLSID is not is not published in an SDK header; define a new GUID constant in your application.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-idvbsiparser2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbSiParser2 extends IDvbSiParser {
    /**
     * The interface identifier for IDvbSiParser2
     * @type {Guid}
     */
    static IID := Guid("{0ac5525f-f816-42f4-93ba-4c0f32f46e54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbSiParser2 interfaces
    */
    struct Vtbl extends IDvbSiParser.Vtbl {
        GetEIT2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbSiParser2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * .
     * @remarks
     * The method fails if the filter does not receive a matching table within a predetermined length of time.
     * @param {Integer} tableId 
     * @param {Pointer<Integer>} pwServiceId An optional parameter that contains a service identifier. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} pbSegment An optional parameter that contains a segment number. You can use this value to filter the request. Otherwise, set this parameter to <b>NULL</b>.
     * @returns {IDVB_EIT2} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nn-dvbsiparser-idvb_eit2">IDVB_EIT2</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-idvbsiparser2-geteit2
     */
    GetEIT2(tableId, pwServiceId, pbSegment) {
        pwServiceIdMarshal := pwServiceId is VarRef ? "ushort*" : "ptr"
        pbSegmentMarshal := pbSegment is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "char", tableId, pwServiceIdMarshal, pwServiceId, pbSegmentMarshal, pbSegment, "ptr*", &ppEIT := 0, "HRESULT")
        return IDVB_EIT2(ppEIT)
    }

    Query(iid) {
        if (IDvbSiParser2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEIT2 := CallbackCreate(GetMethod(implObj, "GetEIT2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEIT2)
    }
}
