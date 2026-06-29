#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\SPFILEMODE.ahk" { SPFILEMODE }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpStream extends ISpStreamFormat {
    /**
     * The interface identifier for ISpStream
     * @type {Guid}
     */
    static IID := Guid("{12e3cca9-7518-44c5-a5e7-ba5a79cb929e}")

    /**
     * The class identifier for SpStream
     * @type {Guid}
     */
    static CLSID := Guid("{715d9c59-4442-11d2-9605-00c04f8ee628}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpStream interfaces
    */
    struct Vtbl extends ISpStreamFormat.Vtbl {
        SetBaseStream : IntPtr
        GetBaseStream : IntPtr
        BindToFile    : IntPtr
        Close         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Pointer<Guid>} rguidFormat 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetBaseStream(pStream, rguidFormat, pWaveFormatEx) {
        result := ComCall(15, this, "ptr", pStream, Guid.Ptr, rguidFormat, WAVEFORMATEX.Ptr, pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IStream} 
     */
    GetBaseStream() {
        result := ComCall(16, this, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * 
     * @param {PWSTR} pszFileName 
     * @param {SPFILEMODE} eMode 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Integer} ullEventInterest 
     * @returns {HRESULT} 
     */
    BindToFile(pszFileName, eMode, pFormatId, pWaveFormatEx, ullEventInterest) {
        pszFileName := pszFileName is String ? StrPtr(pszFileName) : pszFileName

        result := ComCall(17, this, "ptr", pszFileName, SPFILEMODE, eMode, Guid.Ptr, pFormatId, WAVEFORMATEX.Ptr, pWaveFormatEx, "uint", ullEventInterest, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBaseStream := CallbackCreate(GetMethod(implObj, "SetBaseStream"), flags, 4)
        this.vtbl.GetBaseStream := CallbackCreate(GetMethod(implObj, "GetBaseStream"), flags, 2)
        this.vtbl.BindToFile := CallbackCreate(GetMethod(implObj, "BindToFile"), flags, 6)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBaseStream)
        CallbackFree(this.vtbl.GetBaseStream)
        CallbackFree(this.vtbl.BindToFile)
        CallbackFree(this.vtbl.Close)
    }
}
