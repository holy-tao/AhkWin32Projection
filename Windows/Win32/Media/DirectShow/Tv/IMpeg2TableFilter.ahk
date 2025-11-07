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
     * 
     * @param {Integer} p 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addpid
     */
    AddPID(p) {
        result := ComCall(3, this, "ushort", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addtable
     */
    AddTable(p, t) {
        result := ComCall(4, this, "ushort", p, "char", t, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @param {Integer} e 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-addextension
     */
    AddExtension(p, t, e) {
        result := ComCall(5, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removepid
     */
    RemovePID(p) {
        result := ComCall(6, this, "ushort", p, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removetable
     */
    RemoveTable(p, t) {
        result := ComCall(7, this, "ushort", p, "char", t, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @param {Integer} e 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mpeg2data/nf-mpeg2data-impeg2tablefilter-removeextension
     */
    RemoveExtension(p, t, e) {
        result := ComCall(8, this, "ushort", p, "char", t, "ushort", e, "HRESULT")
        return result
    }
}
