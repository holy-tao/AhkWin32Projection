#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SpeechStreamSeekPositionType.ahk" { SpeechStreamSeekPositionType }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISpeechAudioFormat.ahk" { ISpeechAudioFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechBaseStream extends IDispatch {
    /**
     * The interface identifier for ISpeechBaseStream
     * @type {Guid}
     */
    static IID := Guid("{6450336f-7d49-4ced-8097-49d6dee37294}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechBaseStream interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Format    : IntPtr
        putref_Format : IntPtr
        Read          : IntPtr
        Write         : IntPtr
        Seek          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechBaseStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechAudioFormat} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &AudioFormat := 0, "HRESULT")
        return ISpeechAudioFormat(AudioFormat)
    }

    /**
     * 
     * @param {ISpeechAudioFormat} AudioFormat 
     * @returns {HRESULT} 
     */
    putref_Format(AudioFormat) {
        result := ComCall(8, this, "ptr", AudioFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} _Buffer 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    Read(_Buffer, NumberOfBytes, BytesRead) {
        BytesReadMarshal := BytesRead is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, VARIANT.Ptr, _Buffer, "int", NumberOfBytes, BytesReadMarshal, BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} _Buffer 
     * @returns {Integer} 
     */
    Write(_Buffer) {
        result := ComCall(10, this, VARIANT, _Buffer, "int*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {VARIANT} Position 
     * @param {SpeechStreamSeekPositionType} Origin 
     * @returns {VARIANT} 
     */
    Seek(Position, Origin) {
        NewPosition := VARIANT()
        result := ComCall(11, this, VARIANT, Position, SpeechStreamSeekPositionType, Origin, VARIANT.Ptr, NewPosition, "HRESULT")
        return NewPosition
    }

    Query(iid) {
        if (ISpeechBaseStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Format := CallbackCreate(GetMethod(implObj, "get_Format"), flags, 2)
        this.vtbl.putref_Format := CallbackCreate(GetMethod(implObj, "putref_Format"), flags, 2)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 4)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 3)
        this.vtbl.Seek := CallbackCreate(GetMethod(implObj, "Seek"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Format)
        CallbackFree(this.vtbl.putref_Format)
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.Seek)
    }
}
