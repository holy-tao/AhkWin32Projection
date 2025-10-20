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
     * 
     * @param {Pointer<UInt32>} signalStrength 
     * @returns {HRESULT} 
     */
    GetSignalStrength(signalStrength) {
        result := ComCall(3, this, "uint*", signalStrength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} signalError 
     * @returns {HRESULT} 
     */
    GetSignalError(signalError) {
        result := ComCall(4, this, "uint*", signalError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
