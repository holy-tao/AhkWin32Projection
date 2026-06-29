#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechCustomStream extends ISpeechBaseStream {
    /**
     * The interface identifier for ISpeechCustomStream
     * @type {Guid}
     */
    static IID := Guid("{1a9e9f4f-104f-4db8-a115-efd7fd0c97ae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechCustomStream interfaces
    */
    struct Vtbl extends ISpeechBaseStream.Vtbl {
        get_BaseStream    : IntPtr
        putref_BaseStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechCustomStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    BaseStream {
        get => this.get_BaseStream()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_BaseStream() {
        result := ComCall(12, this, "ptr*", &ppUnkStream := 0, "HRESULT")
        return IUnknown(ppUnkStream)
    }

    /**
     * 
     * @param {IUnknown} pUnkStream 
     * @returns {HRESULT} 
     */
    putref_BaseStream(pUnkStream) {
        result := ComCall(13, this, "ptr", pUnkStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechCustomStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BaseStream := CallbackCreate(GetMethod(implObj, "get_BaseStream"), flags, 2)
        this.vtbl.putref_BaseStream := CallbackCreate(GetMethod(implObj, "putref_BaseStream"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BaseStream)
        CallbackFree(this.vtbl.putref_BaseStream)
    }
}
