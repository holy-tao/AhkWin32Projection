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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPeerName", "IsAuthenticated", "IsAvailable"]

    /**
     * Gets the server principal name that uniquely identifies the peer.
     * @returns {PWSTR} Null-terminated string that contains the server principal name of the peer. The principal name is of the form, server$.domain.suffix. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>pName</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeer-getpeername
     */
    GetPeerName() {
        result := ComCall(3, this, "ptr*", &pName := 0, "HRESULT")
        return pName
    }

    /**
     * Determines whether the peer is authenticated.
     * @returns {BOOL} <b>TRUE</b> if the peer is authenticated, otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeer-isauthenticated
     */
    IsAuthenticated() {
        result := ComCall(4, this, "int*", &pAuth := 0, "HRESULT")
        return pAuth
    }

    /**
     * Determines whether the peer is available (online) to serve content.
     * @returns {BOOL} <b>TRUE</b> if the peer is available to serve content, otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nf-bits3_0-ibitspeer-isavailable
     */
    IsAvailable() {
        result := ComCall(5, this, "int*", &pOnline := 0, "HRESULT")
        return pOnline
    }
}
