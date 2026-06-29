#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets an MPEG-2 program specific information (PSI) table from an MPEG-2 transport stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nn-mpeg2psiparser-ipsitables
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IPSITables extends IUnknown {
    /**
     * The interface identifier for IPSITables
     * @type {Guid}
     */
    static IID := Guid("{919f24c5-7b14-42ac-a4b0-2ae08daf00ac}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPSITables interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTable : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPSITables.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an MPEG-2 Program Specific Information (PSI) table from an MPEG-2 transport stream. The table that is returned and its contents depend on the values of the three input parameters to this method.
     * @param {Integer} dwTSID Transport stream identifier (TSID) for the table that is retrieved (bytes 0 - 15) and the original network ID (ONID) for an Event Information Table (EIT) that is retrieved (bytes 16 - 31).
     * @param {Integer} dwTID_PID Table identifier (TID) or the program ID (PID) that identifies the transport stream packet.
     * @param {Integer} dwHashedVer Hash value that identifies the table contents.
     * @param {Integer} dwPara4 PID for a Program Mapping Table or the service ID (SID) for an EIT. Otherwise, not used.
     * @returns {IUnknown} Pointer to  the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the table object that is retrieved. The caller is responsible for freeing the memory.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2psiparser/nf-mpeg2psiparser-ipsitables-gettable
     */
    GetTable(dwTSID, dwTID_PID, dwHashedVer, dwPara4) {
        result := ComCall(3, this, "uint", dwTSID, "uint", dwTID_PID, "uint", dwHashedVer, "uint", dwPara4, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    Query(iid) {
        if (IPSITables.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTable := CallbackCreate(GetMethod(implObj, "GetTable"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTable)
    }
}
