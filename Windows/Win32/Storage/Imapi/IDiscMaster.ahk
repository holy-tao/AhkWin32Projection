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
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDiscMasterFormats>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumDiscMasterFormats(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} lpiid 
     * @returns {HRESULT} 
     */
    GetActiveDiscMasterFormat(lpiid) {
        result := ComCall(5, this, "ptr", lpiid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    SetActiveDiscMasterFormat(riid, ppUnk) {
        result := ComCall(6, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumDiscRecorders>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumDiscRecorders(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder>} ppRecorder 
     * @returns {HRESULT} 
     */
    GetActiveDiscRecorder(ppRecorder) {
        result := ComCall(8, this, "ptr", ppRecorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder>} pRecorder 
     * @returns {HRESULT} 
     */
    SetActiveDiscRecorder(pRecorder) {
        result := ComCall(9, this, "ptr", pRecorder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearFormatContent() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDiscMasterProgressEvents>} pEvents 
     * @param {Pointer<UIntPtr>} pvCookie 
     * @returns {HRESULT} 
     */
    ProgressAdvise(pEvents, pvCookie) {
        result := ComCall(11, this, "ptr", pEvents, "ptr*", pvCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} vCookie 
     * @returns {HRESULT} 
     */
    ProgressUnadvise(vCookie) {
        result := ComCall(12, this, "ptr", vCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bSimulate 
     * @param {Integer} bEjectAfterBurn 
     * @returns {HRESULT} 
     */
    RecordDisc(bSimulate, bEjectAfterBurn) {
        result := ComCall(13, this, "char", bSimulate, "char", bEjectAfterBurn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
