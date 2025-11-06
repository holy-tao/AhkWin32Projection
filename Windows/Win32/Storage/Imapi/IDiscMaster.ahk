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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-open
     */
    Open() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumDiscMasterFormats} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-enumdiscmasterformats
     */
    EnumDiscMasterFormats() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiscMasterFormats(ppEnum)
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-getactivediscmasterformat
     */
    GetActiveDiscMasterFormat() {
        lpiid := Guid()
        result := ComCall(5, this, "ptr", lpiid, "HRESULT")
        return lpiid
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-setactivediscmasterformat
     */
    SetActiveDiscMasterFormat(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * 
     * @returns {IEnumDiscRecorders} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders
     */
    EnumDiscRecorders() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiscRecorders(ppEnum)
    }

    /**
     * 
     * @returns {IDiscRecorder} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-getactivediscrecorder
     */
    GetActiveDiscRecorder() {
        result := ComCall(8, this, "ptr*", &ppRecorder := 0, "HRESULT")
        return IDiscRecorder(ppRecorder)
    }

    /**
     * 
     * @param {IDiscRecorder} pRecorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-setactivediscrecorder
     */
    SetActiveDiscRecorder(pRecorder) {
        result := ComCall(9, this, "ptr", pRecorder, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-clearformatcontent
     */
    ClearFormatContent() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscMasterProgressEvents} pEvents 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-progressadvise
     */
    ProgressAdvise(pEvents) {
        result := ComCall(11, this, "ptr", pEvents, "ptr*", &pvCookie := 0, "HRESULT")
        return pvCookie
    }

    /**
     * 
     * @param {Pointer} vCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-progressunadvise
     */
    ProgressUnadvise(vCookie) {
        result := ComCall(12, this, "ptr", vCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bSimulate 
     * @param {Integer} bEjectAfterBurn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-recorddisc
     */
    RecordDisc(bSimulate, bEjectAfterBurn) {
        result := ComCall(13, this, "char", bSimulate, "char", bEjectAfterBurn, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-close
     */
    Close() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
