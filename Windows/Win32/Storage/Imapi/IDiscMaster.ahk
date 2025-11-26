#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumDiscMasterFormats.ahk
#Include .\IEnumDiscRecorders.ahk
#Include .\IDiscRecorder.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDiscMaster interface allows an application to reserve an image mastering API, enumerate disc mastering formats and disc recorders supported by an image mastering object, and start a simulated or actual burn of a disc.
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-idiscmaster
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-open
     */
    Open() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an enumerator for all disc mastering formats supported by this disc master object. A disc master format specifies the structure of the content in a staged image file (data/audio) and the interface that manages the staged image.
     * @returns {IEnumDiscMasterFormats} Address of a pointer to the <b>IEnumDiscMasterFormats</b> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-enumdiscmasterformats
     */
    EnumDiscMasterFormats() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiscMasterFormats(ppEnum)
    }

    /**
     * Retrieves the active disc recorder format. The active format specifies both the structure of the staged image file content (audio/data) and the COM interface that must be used to manipulate that staged image.
     * @returns {Guid} IID of the currently active format.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-getactivediscmasterformat
     */
    GetActiveDiscMasterFormat() {
        lpiid := Guid()
        result := ComCall(5, this, "ptr", lpiid, "HRESULT")
        return lpiid
    }

    /**
     * Sets the currently active disc recorder format. The active format specifies both the structure of the staged image file content (audio/data) and the COM interface that must be used to manipulate that staged image.
     * @param {Pointer<Guid>} riid IID of the currently active format.
     * @returns {Pointer<Void>} Pointer to the COM interface for the new disc format.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-setactivediscmasterformat
     */
    SetActiveDiscMasterFormat(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * Retrieves an enumerator for all disc recorders supported by the active disc master format.
     * @returns {IEnumDiscRecorders} Address of a pointer to the <b>IEnumDiscRecorders</b> enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-enumdiscrecorders
     */
    EnumDiscRecorders() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiscRecorders(ppEnum)
    }

    /**
     * Retrieves an interface pointer to the active disc recorder. The active disc recorder is the recorder where a burn will occur when RecordDisc is called.
     * @returns {IDiscRecorder} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a> interface of the currently selected disc recorder.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-getactivediscrecorder
     */
    GetActiveDiscRecorder() {
        result := ComCall(8, this, "ptr*", &ppRecorder := 0, "HRESULT")
        return IDiscRecorder(ppRecorder)
    }

    /**
     * Selects an active disc recorder. The active disc recorder is the recorder where a burn will occur when RecordDisc is called.
     * @param {IDiscRecorder} pRecorder Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscrecorder">IDiscRecorder</a> interface of a disc recorder object. This pointer should have been returned by a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders">EnumDiscRecorders</a>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-setactivediscrecorder
     */
    SetActiveDiscRecorder(pRecorder) {
        result := ComCall(9, this, "ptr", pRecorder, "HRESULT")
        return result
    }

    /**
     * Clears the contents of an unburned image (the current stash file).
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-clearformatcontent
     */
    ClearFormatContent() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Registers an application for progress notifications.
     * @param {IDiscMasterProgressEvents} pEvents Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nn-imapi-idiscmasterprogressevents">IDiscMasterProgressEvents</a> interface that receives the progress notifications.
     * @returns {Pointer} Uniquely identifies this registration. Save this value because it will be needed by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-progressunadvise">ProgressUnadvise</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-progressadvise
     */
    ProgressAdvise(pEvents) {
        result := ComCall(11, this, "ptr", pEvents, "ptr*", &pvCookie := 0, "HRESULT")
        return pvCookie
    }

    /**
     * Cancels progress notifications for an application.
     * @param {Pointer} vCookie Value returned by a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-progressadvise">ProgressAdvise</a> method.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-progressunadvise
     */
    ProgressUnadvise(vCookie) {
        result := ComCall(12, this, "ptr", vCookie, "HRESULT")
        return result
    }

    /**
     * Burns the staged image to media in the active disc recorder.
     * @param {Integer} bSimulate Indicates whether the media is burned. If this parameter is <b>TRUE</b>, media in the active disc recorder is not actually burned. Instead, a simulated burn is performed. The simulation is a good test of a disc recorder, because most of the operations are performed as in a real burn. If this parameter is <b>FALSE</b>, then the media in the recorder is actually burned.
     * @param {Integer} bEjectAfterBurn Indicates whether to eject the media after the burn. If this parameter is <b>TRUE</b>, the media is ejected. If this parameter is <b>FALSE</b>, the media is not ejected.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-recorddisc
     */
    RecordDisc(bSimulate, bEjectAfterBurn) {
        result := ComCall(13, this, "char", bSimulate, "char", bEjectAfterBurn, "HRESULT")
        return result
    }

    /**
     * Closes the interface so other applications can use it.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscmaster-close
     */
    Close() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
