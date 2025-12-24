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
     * The CdromRipStateChange event occurs when a CD ripping operation changes state.
     * @remarks
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPCdromRip} pCdromRip Pointer to the <b>IWMPCdromRip</b> interface that represents the ripping operation that raised the error.
     * @param {Integer} wmprs <b>WMPRipState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-cdromripstatechange
     */
    CdromRipStateChange(pCdromRip, wmprs) {
        ComCall(54, this, "ptr", pCdromRip, "int", wmprs)
    }

    /**
     * The CdromRipMediaError event occurs when an error happens while ripping an individual track from a CD.
     * @remarks
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPCdromRip} pCdromRip Pointer to the <b>IWMPCdromRip</b> interface that represents the ripping operation that raised the error.
     * @param {IDispatch} pMedia Pointer to the <b>IDispatch</b> interface that represents the media item that raised the error. Call <b>QueryInterface</b> through this pointer to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-cdromripmediaerror
     */
    CdromRipMediaError(pCdromRip, pMedia) {
        ComCall(55, this, "ptr", pCdromRip, "ptr", pMedia)
    }

    /**
     * The CdromBurnStateChange event occurs when a CD burning operation changes state.
     * @remarks
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the event.
     * @param {Integer} wmpbs <b>WMPBurnState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-cdromburnstatechange
     */
    CdromBurnStateChange(pCdromBurn, wmpbs) {
        ComCall(56, this, "ptr", pCdromBurn, "int", wmpbs)
    }

    /**
     * The CdromBurnMediaError event occurs when an error happens while burning an individual media item to a CD.
     * @remarks
     * 
     * To capture generic errors, handle the <b>CdromBurnError</b> event.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the error.
     * @param {IDispatch} pMedia Pointer to the <b>IDispatch</b> interface that represents the media item that raised the error. Call <b>QueryInterface</b> through this pointer to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-cdromburnmediaerror
     */
    CdromBurnMediaError(pCdromBurn, pMedia) {
        ComCall(57, this, "ptr", pCdromBurn, "ptr", pMedia)
    }

    /**
     * The CdromBurnError event occurs when a generic error happens during a CD burning operation.
     * @remarks
     * 
     * To capture media specific errors, handle the <b>CdromBurnMediaError</b> event.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the error.
     * @param {HRESULT} hrError <b>HRESULT</b> for the error that raised the event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-cdromburnerror
     */
    CdromBurnError(pCdromBurn, hrError) {
        ComCall(58, this, "ptr", pCdromBurn, "int", hrError)
    }

    /**
     * The LibraryConnect event occurs when a library becomes available.
     * @remarks
     * 
     * This event does not occur for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPLibrary} pLibrary Pointer to the <b>IWMPLibrary</b> interface that represents the library that connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-libraryconnect
     */
    LibraryConnect(pLibrary) {
        ComCall(59, this, "ptr", pLibrary)
    }

    /**
     * The LibraryDisconnect event occurs when a library is no longer available.
     * @remarks
     * 
     * This event does not occur for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IWMPLibrary} pLibrary Pointer to the <b>IWMPLibrary</b> interface that represents the library that disconnected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-librarydisconnect
     */
    LibraryDisconnect(pLibrary) {
        ComCall(60, this, "ptr", pLibrary)
    }

    /**
     * The FolderScanStateChange event occurs when a folder monitoring operation changes state.
     * @remarks
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {Integer} wmpfss <b>WMPFolderScanState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-folderscanstatechange
     */
    FolderScanStateChange(wmpfss) {
        ComCall(61, this, "int", wmpfss)
    }

    /**
     * The StringCollectionChange event occurs when a string collection changes.
     * @remarks
     * 
     * To receive <b>StringCollectionChange</b> events, you must obtain your string collection as follows:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmplibrary-get_mediacollection">IWMPLibrary::get_mediaCollection</a> to get an <b>IWMPMediaCollection</b> interface.</li>
     * <li>Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmp/nf-wmp-iwmpmediacollection-getattributestringcollection">getAttributeStringCollection</a> method of the interface you obtained in step 1.</li>
     * </ol>
     * If you obtain your <b>IWMPMediaCollection</b> interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcore-get_mediacollection">IWMPCore::get_mediaCollection</a>, you will not receive <b>StringCollectionChange</b> events.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IDispatch} pdispStringCollection Pointer to the <b>IDispatch</b> interface that represents the string collection that changed. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPStringCollection</b>.
     * @param {Integer} change <a href="https://docs.microsoft.com/windows/desktop/api/wmp/ne-wmp-wmpstringcollectionchangeeventtype">WMPStringCollectionChangeEventType</a> value indicating the type of change that occurred.
     * @param {Integer} lCollectionIndex The index of the string collection item that changed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-stringcollectionchange
     */
    StringCollectionChange(pdispStringCollection, change, lCollectionIndex) {
        ComCall(62, this, "ptr", pdispStringCollection, "int", change, "int", lCollectionIndex)
    }

    /**
     * The MediaCollectionMediaAdded event occurs when a media item is added to the local library.
     * @remarks
     * 
     * This event occurs only for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IDispatch} pdispMedia Pointer to the <b>IDispatch</b> interface that represents the media item added to the local library. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-mediacollectionmediaadded
     */
    MediaCollectionMediaAdded(pdispMedia) {
        ComCall(63, this, "ptr", pdispMedia)
    }

    /**
     * The MediaCollectionMediaRemoved event occurs when a media item is removed from the local library.
     * @remarks
     * 
     * This event occurs only for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * 
     * 
     * @param {IDispatch} pdispMedia Pointer to the <b>IDispatch</b> interface that represents the media item removed from the local library. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpevents3-mediacollectionmediaremoved
     */
    MediaCollectionMediaRemoved(pdispMedia) {
        ComCall(64, this, "ptr", pdispMedia)
    }
}
