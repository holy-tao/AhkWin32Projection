#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumDiscMasterFormats.ahk
#Include .\IEnumDiscRecorders.ahk
#Include .\IDiscRecorder.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDiscMaster interface allows an application to reserve an image mastering API, enumerate disc mastering formats and disc recorders supported by an image mastering object, and start a simulated or actual burn of a disc.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nn-imapi-idiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscMaster extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscMaster
     * @type {Guid}
     */
    static IID => Guid("{520cca62-51a5-11d3-9144-00104ba11c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "EnumDiscMasterFormats", "GetActiveDiscMasterFormat", "SetActiveDiscMasterFormat", "EnumDiscRecorders", "GetActiveDiscRecorder", "SetActiveDiscRecorder", "ClearFormatContent", "ProgressAdvise", "ProgressUnadvise", "RecordDisc", "Close"]

    /**
     * Opens an upper-level IMAPI object for access by a client application.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-open
     */
    Open() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an enumerator for all disc mastering formats supported by this disc master object. A disc master format specifies the structure of the content in a staged image file (data/audio) and the interface that manages the staged image.
     * @remarks
     * <b>MSDiscMasterObj</b> returns an enumerator that identifies the supported formats by their interface IDs. Currently, there are two formats: IID_IRedbookDiscMaster (
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-iredbookdiscmaster">IRedbookDiscMaster</a>) and IID_IJolietDiscMaster (
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-ijolietdiscmaster">IJolietDiscMaster</a>).
     * 
     * <b>IEnumDiscMasterFormats</b> is standard COM enumerator, as documented in 
     * <b>IEnumXXXX</b>. Each call to <b>Next</b> returns an array of IIDs, one IID per supported disc master format. To select the active format and retrieve a pointer to a format specific interface, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscmasterformat">SetActiveDiscMasterFormat</a>. (Do not use <b>QueryInterface</b>, because the interface will not be associated with the active format).
     * @returns {IEnumDiscMasterFormats} Address of a pointer to the <b>IEnumDiscMasterFormats</b> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-enumdiscmasterformats
     */
    EnumDiscMasterFormats() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumDiscMasterFormats(ppEnum)
    }

    /**
     * Retrieves the active disc recorder format. The active format specifies both the structure of the staged image file content (audio/data) and the COM interface that must be used to manipulate that staged image.
     * @remarks
     * <b>MSDiscMasterObj</b> supports the IIDs for two formats: IID_IRedbookDiscMaster (<a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-iredbookdiscmaster">IRedbookDiscMaster</a>) and IID_IJolietDiscMaster (<a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-ijolietdiscmaster">IJolietDiscMaster</a>). To select the active format and retrieve a pointer to a format-specific interface, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscmasterformat">SetActiveDiscMasterFormat</a>.
     * @returns {Guid} IID of the currently active format.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-getactivediscmasterformat
     */
    GetActiveDiscMasterFormat() {
        lpiid := Guid()
        result := ComCall(5, this, "ptr", lpiid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lpiid
    }

    /**
     * Sets the currently active disc recorder format. The active format specifies both the structure of the staged image file content (audio/data) and the COM interface that must be used to manipulate that staged image.
     * @remarks
     * A successful call to this method clears the contents of the currently staged image. In addition, it may change the list of supported disc recorders. This is because not all recorders support all formats. Changes to the recorder list are announced with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmasterprogressevents-notifypnpactivity">IDiscMasterProgressEvents::NotifyPnPActivity</a>. If the currently selected recorder is not a member of the new set of supported devices, then there will no longer be an active recorder (similar to the state after the first call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-open">Open</a>). In this case, the application must select a new active recorder before initiating a burn.
     * 
     * <b>MSDiscMasterObj</b> supports only the following IIDs: IID_IRedbookDiscMaster (<a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-iredbookdiscmaster">IRedbookDiscMaster</a>) and IID_IJolietDiscMaster (<a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-ijolietdiscmaster">IJolietDiscMaster</a>). If there is no format set, the default is Joliet format. It is the responsibility of every application to select a format master through the use of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-enumdiscmasterformats">EnumDiscMasterFormats</a> and this method.
     * 
     * <div class="alert"><b>Note</b>  A call to this method may change the list of available recorders. See the Remarks section of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders">EnumDiscRecorders</a> for more information.</div>
     * <div> </div>
     * @param {Pointer<Guid>} riid IID of the currently active format.
     * @returns {Pointer<Void>} Pointer to the COM interface for the new disc format.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-setactivediscmasterformat
     */
    SetActiveDiscMasterFormat(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppUnk
    }

    /**
     * Retrieves an enumerator for all disc recorders supported by the active disc master format.
     * @remarks
     * <b>IEnumDiscRecorders</b> is a standard COM enumerator, as documented in 
     * <b>IEnumXXXX</b>. Each call to <b>Next</b> returns an array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a>. Each recorder interface represents a single available recorder already associated with an underlying physical disc recorder.
     * 
     * The list of available recorders may change due to Plug and Play arrivals or departures, or a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscmasterformat">SetActiveDiscMasterFormat</a>. An application is notified of these changes when it receives a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmasterprogressevents-notifypnpactivity">IDiscMasterProgressEvents::NotifyPnPActivity</a>. When a change occurs, the application should call this method again to retrieve a new enumerator, because each enumerator contains a snapshot of the devices supported at the time of the enumeration.
     * 
     * When a device is removed, its pointer and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a> interface must remain valid even though the underlying physical device is missing. In this case, operations on an 
     * <b>IDiscRecorder</b> or a request to record a disc may return IMAPI_E_DEVICE_NOTPRESENT.
     * 
     * The <b>MaxWriteSpeed</b> property is updated when this method is called. The default setting is the highest available write speed.
     * @returns {IEnumDiscRecorders} Address of a pointer to the <b>IEnumDiscRecorders</b> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-enumdiscrecorders
     */
    EnumDiscRecorders() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumDiscRecorders(ppEnum)
    }

    /**
     * Retrieves an interface pointer to the active disc recorder. The active disc recorder is the recorder where a burn will occur when RecordDisc is called.
     * @remarks
     * There is no default active disc recorder. An application using this method must specifically select both an active mastering format and an active disc recorder before initiating a burn.
     * 
     * > [!NOTE]
     * > The active disc recorder can be invalidated by removing the device or changing the active disc mastering format. For example, a USB CD-R device may be disconnected from the machine while the application is still running (the application is alerted to this condition by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmasterprogressevents-notifypnpactivity">IDiscMasterProgressEvents::NotifyPnPActivity</a>). In either case, you must select a new active disc recorder.</div>
     * <div> </div>
     * @returns {IDiscRecorder} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a> interface of the currently selected disc recorder.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-getactivediscrecorder
     */
    GetActiveDiscRecorder() {
        result := ComCall(8, this, "ptr*", &ppRecorder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDiscRecorder(ppRecorder)
    }

    /**
     * Selects an active disc recorder. The active disc recorder is the recorder where a burn will occur when RecordDisc is called.
     * @remarks
     * <b>SetActiveDiscRecorder</b> must be called after the media to be used has been inserted, and before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-ijolietdiscmaster-adddata">IJolietDiscMaster::AddData</a>.
     * 
     * Selecting a recorder while in an active Joliet format will cause IMAPI to read information from the currently installed recorder disc. If this disc is a previous IMAPI Joliet disc and has space for another session, IMAPI automatically sets itself to multi-session mode. This disc must be in the active recorder when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-recorddisc">RecordDisc</a> is called.
     * 
     * The <b>MaxWriteSpeed</b> property is updated when this method is called. The default setting is the highest write speed.
     * @param {IDiscRecorder} pRecorder Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a> interface of a disc recorder object. This pointer should have been returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders">EnumDiscRecorders</a>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-setactivediscrecorder
     */
    SetActiveDiscRecorder(pRecorder) {
        result := ComCall(9, this, "ptr", pRecorder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clears the contents of an unburned image (the current stash file).
     * @remarks
     * The stash file is an internal structure that is used to stage a disc before recording it to media.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscrecorder">SetActiveDiscRecorder</a> determines if there is an IMAPI multi-session disc in the active drive. If so, IMAPI enters multi-session mode automatically. Using 
     * <b>ClearFormatContent</b> after multi-session mode had been established causes IMAPI to return to single-session mode. This means that a blank disc is required for a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-recorddisc">RecordDisc</a> burn.
     * 
     * <div class="alert"><b>Caution</b>  Use care when calling this method. There is no confirmation and no recovery. If an application fills the image file with data, then calls this method, the data is gone.</div>
     * <div> </div>
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-clearformatcontent
     */
    ClearFormatContent() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers an application for progress notifications.
     * @param {IDiscMasterProgressEvents} pEvents Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscmasterprogressevents">IDiscMasterProgressEvents</a> interface that receives the progress notifications.
     * @returns {Pointer} Uniquely identifies this registration. Save this value because it will be needed by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-progressunadvise">ProgressUnadvise</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-progressadvise
     */
    ProgressAdvise(pEvents) {
        result := ComCall(11, this, "ptr", pEvents, "ptr*", &pvCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvCookie
    }

    /**
     * Cancels progress notifications for an application.
     * @param {Pointer} vCookie Value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-progressadvise">ProgressAdvise</a> method.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-progressunadvise
     */
    ProgressUnadvise(vCookie) {
        result := ComCall(12, this, "ptr", vCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Burns the staged image to media in the active disc recorder.
     * @remarks
     * This method returns when the burn is complete, although progress callbacks are made if registered with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-progressadvise">ProgressAdvise</a> method. Any errors cause this method to return, with little or no corrective action on the part of this method. 
     * 
     * The staged image data is not valid after a call to 
     * <b>RecordDisc</b>. This allows the application to perform either a simulated or actual burn of the media. For security, the contents of the stash file are cleared automatically after successful completion of the first call to this method. A disc must be restaged to burn it again.
     * 
     * The 
     * <b>RecordDisc</b> method expects to work with blank media for audio. Otherwise, the media may need to be erased (for example, CD-RW media in a CD-RW drive). See 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscrecorder-erase">IDiscRecorder::Erase</a>.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscrecorder">SetActiveDiscRecorder</a> method determines if there is an IMAPI multi-session disc in the active drive upon setting. If so, IMAPI goes into multi-session mode automatically. If in multi-session mode and a call is made to 
     * <b>RecordDisc</b>, the same disc that established multi-session mode must be in the active recorder or an error code of IMAPI_E_WRONGDISC will be returned.
     * @param {Integer} bSimulate Indicates whether the media is burned. If this parameter is <b>TRUE</b>, media in the active disc recorder is not actually burned. Instead, a simulated burn is performed. The simulation is a good test of a disc recorder, because most of the operations are performed as in a real burn. If this parameter is <b>FALSE</b>, then the media in the recorder is actually burned.
     * @param {Integer} bEjectAfterBurn Indicates whether to eject the media after the burn. If this parameter is <b>TRUE</b>, the media is ejected. If this parameter is <b>FALSE</b>, the media is not ejected.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-recorddisc
     */
    RecordDisc(bSimulate, bEjectAfterBurn) {
        result := ComCall(13, this, "char", bSimulate, "char", bEjectAfterBurn, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the interface so other applications can use it.
     * @remarks
     * Content not committed to media through a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-recorddisc">RecordDisc</a> is lost.
     * 
     * Closing an already closed interface returns S_OK.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi/nf-imapi-idiscmaster-close
     */
    Close() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
