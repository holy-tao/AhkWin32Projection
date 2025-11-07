#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextCueList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a track of timed text.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imftimedtexttrack
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextTrack extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetLabel", "SetLabel", "GetLanguage", "GetTrackKind", "IsInBand", "GetInBandMetadataTrackDispatchType", "IsActive", "GetErrorCode", "GetExtendedErrorCode", "GetDataFormat", "GetReadyState", "GetCueList"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getid
     */
    GetId() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlabel
     */
    GetLabel() {
        result := ComCall(4, this, "ptr*", &label := 0, "HRESULT")
        return label
    }

    /**
     * 
     * @param {PWSTR} label 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-setlabel
     */
    SetLabel(label) {
        label := label is String ? StrPtr(label) : label

        result := ComCall(5, this, "ptr", label, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getlanguage
     */
    GetLanguage() {
        result := ComCall(6, this, "ptr*", &language := 0, "HRESULT")
        return language
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-gettrackkind
     */
    GetTrackKind() {
        result := ComCall(7, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isinband
     */
    IsInBand() {
        result := ComCall(8, this, "int")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getinbandmetadatatrackdispatchtype
     */
    GetInBandMetadataTrackDispatchType() {
        result := ComCall(9, this, "ptr*", &dispatchType := 0, "HRESULT")
        return dispatchType
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-isactive
     */
    IsActive() {
        result := ComCall(10, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-geterrorcode
     */
    GetErrorCode() {
        result := ComCall(11, this, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getextendederrorcode
     */
    GetExtendedErrorCode() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imftimedtexttrack-getdataformat
     */
    GetDataFormat() {
        format := Guid()
        result := ComCall(13, this, "ptr", format, "HRESULT")
        return format
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
     * @returns {IMFTimedTextCueList} 
     */
    GetCueList() {
        result := ComCall(15, this, "ptr*", &cues := 0, "HRESULT")
        return IMFTimedTextCueList(cues)
    }
}
