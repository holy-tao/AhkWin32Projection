#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {HRESULT} 
     */
    GetCueByIndex(index, cue) {
        result := ComCall(4, this, "uint", index, "ptr*", cue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {HRESULT} 
     */
    GetCueById(id, cue) {
        result := ComCall(5, this, "uint", id, "ptr*", cue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} originalId 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {HRESULT} 
     */
    GetCueByOriginalId(originalId, cue) {
        originalId := originalId is String ? StrPtr(originalId) : originalId

        result := ComCall(6, this, "ptr", originalId, "ptr*", cue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} duration 
     * @param {PWSTR} text 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {HRESULT} 
     */
    AddTextCue(start, duration, text, cue) {
        text := text is String ? StrPtr(text) : text

        result := ComCall(7, this, "double", start, "double", duration, "ptr", text, "ptr*", cue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} start 
     * @param {Float} duration 
     * @param {Pointer} data 
     * @param {Integer} dataSize 
     * @param {Pointer<IMFTimedTextCue>} cue 
     * @returns {HRESULT} 
     */
    AddDataCue(start, duration, data, dataSize, cue) {
        result := ComCall(8, this, "double", start, "double", duration, "ptr", data, "uint", dataSize, "ptr*", cue, "HRESULT")
        return result
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
