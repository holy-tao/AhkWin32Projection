#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsAggregatee extends IUnknown{
    /**
     * The interface identifier for IADsAggregatee
     * @type {Guid}
     */
    static IID => Guid("{1346ce8c-9039-11d0-8528-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} pOuterUnknown 
     * @returns {HRESULT} 
     */
    ConnectAsAggregatee(pOuterUnknown) {
        result := ComCall(3, this, "ptr", pOuterUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisconnectAsAggregatee() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    RelinquishInterface(riid) {
        result := ComCall(5, this, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    RestoreInterface(riid) {
        result := ComCall(6, this, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
