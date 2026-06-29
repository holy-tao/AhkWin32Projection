#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDVB_SDT.ahk" { IDVB_SDT }

/**
 * Implements methods that get information from an Integrated Services Digital Broadcasting (ISDB) service description table (SDT). An SDT lists the names and other parameters of the services in an MPEG-2 transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nn-dvbsiparser-iisdb_sdt
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IISDB_SDT extends IDVB_SDT {
    /**
     * The interface identifier for IISDB_SDT
     * @type {Guid}
     */
    static IID := Guid("{3f3dc9a2-bb32-4fb9-ae9e-d856848927a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IISDB_SDT interfaces
    */
    struct Vtbl extends IDVB_SDT.Vtbl {
        GetRecordEITUserDefinedFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IISDB_SDT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the EIT_user_defined_flags field value from a service descriptor in an Integrated Services Digital Broadcasting (ISDB) service description table (SDT).
     * @param {Integer} dwRecordIndex Specifies the record number,
     *   indexed from zero. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-idvb_sdt-getcountofrecords">IDVB_SDT::GetCountOfRecords</a> method to get the number of records in the SDT.
     * @returns {Integer} Receives the EIT_user_defined_flags field value.
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdb_sdt-getrecordeituserdefinedflags
     */
    GetRecordEITUserDefinedFlags(dwRecordIndex) {
        result := ComCall(21, this, "uint", dwRecordIndex, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IISDB_SDT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRecordEITUserDefinedFlags := CallbackCreate(GetMethod(implObj, "GetRecordEITUserDefinedFlags"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRecordEITUserDefinedFlags)
    }
}
