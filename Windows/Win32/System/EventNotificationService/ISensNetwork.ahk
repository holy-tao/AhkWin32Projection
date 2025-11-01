#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensNetwork interface handles network events fired by the System Event Notification Service (SENS).
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isensnetwork
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensNetwork extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensNetwork
     * @type {Guid}
     */
    static IID => Guid("{d597bab1-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectionMade", "ConnectionMadeNoQOCInfo", "ConnectionLost", "DestinationReachable", "DestinationReachableNoQOCInfo"]

    /**
     * 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @param {Pointer<SENS_QOCINFO>} lpQOCInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionmade
     */
    ConnectionMade(bstrConnection, ulType, lpQOCInfo) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(7, this, "ptr", bstrConnection, "uint", ulType, "ptr", lpQOCInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionmadenoqocinfo
     */
    ConnectionMadeNoQOCInfo(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(8, this, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionlost
     */
    ConnectionLost(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(9, this, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDestination 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @param {Pointer<SENS_QOCINFO>} lpQOCInfo 
     * @returns {HRESULT} 
     */
    DestinationReachable(bstrDestination, bstrConnection, ulType, lpQOCInfo) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(10, this, "ptr", bstrDestination, "ptr", bstrConnection, "uint", ulType, "ptr", lpQOCInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDestination 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     */
    DestinationReachableNoQOCInfo(bstrDestination, bstrConnection, ulType) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(11, this, "ptr", bstrDestination, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }
}
