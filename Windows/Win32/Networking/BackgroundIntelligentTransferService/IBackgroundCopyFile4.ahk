#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile3.ahk

/**
 * Use this interface to retrieve download statistics for peers and origin servers.
 * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nn-bits4_0-ibackgroundcopyfile4
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile4 extends IBackgroundCopyFile3{
    /**
     * The interface identifier for IBackgroundCopyFile4
     * @type {Guid}
     */
    static IID => Guid("{ef7e0655-7888-4960-b0e5-730846e03492}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<UInt64>} pFromOrigin 
     * @param {Pointer<UInt64>} pFromPeers 
     * @returns {HRESULT} 
     */
    GetPeerDownloadStats(pFromOrigin, pFromPeers) {
        result := ComCall(12, this, "uint*", pFromOrigin, "uint*", pFromPeers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
