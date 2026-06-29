#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpStreamFormat.ahk" { ISpStreamFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpStreamFormatConverter extends ISpStreamFormat {
    /**
     * The interface identifier for ISpStreamFormatConverter
     * @type {Guid}
     */
    static IID := Guid("{678a932c-ea71-4446-9b41-78fda6280a29}")

    /**
     * The class identifier for SpStreamFormatConverter
     * @type {Guid}
     */
    static CLSID := Guid("{7013943a-e2ec-11d2-a086-00c04f8ef9b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpStreamFormatConverter interfaces
    */
    struct Vtbl extends ISpStreamFormat.Vtbl {
        SetBaseStream              : IntPtr
        GetBaseStream              : IntPtr
        SetFormat                  : IntPtr
        ResetSeekPosition          : IntPtr
        ScaleConvertedToBaseOffset : IntPtr
        ScaleBaseToConvertedOffset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpStreamFormatConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ISpStreamFormat} pStream 
     * @param {BOOL} fSetFormatToBaseStreamFormat 
     * @param {BOOL} fWriteToBaseStream 
     * @returns {HRESULT} 
     */
    SetBaseStream(pStream, fSetFormatToBaseStreamFormat, fWriteToBaseStream) {
        result := ComCall(15, this, "ptr", pStream, BOOL, fSetFormatToBaseStreamFormat, BOOL, fWriteToBaseStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpStreamFormat} 
     */
    GetBaseStream() {
        result := ComCall(16, this, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFormatIdOfConvertedStream 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatExOfConvertedStream 
     * @returns {HRESULT} 
     */
    SetFormat(rguidFormatIdOfConvertedStream, pWaveFormatExOfConvertedStream) {
        result := ComCall(17, this, Guid.Ptr, rguidFormatIdOfConvertedStream, WAVEFORMATEX.Ptr, pWaveFormatExOfConvertedStream, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetSeekPosition() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffsetConvertedStream 
     * @returns {Integer} 
     */
    ScaleConvertedToBaseOffset(ullOffsetConvertedStream) {
        result := ComCall(19, this, "uint", ullOffsetConvertedStream, "uint*", &pullOffsetBaseStream := 0, "HRESULT")
        return pullOffsetBaseStream
    }

    /**
     * 
     * @param {Integer} ullOffsetBaseStream 
     * @returns {Integer} 
     */
    ScaleBaseToConvertedOffset(ullOffsetBaseStream) {
        result := ComCall(20, this, "uint", ullOffsetBaseStream, "uint*", &pullOffsetConvertedStream := 0, "HRESULT")
        return pullOffsetConvertedStream
    }

    Query(iid) {
        if (ISpStreamFormatConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBaseStream := CallbackCreate(GetMethod(implObj, "SetBaseStream"), flags, 4)
        this.vtbl.GetBaseStream := CallbackCreate(GetMethod(implObj, "GetBaseStream"), flags, 2)
        this.vtbl.SetFormat := CallbackCreate(GetMethod(implObj, "SetFormat"), flags, 3)
        this.vtbl.ResetSeekPosition := CallbackCreate(GetMethod(implObj, "ResetSeekPosition"), flags, 1)
        this.vtbl.ScaleConvertedToBaseOffset := CallbackCreate(GetMethod(implObj, "ScaleConvertedToBaseOffset"), flags, 3)
        this.vtbl.ScaleBaseToConvertedOffset := CallbackCreate(GetMethod(implObj, "ScaleBaseToConvertedOffset"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBaseStream)
        CallbackFree(this.vtbl.GetBaseStream)
        CallbackFree(this.vtbl.SetFormat)
        CallbackFree(this.vtbl.ResetSeekPosition)
        CallbackFree(this.vtbl.ScaleConvertedToBaseOffset)
        CallbackFree(this.vtbl.ScaleBaseToConvertedOffset)
    }
}
