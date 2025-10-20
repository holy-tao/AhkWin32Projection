#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IXDSToRat interface parses rating information from extended data services (XDS) information in line 21.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IXDSToRat)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tvratings/nn-tvratings-ixdstorat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IXDSToRat extends IDispatch{
    /**
     * The interface identifier for IXDSToRat
     * @type {Guid}
     */
    static IID => Guid("{c5c5c5b0-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The class identifier for XDSToRat
     * @type {Guid}
     */
    static CLSID => Guid("{c5c5c5f0-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    Init() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} byte1 
     * @param {Integer} byte2 
     * @param {Pointer<Int32>} pEnSystem 
     * @param {Pointer<Int32>} pEnLevel 
     * @param {Pointer<Int32>} plBfEnAttributes 
     * @returns {HRESULT} 
     */
    ParseXDSBytePair(byte1, byte2, pEnSystem, pEnLevel, plBfEnAttributes) {
        result := ComCall(8, this, "char", byte1, "char", byte2, "int*", pEnSystem, "int*", pEnLevel, "int*", plBfEnAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
