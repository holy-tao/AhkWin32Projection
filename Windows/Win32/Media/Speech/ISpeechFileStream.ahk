#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\SpeechStreamFileMode.ahk" { SpeechStreamFileMode }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechFileStream extends ISpeechBaseStream {
    /**
     * The interface identifier for ISpeechFileStream
     * @type {Guid}
     */
    static IID := Guid("{af67f125-ab39-4e93-b4a2-cc2e66e182a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechFileStream interfaces
    */
    struct Vtbl extends ISpeechBaseStream.Vtbl {
        Open  : IntPtr
        Close : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechFileStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} FileName 
     * @param {SpeechStreamFileMode} FileMode 
     * @param {VARIANT_BOOL} DoEvents 
     * @returns {HRESULT} 
     */
    Open(FileName, FileMode, DoEvents) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(12, this, BSTR, FileName, SpeechStreamFileMode, FileMode, VARIANT_BOOL, DoEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechFileStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 4)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
    }
}
