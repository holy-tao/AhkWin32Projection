#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsPeer to get information about a peer in the neighborhood.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibitspeer
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsPeer extends IUnknown{
    /**
     * The interface identifier for IBitsPeer
     * @type {Guid}
     */
    static IID => Guid("{659cdea2-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pName 
     * @returns {HRESULT} 
     */
    GetPeerName(pName) {
        result := ComCall(3, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pAuth 
     * @returns {HRESULT} 
     */
    IsAuthenticated(pAuth) {
        result := ComCall(4, this, "ptr", pAuth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pOnline 
     * @returns {HRESULT} 
     */
    IsAvailable(pOnline) {
        result := ComCall(5, this, "ptr", pOnline, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
