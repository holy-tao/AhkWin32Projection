#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConfigAsfWriter.ahk

/**
 * The IConfigAsfWriter2 interface extends the IConfigAsfWriter interface, which configures the WM ASF Writer filter.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iconfigasfwriter2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigAsfWriter2 extends IConfigAsfWriter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigAsfWriter2
     * @type {Guid}
     */
    static IID => Guid("{7989ccaa-53f0-44f0-884a-f3b03f6ae066}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StreamNumFromPin", "SetParam", "GetParam", "ResetMultiPassState"]

    /**
     * 
     * @param {IPin} pPin 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter2-streamnumfrompin
     */
    StreamNumFromPin(pPin) {
        result := ComCall(11, this, "ptr", pPin, "ushort*", &pwStreamNum := 0, "HRESULT")
        return pwStreamNum
    }

    /**
     * 
     * @param {Integer} dwParam 
     * @param {Integer} dwParam1 
     * @param {Integer} dwParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter2-setparam
     */
    SetParam(dwParam, dwParam1, dwParam2) {
        result := ComCall(12, this, "uint", dwParam, "uint", dwParam1, "uint", dwParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParam 
     * @param {Pointer<Integer>} pdwParam1 
     * @param {Pointer<Integer>} pdwParam2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter2-getparam
     */
    GetParam(dwParam, pdwParam1, pdwParam2) {
        pdwParam1Marshal := pdwParam1 is VarRef ? "uint*" : "ptr"
        pdwParam2Marshal := pdwParam2 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwParam, pdwParam1Marshal, pdwParam1, pdwParam2Marshal, pdwParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dshowasf/nf-dshowasf-iconfigasfwriter2-resetmultipassstate
     */
    ResetMultiPassState() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
