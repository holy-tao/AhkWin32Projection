#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMcastScope interface is obtained by calling IMcastAddressAllocation::EnumerateScopes or IMcastAddressAllocation::get_Scopes.
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-imcastscope
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IMcastScope extends IDispatch{
    /**
     * The interface identifier for IMcastScope
     * @type {Guid}
     */
    static IID => Guid("{df0daef4-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pID 
     * @returns {HRESULT} 
     */
    get_ScopeID(pID) {
        result := ComCall(7, this, "int*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pID 
     * @returns {HRESULT} 
     */
    get_ServerID(pID) {
        result := ComCall(8, this, "int*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pID 
     * @returns {HRESULT} 
     */
    get_InterfaceID(pID) {
        result := ComCall(9, this, "int*", pID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppDescription 
     * @returns {HRESULT} 
     */
    get_ScopeDescription(ppDescription) {
        result := ComCall(10, this, "ptr", ppDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTTL 
     * @returns {HRESULT} 
     */
    get_TTL(pTTL) {
        result := ComCall(11, this, "int*", pTTL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
