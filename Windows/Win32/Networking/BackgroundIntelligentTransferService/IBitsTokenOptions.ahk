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
     * 
     * @param {Integer} UsageFlags 
     * @returns {HRESULT} 
     */
    SetHelperTokenFlags(UsageFlags) {
        result := ComCall(3, this, "uint", UsageFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetHelperTokenFlags(pFlags) {
        result := ComCall(4, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetHelperToken() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearHelperToken() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pSid 
     * @returns {HRESULT} 
     */
    GetHelperTokenSid(pSid) {
        result := ComCall(7, this, "ptr", pSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
