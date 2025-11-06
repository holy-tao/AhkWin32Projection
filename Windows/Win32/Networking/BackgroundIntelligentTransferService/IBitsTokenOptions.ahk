#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsTokenOptions to associate and manage a pair of security tokens for a Background Intelligent Transfer Service (BITS) transfer job.
 * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nn-bits4_0-ibitstokenoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsTokenOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsTokenOptions
     * @type {Guid}
     */
    static IID => Guid("{9a2584c3-f7d2-457a-9a5e-22b67bffc7d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHelperTokenFlags", "GetHelperTokenFlags", "SetHelperToken", "ClearHelperToken", "GetHelperTokenSid"]

    /**
     * 
     * @param {Integer} UsageFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertokenflags
     */
    SetHelperTokenFlags(UsageFlags) {
        result := ComCall(3, this, "uint", UsageFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokenflags
     */
    GetHelperTokenFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertoken
     */
    SetHelperToken() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-clearhelpertoken
     */
    ClearHelperToken() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokensid
     */
    GetHelperTokenSid() {
        result := ComCall(7, this, "ptr*", &pSid := 0, "HRESULT")
        return pSid
    }
}
