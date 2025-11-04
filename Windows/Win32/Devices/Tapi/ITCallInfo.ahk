#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITCallInfo interface gets and sets a variety of information concerning a Call object. The ITAddress::get_Calls and IEnumCall::Next methods create the ITCallInfo interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itcallinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITCallInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITCallInfo
     * @type {Guid}
     */
    static IID => Guid("{350f85d1-1227-11d3-83d4-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Address", "get_CallState", "get_Privilege", "get_CallHub", "get_CallInfoLong", "put_CallInfoLong", "get_CallInfoString", "put_CallInfoString", "get_CallInfoBuffer", "put_CallInfoBuffer", "GetCallInfoBuffer", "SetCallInfoBuffer", "ReleaseUserUserInfo"]

    /**
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_address
     */
    get_Address(ppAddress) {
        result := ComCall(7, this, "ptr*", ppAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCallState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_callstate
     */
    get_CallState(pCallState) {
        pCallStateMarshal := pCallState is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pCallStateMarshal, pCallState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrivilege 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_privilege
     */
    get_Privilege(pPrivilege) {
        pPrivilegeMarshal := pPrivilege is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pPrivilegeMarshal, pPrivilege, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITCallHub>} ppCallHub 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_callhub
     */
    get_CallHub(ppCallHub) {
        result := ComCall(10, this, "ptr*", ppCallHub, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoLong 
     * @param {Pointer<Integer>} plCallInfoLongVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_callinfolong
     */
    get_CallInfoLong(CallInfoLong, plCallInfoLongVal) {
        plCallInfoLongValMarshal := plCallInfoLongVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", CallInfoLong, plCallInfoLongValMarshal, plCallInfoLongVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoLong 
     * @param {Integer} lCallInfoLongVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-put_callinfolong
     */
    put_CallInfoLong(CallInfoLong, lCallInfoLongVal) {
        result := ComCall(12, this, "int", CallInfoLong, "int", lCallInfoLongVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoString 
     * @param {Pointer<BSTR>} ppCallInfoString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_callinfostring
     */
    get_CallInfoString(CallInfoString, ppCallInfoString) {
        result := ComCall(13, this, "int", CallInfoString, "ptr", ppCallInfoString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoString 
     * @param {BSTR} pCallInfoString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-put_callinfostring
     */
    put_CallInfoString(CallInfoString, pCallInfoString) {
        pCallInfoString := pCallInfoString is String ? BSTR.Alloc(pCallInfoString).Value : pCallInfoString

        result := ComCall(14, this, "int", CallInfoString, "ptr", pCallInfoString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Pointer<VARIANT>} ppCallInfoBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-get_callinfobuffer
     */
    get_CallInfoBuffer(CallInfoBuffer, ppCallInfoBuffer) {
        result := ComCall(15, this, "int", CallInfoBuffer, "ptr", ppCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {VARIANT} pCallInfoBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-put_callinfobuffer
     */
    put_CallInfoBuffer(CallInfoBuffer, pCallInfoBuffer) {
        result := ComCall(16, this, "int", CallInfoBuffer, "ptr", pCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Pointer<Integer>>} ppCallInfoBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-getcallinfobuffer
     */
    GetCallInfoBuffer(CallInfoBuffer, pdwSize, ppCallInfoBuffer) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppCallInfoBufferMarshal := ppCallInfoBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "int", CallInfoBuffer, pdwSizeMarshal, pdwSize, ppCallInfoBufferMarshal, ppCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pCallInfoBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-setcallinfobuffer
     */
    SetCallInfoBuffer(CallInfoBuffer, dwSize, pCallInfoBuffer) {
        pCallInfoBufferMarshal := pCallInfoBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "int", CallInfoBuffer, "uint", dwSize, pCallInfoBufferMarshal, pCallInfoBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itcallinfo-releaseuseruserinfo
     */
    ReleaseUserUserInfo() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
