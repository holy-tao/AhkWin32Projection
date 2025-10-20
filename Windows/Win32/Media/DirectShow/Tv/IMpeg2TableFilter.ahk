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
     * 
     * @param {Integer} p 
     * @returns {HRESULT} 
     */
    AddPID(p) {
        result := ComCall(3, this, "ushort", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @returns {HRESULT} 
     */
    AddTable(p, t) {
        result := ComCall(4, this, "ushort", p, "char", t, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @param {Integer} e 
     * @returns {HRESULT} 
     */
    AddExtension(p, t, e) {
        result := ComCall(5, this, "ushort", p, "char", t, "ushort", e, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @returns {HRESULT} 
     */
    RemovePID(p) {
        result := ComCall(6, this, "ushort", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @returns {HRESULT} 
     */
    RemoveTable(p, t) {
        result := ComCall(7, this, "ushort", p, "char", t, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} p 
     * @param {Integer} t 
     * @param {Integer} e 
     * @returns {HRESULT} 
     */
    RemoveExtension(p, t, e) {
        result := ComCall(8, this, "ushort", p, "char", t, "ushort", e, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
