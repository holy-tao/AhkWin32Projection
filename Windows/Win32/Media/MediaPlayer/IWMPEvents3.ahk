#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPEvents2.ahk

/**
 * The IWMPEvents3 interface provides access to events originating from the Windows Media Player 11 control so that an application that has this control embedded in it can respond to these events.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpevents3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEvents3 extends IWMPEvents2{
    /**
     * The interface identifier for IWMPEvents3
     * @type {Guid}
     */
    static IID => Guid("{1f504270-a66b-4223-8e96-26a06c63d69f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 54

    /**
     * 
     * @param {Pointer<IWMPCdromRip>} pCdromRip 
     * @param {Integer} wmprs 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromRipStateChange(pCdromRip, wmprs) {
        ComCall(54, this, "ptr", pCdromRip, "int", wmprs)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromRip>} pCdromRip 
     * @param {Pointer<IDispatch>} pMedia 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromRipMediaError(pCdromRip, pMedia) {
        ComCall(55, this, "ptr", pCdromRip, "ptr", pMedia)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromBurn>} pCdromBurn 
     * @param {Integer} wmpbs 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromBurnStateChange(pCdromBurn, wmpbs) {
        ComCall(56, this, "ptr", pCdromBurn, "int", wmpbs)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromBurn>} pCdromBurn 
     * @param {Pointer<IDispatch>} pMedia 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromBurnMediaError(pCdromBurn, pMedia) {
        ComCall(57, this, "ptr", pCdromBurn, "ptr", pMedia)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPCdromBurn>} pCdromBurn 
     * @param {HRESULT} hrError 
     * @returns {String} Nothing - always returns an empty string
     */
    CdromBurnError(pCdromBurn, hrError) {
        ComCall(58, this, "ptr", pCdromBurn, "int", hrError)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPLibrary>} pLibrary 
     * @returns {String} Nothing - always returns an empty string
     */
    LibraryConnect(pLibrary) {
        ComCall(59, this, "ptr", pLibrary)
        return result
    }

    /**
     * 
     * @param {Pointer<IWMPLibrary>} pLibrary 
     * @returns {String} Nothing - always returns an empty string
     */
    LibraryDisconnect(pLibrary) {
        ComCall(60, this, "ptr", pLibrary)
        return result
    }

    /**
     * 
     * @param {Integer} wmpfss 
     * @returns {String} Nothing - always returns an empty string
     */
    FolderScanStateChange(wmpfss) {
        ComCall(61, this, "int", wmpfss)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdispStringCollection 
     * @param {Integer} change 
     * @param {Integer} lCollectionIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    StringCollectionChange(pdispStringCollection, change, lCollectionIndex) {
        ComCall(62, this, "ptr", pdispStringCollection, "int", change, "int", lCollectionIndex)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionMediaAdded(pdispMedia) {
        ComCall(63, this, "ptr", pdispMedia)
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     */
    MediaCollectionMediaRemoved(pdispMedia) {
        ComCall(64, this, "ptr", pdispMedia)
        return result
    }
}
