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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "ParseXDSBytePair"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ixdstorat-init
     */
    Init() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} byte1 
     * @param {Integer} byte2 
     * @param {Pointer<Integer>} pEnSystem 
     * @param {Pointer<Integer>} pEnLevel 
     * @param {Pointer<Integer>} plBfEnAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ixdstorat-parsexdsbytepair
     */
    ParseXDSBytePair(byte1, byte2, pEnSystem, pEnLevel, plBfEnAttributes) {
        pEnSystemMarshal := pEnSystem is VarRef ? "int*" : "ptr"
        pEnLevelMarshal := pEnLevel is VarRef ? "int*" : "ptr"
        plBfEnAttributesMarshal := plBfEnAttributes is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "char", byte1, "char", byte2, pEnSystemMarshal, pEnSystem, pEnLevelMarshal, pEnLevel, plBfEnAttributesMarshal, plBfEnAttributes, "HRESULT")
        return result
    }
}
