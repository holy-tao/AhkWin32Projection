#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IMpeg2TableFilter interface controls which tables are parsed by the MPEG-2 Sections and Tables filter. The BDA MPEG-2 Transport Information filter exposes this interface on its output pins.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMpeg2TableFilter)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nn-mpeg2data-impeg2tablefilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMpeg2TableFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2TableFilter
     * @type {Guid}
     */
    static IID => Guid("{bdcdd913-9ecd-4fb2-81ae-adf747ea75a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPID", "AddTable", "AddExtension", "RemovePID", "RemoveTable", "RemoveExtension"]

    /**
     * The AddPID method adds a packet identifier (PID) to the list of PIDs that the filter sends.
     * @param {Integer} p Specifies the PID of the transport stream packets to examine.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-addpid
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-addtable
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-addextension
     */
    AddExtension(p, t, e) {
        result := ComCall(5, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }

    /**
     * The RemovePID method removes a packet identifier (PID) from the list of PIDs that the filter sends.
     * @param {Integer} p Specifies the PID to remove from the list.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-removepid
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-removetable
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
     * @see https://docs.microsoft.com/windows/win32/api//mpeg2data/nf-mpeg2data-impeg2tablefilter-removeextension
     */
    RemoveExtension(p, t, e) {
        result := ComCall(8, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }
}
