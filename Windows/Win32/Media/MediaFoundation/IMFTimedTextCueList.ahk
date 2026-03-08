#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFTimedTextCue.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimedTextCueList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTimedTextCueList
     * @type {Guid}
     */
    static IID => Guid("{ad128745-211b-40a0-9981-fe65f166d0fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "GetCueByIndex", "GetCueById", "GetCueByOriginalId", "AddTextCue", "AddDataCue", "RemoveCue"]

    /**
     * Returns the length, in bytes, of a valid security identifier (SID).
     * @returns {Integer} If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is valid, the return value is the length, in bytes, of the <b>SID</b> structure.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure is not valid, the return value is undefined. Before calling <b>GetLengthSid</b>, pass the SID to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-isvalidsid">IsValidSid</a> function to verify that the SID is valid.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getlengthsid
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IMFTimedTextCue} 
     */
    GetCueByIndex(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &cue := 0, "HRESULT")
        return IMFTimedTextCue(cue)
    }

    /**
     * 
     * @param {Integer} id 
     * @returns {IMFTimedTextCue} 
     */
    GetCueById(id) {
        result := ComCall(5, this, "uint", id, "ptr*", &cue := 0, "HRESULT")
        return IMFTimedTextCue(cue)
    }

    /**
     * 
     * @param {PWSTR} originalId 
     * @returns {IMFTimedTextCue} 
     */
    GetCueByOriginalId(originalId) {
        originalId := originalId is String ? StrPtr(originalId) : originalId

        result := ComCall(6, this, "ptr", originalId, "ptr*", &cue := 0, "HRESULT")
        return IMFTimedTextCue(cue)
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} duration 
     * @param {PWSTR} text 
     * @returns {IMFTimedTextCue} 
     */
    AddTextCue(start, duration, text) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(7, this, "double", start, "double", duration, "ptr", text, "ptr*", &cue := 0, "HRESULT")
        return IMFTimedTextCue(cue)
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} duration 
     * @param {Pointer} data 
     * @param {Integer} dataSize 
     * @returns {IMFTimedTextCue} 
     */
    AddDataCue(start, duration, data, dataSize) {
        result := ComCall(8, this, "double", start, "double", duration, "ptr", data, "uint", dataSize, "ptr*", &cue := 0, "HRESULT")
        return IMFTimedTextCue(cue)
    }

    /**
     * 
     * @param {IMFTimedTextCue} cue 
     * @returns {HRESULT} 
     */
    RemoveCue(cue) {
        result := ComCall(9, this, "ptr", cue, "HRESULT")
        return result
    }
}
