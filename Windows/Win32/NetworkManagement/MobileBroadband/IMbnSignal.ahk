#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Get radio signal quality of a Mobile Broadband connection.
 * @remarks
 * 
  * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsignal
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSignal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSignal
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2003-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignalStrength", "GetSignalError"]

    /**
     * 
     * @param {Pointer<Integer>} signalStrength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsignal-getsignalstrength
     */
    GetSignalStrength(signalStrength) {
        signalStrengthMarshal := signalStrength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, signalStrengthMarshal, signalStrength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} signalError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsignal-getsignalerror
     */
    GetSignalError(signalError) {
        signalErrorMarshal := signalError is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, signalErrorMarshal, signalError, "HRESULT")
        return result
    }
}
