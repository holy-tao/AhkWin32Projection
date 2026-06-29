#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFTimedTextCue.ahk" { IMFTimedTextCue }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextCueList extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextCueList
     * @type {Guid}
     */
    static IID := Guid("{ad128745-211b-40a0-9981-fe65f166d0fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextCueList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLength          : IntPtr
        GetCueByIndex      : IntPtr
        GetCueById         : IntPtr
        GetCueByOriginalId : IntPtr
        AddTextCue         : IntPtr
        AddDataCue         : IntPtr
        RemoveCue          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextCueList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(3, this, UInt32)
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
     * @param {Integer} data 
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

    Query(iid) {
        if (IMFTimedTextCueList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 1)
        this.vtbl.GetCueByIndex := CallbackCreate(GetMethod(implObj, "GetCueByIndex"), flags, 3)
        this.vtbl.GetCueById := CallbackCreate(GetMethod(implObj, "GetCueById"), flags, 3)
        this.vtbl.GetCueByOriginalId := CallbackCreate(GetMethod(implObj, "GetCueByOriginalId"), flags, 3)
        this.vtbl.AddTextCue := CallbackCreate(GetMethod(implObj, "AddTextCue"), flags, 5)
        this.vtbl.AddDataCue := CallbackCreate(GetMethod(implObj, "AddDataCue"), flags, 6)
        this.vtbl.RemoveCue := CallbackCreate(GetMethod(implObj, "RemoveCue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetCueByIndex)
        CallbackFree(this.vtbl.GetCueById)
        CallbackFree(this.vtbl.GetCueByOriginalId)
        CallbackFree(this.vtbl.AddTextCue)
        CallbackFree(this.vtbl.AddDataCue)
        CallbackFree(this.vtbl.RemoveCue)
    }
}
