#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to subscriber information.
 * @remarks
 * 
  * This interface is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation">GetSubscriberInformation</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsubscriberinformation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSubscriberInformation extends IUnknown{
    /**
     * The interface identifier for IMbnSubscriberInformation
     * @type {Guid}
     */
    static IID => Guid("{459ecc43-bcf5-11dc-a8a8-001321f1405f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} SubscriberID 
     * @returns {HRESULT} 
     */
    get_SubscriberID(SubscriberID) {
        result := ComCall(3, this, "ptr", SubscriberID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} SimIccID 
     * @returns {HRESULT} 
     */
    get_SimIccID(SimIccID) {
        result := ComCall(4, this, "ptr", SimIccID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} TelephoneNumbers 
     * @returns {HRESULT} 
     */
    get_TelephoneNumbers(TelephoneNumbers) {
        result := ComCall(5, this, "ptr", TelephoneNumbers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
