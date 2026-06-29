#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMpeg2TableFilter interface controls which tables are parsed by the MPEG-2 Sections and Tables filter. The BDA MPEG-2 Transport Information filter exposes this interface on its output pins.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2TableFilter)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nn-mpeg2data-impeg2tablefilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMpeg2TableFilter extends IUnknown {
    /**
     * The interface identifier for IMpeg2TableFilter
     * @type {Guid}
     */
    static IID := Guid("{bdcdd913-9ecd-4fb2-81ae-adf747ea75a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMpeg2TableFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPID          : IntPtr
        AddTable        : IntPtr
        AddExtension    : IntPtr
        RemovePID       : IntPtr
        RemoveTable     : IntPtr
        RemoveExtension : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMpeg2TableFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The AddPID method adds a packet identifier (PID) to the list of PIDs that the filter sends.
     * @param {Integer} p Specifies the PID of the transport stream packets to examine.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addpid
     */
    AddPID(p) {
        result := ComCall(3, this, "ushort", p, "HRESULT")
        return result
    }

    /**
     * The AddTable method adds a table identifier (TID) to the list of MPEG-2 table sections that the filter sends.
     * @param {Integer} p Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} t Specifies the TID of the section to retrieve.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addtable
     */
    AddTable(p, t) {
        result := ComCall(4, this, "ushort", p, "char", t, "HRESULT")
        return result
    }

    /**
     * The AddExtension method adds a table extension to the list of MPEG-2 table sections that the filter sends.
     * @param {Integer} p Specifies the packet identifier (PID) of the transport stream packets to examine.
     * @param {Integer} t Specifies the table identifier (TID) of the section to retrieve.
     * @param {Integer} e Specifies the table_extension identifier of the section to retrieve.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addextension
     */
    AddExtension(p, t, e) {
        result := ComCall(5, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }

    /**
     * The RemovePID method removes a packet identifier (PID) from the list of PIDs that the filter sends.
     * @param {Integer} p Specifies the PID to remove from the list.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removepid
     */
    RemovePID(p) {
        result := ComCall(6, this, "ushort", p, "HRESULT")
        return result
    }

    /**
     * The RemoveTable method removes a table identifier (TID) from the list of MPEG-2 table sections that the filter sends.
     * @param {Integer} p Specifies the packet identifier (PID) of the table.
     * @param {Integer} t Specifies the TID to remove from the list.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removetable
     */
    RemoveTable(p, t) {
        result := ComCall(7, this, "ushort", p, "char", t, "HRESULT")
        return result
    }

    /**
     * The RemoveExtension method removes a table extension from the list of MPEG-2 table sections that the filter sends.
     * @param {Integer} p Specifies the packet identifier (PID) of the table.
     * @param {Integer} t Specifies the table identifier (TID) of the table.
     * @param {Integer} e Specifies the table_extension identifier to remove from the list.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removeextension
     */
    RemoveExtension(p, t, e) {
        result := ComCall(8, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMpeg2TableFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPID := CallbackCreate(GetMethod(implObj, "AddPID"), flags, 2)
        this.vtbl.AddTable := CallbackCreate(GetMethod(implObj, "AddTable"), flags, 3)
        this.vtbl.AddExtension := CallbackCreate(GetMethod(implObj, "AddExtension"), flags, 4)
        this.vtbl.RemovePID := CallbackCreate(GetMethod(implObj, "RemovePID"), flags, 2)
        this.vtbl.RemoveTable := CallbackCreate(GetMethod(implObj, "RemoveTable"), flags, 3)
        this.vtbl.RemoveExtension := CallbackCreate(GetMethod(implObj, "RemoveExtension"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPID)
        CallbackFree(this.vtbl.AddTable)
        CallbackFree(this.vtbl.AddExtension)
        CallbackFree(this.vtbl.RemovePID)
        CallbackFree(this.vtbl.RemoveTable)
        CallbackFree(this.vtbl.RemoveExtension)
    }
}
