#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMPBurnState.ahk" { WMPBurnState }
#Import ".\WMPRipState.ahk" { WMPRipState }
#Import ".\IWMPCdromRip.ahk" { IWMPCdromRip }
#Import ".\IWMPEvents2.ahk" { IWMPEvents2 }
#Import ".\WMPFolderScanState.ahk" { WMPFolderScanState }
#Import ".\WMPStringCollectionChangeEventType.ahk" { WMPStringCollectionChangeEventType }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWMPCdromBurn.ahk" { IWMPCdromBurn }
#Import ".\IWMPLibrary.ahk" { IWMPLibrary }

/**
 * The IWMPEvents3 interface provides access to events originating from the Windows Media Player 11 control so that an application that has this control embedded in it can respond to these events.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpevents3
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPEvents3 extends IWMPEvents2 {
    /**
     * The interface identifier for IWMPEvents3
     * @type {Guid}
     */
    static IID := Guid("{1f504270-a66b-4223-8e96-26a06c63d69f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPEvents3 interfaces
    */
    struct Vtbl extends IWMPEvents2.Vtbl {
        CdromRipStateChange         : IntPtr
        CdromRipMediaError          : IntPtr
        CdromBurnStateChange        : IntPtr
        CdromBurnMediaError         : IntPtr
        CdromBurnError              : IntPtr
        LibraryConnect              : IntPtr
        LibraryDisconnect           : IntPtr
        FolderScanStateChange       : IntPtr
        StringCollectionChange      : IntPtr
        MediaCollectionMediaAdded   : IntPtr
        MediaCollectionMediaRemoved : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPEvents3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CdromRipStateChange event occurs when a CD ripping operation changes state.
     * @remarks
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPCdromRip} pCdromRip Pointer to the <b>IWMPCdromRip</b> interface that represents the ripping operation that raised the error.
     * @param {WMPRipState} wmprs <b>WMPRipState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromripstatechange
     */
    CdromRipStateChange(pCdromRip, wmprs) {
        ComCall(54, this, "ptr", pCdromRip, WMPRipState, wmprs)
    }

    /**
     * The CdromRipMediaError event occurs when an error happens while ripping an individual track from a CD.
     * @remarks
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPCdromRip} pCdromRip Pointer to the <b>IWMPCdromRip</b> interface that represents the ripping operation that raised the error.
     * @param {IDispatch} pMedia Pointer to the <b>IDispatch</b> interface that represents the media item that raised the error. Call <b>QueryInterface</b> through this pointer to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromripmediaerror
     */
    CdromRipMediaError(pCdromRip, pMedia) {
        ComCall(55, this, "ptr", pCdromRip, "ptr", pMedia)
    }

    /**
     * The CdromBurnStateChange event occurs when a CD burning operation changes state.
     * @remarks
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the event.
     * @param {WMPBurnState} wmpbs <b>WMPBurnState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnstatechange
     */
    CdromBurnStateChange(pCdromBurn, wmpbs) {
        ComCall(56, this, "ptr", pCdromBurn, WMPBurnState, wmpbs)
    }

    /**
     * The CdromBurnMediaError event occurs when an error happens while burning an individual media item to a CD.
     * @remarks
     * To capture generic errors, handle the <b>CdromBurnError</b> event.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the error.
     * @param {IDispatch} pMedia Pointer to the <b>IDispatch</b> interface that represents the media item that raised the error. Call <b>QueryInterface</b> through this pointer to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnmediaerror
     */
    CdromBurnMediaError(pCdromBurn, pMedia) {
        ComCall(57, this, "ptr", pCdromBurn, "ptr", pMedia)
    }

    /**
     * The CdromBurnError event occurs when a generic error happens during a CD burning operation.
     * @remarks
     * To capture media specific errors, handle the <b>CdromBurnMediaError</b> event.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPCdromBurn} pCdromBurn Pointer to the <b>IWMPCdromBurn</b> interface that represents the burning operation that raised the error.
     * @param {HRESULT} hrError <b>HRESULT</b> for the error that raised the event.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-cdromburnerror
     */
    CdromBurnError(pCdromBurn, hrError) {
        ComCall(58, this, "ptr", pCdromBurn, "int", hrError)
    }

    /**
     * The LibraryConnect event occurs when a library becomes available.
     * @remarks
     * This event does not occur for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPLibrary} pLibrary Pointer to the <b>IWMPLibrary</b> interface that represents the library that connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-libraryconnect
     */
    LibraryConnect(pLibrary) {
        ComCall(59, this, "ptr", pLibrary)
    }

    /**
     * The LibraryDisconnect event occurs when a library is no longer available.
     * @remarks
     * This event does not occur for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IWMPLibrary} pLibrary Pointer to the <b>IWMPLibrary</b> interface that represents the library that disconnected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-librarydisconnect
     */
    LibraryDisconnect(pLibrary) {
        ComCall(60, this, "ptr", pLibrary)
    }

    /**
     * The FolderScanStateChange event occurs when a folder monitoring operation changes state.
     * @remarks
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {WMPFolderScanState} wmpfss <b>WMPFolderScanState</b> enumeration value that indicates the new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-folderscanstatechange
     */
    FolderScanStateChange(wmpfss) {
        ComCall(61, this, WMPFolderScanState, wmpfss)
    }

    /**
     * The StringCollectionChange event occurs when a string collection changes.
     * @remarks
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
     * @param {IDispatch} pdispStringCollection Pointer to the <b>IDispatch</b> interface that represents the string collection that changed. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPStringCollection</b>.
     * @param {WMPStringCollectionChangeEventType} change <a href="https://docs.microsoft.com/windows/desktop/api/wmp/ne-wmp-wmpstringcollectionchangeeventtype">WMPStringCollectionChangeEventType</a> value indicating the type of change that occurred.
     * @param {Integer} lCollectionIndex The index of the string collection item that changed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-stringcollectionchange
     */
    StringCollectionChange(pdispStringCollection, change, lCollectionIndex) {
        ComCall(62, this, "ptr", pdispStringCollection, WMPStringCollectionChangeEventType, change, "int", lCollectionIndex)
    }

    /**
     * The MediaCollectionMediaAdded event occurs when a media item is added to the local library.
     * @remarks
     * This event occurs only for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IDispatch} pdispMedia Pointer to the <b>IDispatch</b> interface that represents the media item added to the local library. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-mediacollectionmediaadded
     */
    MediaCollectionMediaAdded(pdispMedia) {
        ComCall(63, this, "ptr", pdispMedia)
    }

    /**
     * The MediaCollectionMediaRemoved event occurs when a media item is removed from the local library.
     * @remarks
     * This event occurs only for the local library.
     * 
     * You can also handle this event through an <b>IDispatch</b> event sink by using the <b>_WMPOCXEvents</b> interface.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This event is not supported.
     * @param {IDispatch} pdispMedia Pointer to the <b>IDispatch</b> interface that represents the media item removed from the local library. Call <b>QueryInterface</b> to retrieve a pointer to <b>IWMPMedia</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpevents3-mediacollectionmediaremoved
     */
    MediaCollectionMediaRemoved(pdispMedia) {
        ComCall(64, this, "ptr", pdispMedia)
    }

    Query(iid) {
        if (IWMPEvents3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CdromRipStateChange := CallbackCreate(GetMethod(implObj, "CdromRipStateChange"), flags, 3)
        this.vtbl.CdromRipMediaError := CallbackCreate(GetMethod(implObj, "CdromRipMediaError"), flags, 3)
        this.vtbl.CdromBurnStateChange := CallbackCreate(GetMethod(implObj, "CdromBurnStateChange"), flags, 3)
        this.vtbl.CdromBurnMediaError := CallbackCreate(GetMethod(implObj, "CdromBurnMediaError"), flags, 3)
        this.vtbl.CdromBurnError := CallbackCreate(GetMethod(implObj, "CdromBurnError"), flags, 3)
        this.vtbl.LibraryConnect := CallbackCreate(GetMethod(implObj, "LibraryConnect"), flags, 2)
        this.vtbl.LibraryDisconnect := CallbackCreate(GetMethod(implObj, "LibraryDisconnect"), flags, 2)
        this.vtbl.FolderScanStateChange := CallbackCreate(GetMethod(implObj, "FolderScanStateChange"), flags, 2)
        this.vtbl.StringCollectionChange := CallbackCreate(GetMethod(implObj, "StringCollectionChange"), flags, 4)
        this.vtbl.MediaCollectionMediaAdded := CallbackCreate(GetMethod(implObj, "MediaCollectionMediaAdded"), flags, 2)
        this.vtbl.MediaCollectionMediaRemoved := CallbackCreate(GetMethod(implObj, "MediaCollectionMediaRemoved"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CdromRipStateChange)
        CallbackFree(this.vtbl.CdromRipMediaError)
        CallbackFree(this.vtbl.CdromBurnStateChange)
        CallbackFree(this.vtbl.CdromBurnMediaError)
        CallbackFree(this.vtbl.CdromBurnError)
        CallbackFree(this.vtbl.LibraryConnect)
        CallbackFree(this.vtbl.LibraryDisconnect)
        CallbackFree(this.vtbl.FolderScanStateChange)
        CallbackFree(this.vtbl.StringCollectionChange)
        CallbackFree(this.vtbl.MediaCollectionMediaAdded)
        CallbackFree(this.vtbl.MediaCollectionMediaRemoved)
    }
}
