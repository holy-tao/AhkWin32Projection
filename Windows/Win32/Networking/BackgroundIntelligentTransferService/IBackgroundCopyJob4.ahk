#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob3.ahk

/**
 * Use this interface to enable peer caching, restrict download time, and inspect user token characteristics.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibackgroundcopyjob4
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob4 extends IBackgroundCopyJob3{
    /**
     * The interface identifier for IBackgroundCopyJob4
     * @type {Guid}
     */
    static IID => Guid("{659cdeae-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetPeerCachingFlags(Flags) {
        result := ComCall(47, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFlags 
     * @returns {HRESULT} 
     */
    GetPeerCachingFlags(pFlags) {
        result := ComCall(48, this, "uint*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLevel 
     * @returns {HRESULT} 
     */
    GetOwnerIntegrityLevel(pLevel) {
        result := ComCall(49, this, "uint*", pLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pElevated 
     * @returns {HRESULT} 
     */
    GetOwnerElevationState(pElevated) {
        result := ComCall(50, this, "ptr", pElevated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    SetMaximumDownloadTime(Timeout) {
        result := ComCall(51, this, "uint", Timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pTimeout 
     * @returns {HRESULT} 
     */
    GetMaximumDownloadTime(pTimeout) {
        result := ComCall(52, this, "uint*", pTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
