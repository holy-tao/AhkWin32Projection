#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a track of timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtexttrack
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextTrack extends IUnknown{
    /**
     * The interface identifier for IMFTimedTextTrack
     * @type {Guid}
     */
    static IID => Guid("{8822c32d-654e-4233-bf21-d7f2e67d30d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} label 
     * @returns {HRESULT} 
     */
    GetLabel(label) {
        result := ComCall(4, this, "ptr", label, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} label 
     * @returns {HRESULT} 
     */
    SetLabel(label) {
        label := label is String ? StrPtr(label) : label

        result := ComCall(5, this, "ptr", label, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} language 
     * @returns {HRESULT} 
     */
    GetLanguage(language) {
        result := ComCall(6, this, "ptr", language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTrackKind() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsInBand() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} dispatchType 
     * @returns {HRESULT} 
     */
    GetInBandMetadataTrackDispatchType(dispatchType) {
        result := ComCall(9, this, "ptr", dispatchType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsActive() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetErrorCode() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetExtendedErrorCode() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} format 
     * @returns {HRESULT} 
     */
    GetDataFormat(format) {
        result := ComCall(13, this, "ptr", format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReadyState() {
        result := ComCall(14, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFTimedTextCueList>} cues 
     * @returns {HRESULT} 
     */
    GetCueList(cues) {
        result := ComCall(15, this, "ptr", cues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
