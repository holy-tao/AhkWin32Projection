#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRTCSession.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSession2 extends IRTCSession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSession2
     * @type {Guid}
     */
    static IID => Guid("{17d7cdfc-b007-484c-99d2-86a8a820991d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendInfo", "put_PreferredSecurityLevel", "get_PreferredSecurityLevel", "IsSecurityEnabled", "AnswerWithSessionDescription", "ReInviteWithSessionDescription"]

    /**
     * 
     * @param {BSTR} bstrInfoHeader 
     * @param {BSTR} bstrInfo 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    SendInfo(bstrInfoHeader, bstrInfo, lCookie) {
        bstrInfoHeader := bstrInfoHeader is String ? BSTR.Alloc(bstrInfoHeader).Value : bstrInfoHeader
        bstrInfo := bstrInfo is String ? BSTR.Alloc(bstrInfo).Value : bstrInfo

        result := ComCall(23, this, "ptr", bstrInfoHeader, "ptr", bstrInfo, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Integer} enSecurityLevel 
     * @returns {HRESULT} 
     */
    put_PreferredSecurityLevel(enSecurityType, enSecurityLevel) {
        result := ComCall(24, this, "int", enSecurityType, "int", enSecurityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<Integer>} penSecurityLevel 
     * @returns {HRESULT} 
     */
    get_PreferredSecurityLevel(enSecurityType, penSecurityLevel) {
        result := ComCall(25, this, "int", enSecurityType, "int*", penSecurityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enSecurityType 
     * @param {Pointer<VARIANT_BOOL>} pfSecurityEnabled 
     * @returns {HRESULT} 
     */
    IsSecurityEnabled(enSecurityType, pfSecurityEnabled) {
        result := ComCall(26, this, "int", enSecurityType, "ptr", pfSecurityEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @returns {HRESULT} 
     */
    AnswerWithSessionDescription(bstrContentType, bstrSessionDescription) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(27, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    ReInviteWithSessionDescription(bstrContentType, bstrSessionDescription, lCookie) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(28, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "ptr", lCookie, "HRESULT")
        return result
    }
}
