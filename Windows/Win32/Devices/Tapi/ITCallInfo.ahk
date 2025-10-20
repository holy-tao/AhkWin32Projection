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
     * 
     * @param {Pointer<ITAddress>} ppAddress 
     * @returns {HRESULT} 
     */
    get_Address(ppAddress) {
        result := ComCall(7, this, "ptr", ppAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCallState 
     * @returns {HRESULT} 
     */
    get_CallState(pCallState) {
        result := ComCall(8, this, "int*", pCallState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPrivilege 
     * @returns {HRESULT} 
     */
    get_Privilege(pPrivilege) {
        result := ComCall(9, this, "int*", pPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallHub>} ppCallHub 
     * @returns {HRESULT} 
     */
    get_CallHub(ppCallHub) {
        result := ComCall(10, this, "ptr", ppCallHub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoLong 
     * @param {Pointer<Int32>} plCallInfoLongVal 
     * @returns {HRESULT} 
     */
    get_CallInfoLong(CallInfoLong, plCallInfoLongVal) {
        result := ComCall(11, this, "int", CallInfoLong, "int*", plCallInfoLongVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoLong 
     * @param {Integer} lCallInfoLongVal 
     * @returns {HRESULT} 
     */
    put_CallInfoLong(CallInfoLong, lCallInfoLongVal) {
        result := ComCall(12, this, "int", CallInfoLong, "int", lCallInfoLongVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoString 
     * @param {Pointer<BSTR>} ppCallInfoString 
     * @returns {HRESULT} 
     */
    get_CallInfoString(CallInfoString, ppCallInfoString) {
        result := ComCall(13, this, "int", CallInfoString, "ptr", ppCallInfoString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoString 
     * @param {BSTR} pCallInfoString 
     * @returns {HRESULT} 
     */
    put_CallInfoString(CallInfoString, pCallInfoString) {
        pCallInfoString := pCallInfoString is String ? BSTR.Alloc(pCallInfoString).Value : pCallInfoString

        result := ComCall(14, this, "int", CallInfoString, "ptr", pCallInfoString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Pointer<VARIANT>} ppCallInfoBuffer 
     * @returns {HRESULT} 
     */
    get_CallInfoBuffer(CallInfoBuffer, ppCallInfoBuffer) {
        result := ComCall(15, this, "int", CallInfoBuffer, "ptr", ppCallInfoBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {VARIANT} pCallInfoBuffer 
     * @returns {HRESULT} 
     */
    put_CallInfoBuffer(CallInfoBuffer, pCallInfoBuffer) {
        result := ComCall(16, this, "int", CallInfoBuffer, "ptr", pCallInfoBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} ppCallInfoBuffer 
     * @returns {HRESULT} 
     */
    GetCallInfoBuffer(CallInfoBuffer, pdwSize, ppCallInfoBuffer) {
        result := ComCall(17, this, "int", CallInfoBuffer, "uint*", pdwSize, "char*", ppCallInfoBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CallInfoBuffer 
     * @param {Integer} dwSize 
     * @param {Pointer<Byte>} pCallInfoBuffer 
     * @returns {HRESULT} 
     */
    SetCallInfoBuffer(CallInfoBuffer, dwSize, pCallInfoBuffer) {
        result := ComCall(18, this, "int", CallInfoBuffer, "uint", dwSize, "char*", pCallInfoBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseUserUserInfo() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
