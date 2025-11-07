#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Registers Media Foundation transforms (MFTs) in the caller's process.
 * @remarks
 * 
 * This interface requires the Media Session. If you are not using the Media Session for playback, call one of the following functions instead:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocal">MFTRegisterLocal</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mftregisterlocalbyclsid">MFTRegisterLocalByCLSID</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imflocalmftregistration
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFLocalMFTRegistration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFLocalMFTRegistration
     * @type {Guid}
     */
    static IID => Guid("{149c4d73-b4be-4f8d-8b87-079e926b6add}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterMFTs"]

    /**
     * 
     * @param {Pointer<MFT_REGISTRATION_INFO>} pMFTs 
     * @param {Integer} cMFTs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imflocalmftregistration-registermfts
     */
    RegisterMFTs(pMFTs, cMFTs) {
        result := ComCall(3, this, "ptr", pMFTs, "uint", cMFTs, "HRESULT")
        return result
    }
}
