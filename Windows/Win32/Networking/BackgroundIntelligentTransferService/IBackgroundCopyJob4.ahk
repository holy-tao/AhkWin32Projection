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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPeerCachingFlags", "GetPeerCachingFlags", "GetOwnerIntegrityLevel", "GetOwnerElevationState", "SetMaximumDownloadTime", "GetMaximumDownloadTime"]

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-setpeercachingflags
     */
    SetPeerCachingFlags(Flags) {
        result := ComCall(47, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-getpeercachingflags
     */
    GetPeerCachingFlags() {
        result := ComCall(48, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-getownerintegritylevel
     */
    GetOwnerIntegrityLevel() {
        result := ComCall(49, this, "uint*", &pLevel := 0, "HRESULT")
        return pLevel
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-getownerelevationstate
     */
    GetOwnerElevationState() {
        result := ComCall(50, this, "int*", &pElevated := 0, "HRESULT")
        return pElevated
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-setmaximumdownloadtime
     */
    SetMaximumDownloadTime(Timeout) {
        result := ComCall(51, this, "uint", Timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyjob4-getmaximumdownloadtime
     */
    GetMaximumDownloadTime() {
        result := ComCall(52, this, "uint*", &pTimeout := 0, "HRESULT")
        return pTimeout
    }
}
