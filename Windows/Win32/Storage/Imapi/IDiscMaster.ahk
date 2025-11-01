#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IEnumDiscMasterFormats>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-enumdiscmasterformats
     */
    EnumDiscMasterFormats(ppEnum) {
        result := ComCall(4, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpiid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-getactivediscmasterformat
     */
    GetActiveDiscMasterFormat(lpiid) {
        result := ComCall(5, this, "ptr", lpiid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-setactivediscmasterformat
     */
    SetActiveDiscMasterFormat(riid, ppUnk) {
        result := ComCall(6, this, "ptr", riid, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDiscRecorders>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders
     */
    EnumDiscRecorders(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder>} ppRecorder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-getactivediscrecorder
     */
    GetActiveDiscRecorder(ppRecorder) {
        result := ComCall(8, this, "ptr*", ppRecorder, "HRESULT")
        return result
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
     * @param {Pointer<Pointer>} pvCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmaster-progressadvise
     */
    ProgressAdvise(pEvents, pvCookie) {
        pvCookieMarshal := pvCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", pEvents, pvCookieMarshal, pvCookie, "HRESULT")
        return result
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
