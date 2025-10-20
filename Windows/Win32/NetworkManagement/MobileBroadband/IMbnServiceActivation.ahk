#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Pass-through mechanism for cellular service activation.
 * @remarks
 * 
  * An <b>IMbnServiceActivation</b> interface can be obtained by calling <b>QueryInterface</b>  from <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnserviceactivation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnServiceActivation extends IUnknown{
    /**
     * The interface identifier for IMbnServiceActivation
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2017-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SAFEARRAY>} vendorSpecificData 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    Activate(vendorSpecificData, requestID) {
        result := ComCall(3, this, "ptr", vendorSpecificData, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
