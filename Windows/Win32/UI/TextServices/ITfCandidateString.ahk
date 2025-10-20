#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCandidateString interface is implemented by a text service and is used by the TSF manager or a client to obtain information about a candidate string object.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itfcandidatestring
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCandidateString extends IUnknown{
    /**
     * The interface identifier for ITfCandidateString
     * @type {Guid}
     */
    static IID => Guid("{581f317e-fd9d-443f-b972-ed00467c5d40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstr 
     * @returns {HRESULT} 
     */
    GetString(pbstr) {
        result := ComCall(3, this, "ptr", pbstr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pnIndex 
     * @returns {HRESULT} 
     */
    GetIndex(pnIndex) {
        result := ComCall(4, this, "uint*", pnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
