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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CdromRipStateChange", "CdromRipMediaError", "CdromBurnStateChange", "CdromBurnMediaError", "CdromBurnError", "LibraryConnect", "LibraryDisconnect", "FolderScanStateChange", "StringCollectionChange", "MediaCollectionMediaAdded", "MediaCollectionMediaRemoved"]

    /**
     * 
     * @param {IWMPCdromRip} pCdromRip 
     * @param {Integer} wmprs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromripstatechange
     */
    CdromRipStateChange(pCdromRip, wmprs) {
        ComCall(54, this, "ptr", pCdromRip, "int", wmprs)
    }

    /**
     * 
     * @param {IWMPCdromRip} pCdromRip 
     * @param {IDispatch} pMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromripmediaerror
     */
    CdromRipMediaError(pCdromRip, pMedia) {
        ComCall(55, this, "ptr", pCdromRip, "ptr", pMedia)
    }

    /**
     * 
     * @param {IWMPCdromBurn} pCdromBurn 
     * @param {Integer} wmpbs 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnstatechange
     */
    CdromBurnStateChange(pCdromBurn, wmpbs) {
        ComCall(56, this, "ptr", pCdromBurn, "int", wmpbs)
    }

    /**
     * 
     * @param {IWMPCdromBurn} pCdromBurn 
     * @param {IDispatch} pMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnmediaerror
     */
    CdromBurnMediaError(pCdromBurn, pMedia) {
        ComCall(57, this, "ptr", pCdromBurn, "ptr", pMedia)
    }

    /**
     * 
     * @param {IWMPCdromBurn} pCdromBurn 
     * @param {HRESULT} hrError 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnerror
     */
    CdromBurnError(pCdromBurn, hrError) {
        ComCall(58, this, "ptr", pCdromBurn, "int", hrError)
    }

    /**
     * 
     * @param {IWMPLibrary} pLibrary 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-libraryconnect
     */
    LibraryConnect(pLibrary) {
        ComCall(59, this, "ptr", pLibrary)
    }

    /**
     * 
     * @param {IWMPLibrary} pLibrary 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-librarydisconnect
     */
    LibraryDisconnect(pLibrary) {
        ComCall(60, this, "ptr", pLibrary)
    }

    /**
     * 
     * @param {Integer} wmpfss 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-folderscanstatechange
     */
    FolderScanStateChange(wmpfss) {
        ComCall(61, this, "int", wmpfss)
    }

    /**
     * 
     * @param {IDispatch} pdispStringCollection 
     * @param {Integer} change 
     * @param {Integer} lCollectionIndex 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-stringcollectionchange
     */
    StringCollectionChange(pdispStringCollection, change, lCollectionIndex) {
        ComCall(62, this, "ptr", pdispStringCollection, "int", change, "int", lCollectionIndex)
    }

    /**
     * 
     * @param {IDispatch} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-mediacollectionmediaadded
     */
    MediaCollectionMediaAdded(pdispMedia) {
        ComCall(63, this, "ptr", pdispMedia)
    }

    /**
     * 
     * @param {IDispatch} pdispMedia 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-mediacollectionmediaremoved
     */
    MediaCollectionMediaRemoved(pdispMedia) {
        ComCall(64, this, "ptr", pdispMedia)
    }
}
