#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechWaveFormatEx extends IDispatch {
    /**
     * The interface identifier for ISpeechWaveFormatEx
     * @type {Guid}
     */
    static IID := Guid("{7a1ef0d5-1581-4741-88e4-209a49f11a10}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechWaveFormatEx interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_FormatTag      : IntPtr
        put_FormatTag      : IntPtr
        get_Channels       : IntPtr
        put_Channels       : IntPtr
        get_SamplesPerSec  : IntPtr
        put_SamplesPerSec  : IntPtr
        get_AvgBytesPerSec : IntPtr
        put_AvgBytesPerSec : IntPtr
        get_BlockAlign     : IntPtr
        put_BlockAlign     : IntPtr
        get_BitsPerSample  : IntPtr
        put_BitsPerSample  : IntPtr
        get_ExtraData      : IntPtr
        put_ExtraData      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechWaveFormatEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    FormatTag {
        get => this.get_FormatTag()
        set => this.put_FormatTag(value)
    }

    /**
     * @type {Integer} 
     */
    Channels {
        get => this.get_Channels()
        set => this.put_Channels(value)
    }

    /**
     * @type {Integer} 
     */
    SamplesPerSec {
        get => this.get_SamplesPerSec()
        set => this.put_SamplesPerSec(value)
    }

    /**
     * @type {Integer} 
     */
    AvgBytesPerSec {
        get => this.get_AvgBytesPerSec()
        set => this.put_AvgBytesPerSec(value)
    }

    /**
     * @type {Integer} 
     */
    BlockAlign {
        get => this.get_BlockAlign()
        set => this.put_BlockAlign(value)
    }

    /**
     * @type {Integer} 
     */
    BitsPerSample {
        get => this.get_BitsPerSample()
        set => this.put_BitsPerSample(value)
    }

    /**
     * @type {VARIANT} 
     */
    ExtraData {
        get => this.get_ExtraData()
        set => this.put_ExtraData(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FormatTag() {
        result := ComCall(7, this, "short*", &FormatTag := 0, "HRESULT")
        return FormatTag
    }

    /**
     * 
     * @param {Integer} FormatTag 
     * @returns {HRESULT} 
     */
    put_FormatTag(FormatTag) {
        result := ComCall(8, this, "short", FormatTag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Channels() {
        result := ComCall(9, this, "short*", &Channels := 0, "HRESULT")
        return Channels
    }

    /**
     * 
     * @param {Integer} Channels 
     * @returns {HRESULT} 
     */
    put_Channels(Channels) {
        result := ComCall(10, this, "short", Channels, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SamplesPerSec() {
        result := ComCall(11, this, "int*", &SamplesPerSec := 0, "HRESULT")
        return SamplesPerSec
    }

    /**
     * 
     * @param {Integer} SamplesPerSec 
     * @returns {HRESULT} 
     */
    put_SamplesPerSec(SamplesPerSec) {
        result := ComCall(12, this, "int", SamplesPerSec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AvgBytesPerSec() {
        result := ComCall(13, this, "int*", &AvgBytesPerSec := 0, "HRESULT")
        return AvgBytesPerSec
    }

    /**
     * 
     * @param {Integer} AvgBytesPerSec 
     * @returns {HRESULT} 
     */
    put_AvgBytesPerSec(AvgBytesPerSec) {
        result := ComCall(14, this, "int", AvgBytesPerSec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BlockAlign() {
        result := ComCall(15, this, "short*", &BlockAlign := 0, "HRESULT")
        return BlockAlign
    }

    /**
     * 
     * @param {Integer} BlockAlign 
     * @returns {HRESULT} 
     */
    put_BlockAlign(BlockAlign) {
        result := ComCall(16, this, "short", BlockAlign, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerSample() {
        result := ComCall(17, this, "short*", &BitsPerSample := 0, "HRESULT")
        return BitsPerSample
    }

    /**
     * 
     * @param {Integer} BitsPerSample 
     * @returns {HRESULT} 
     */
    put_BitsPerSample(BitsPerSample) {
        result := ComCall(18, this, "short", BitsPerSample, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ExtraData() {
        ExtraData := VARIANT()
        result := ComCall(19, this, VARIANT.Ptr, ExtraData, "HRESULT")
        return ExtraData
    }

    /**
     * 
     * @param {VARIANT} ExtraData 
     * @returns {HRESULT} 
     */
    put_ExtraData(ExtraData) {
        result := ComCall(20, this, VARIANT, ExtraData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechWaveFormatEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FormatTag := CallbackCreate(GetMethod(implObj, "get_FormatTag"), flags, 2)
        this.vtbl.put_FormatTag := CallbackCreate(GetMethod(implObj, "put_FormatTag"), flags, 2)
        this.vtbl.get_Channels := CallbackCreate(GetMethod(implObj, "get_Channels"), flags, 2)
        this.vtbl.put_Channels := CallbackCreate(GetMethod(implObj, "put_Channels"), flags, 2)
        this.vtbl.get_SamplesPerSec := CallbackCreate(GetMethod(implObj, "get_SamplesPerSec"), flags, 2)
        this.vtbl.put_SamplesPerSec := CallbackCreate(GetMethod(implObj, "put_SamplesPerSec"), flags, 2)
        this.vtbl.get_AvgBytesPerSec := CallbackCreate(GetMethod(implObj, "get_AvgBytesPerSec"), flags, 2)
        this.vtbl.put_AvgBytesPerSec := CallbackCreate(GetMethod(implObj, "put_AvgBytesPerSec"), flags, 2)
        this.vtbl.get_BlockAlign := CallbackCreate(GetMethod(implObj, "get_BlockAlign"), flags, 2)
        this.vtbl.put_BlockAlign := CallbackCreate(GetMethod(implObj, "put_BlockAlign"), flags, 2)
        this.vtbl.get_BitsPerSample := CallbackCreate(GetMethod(implObj, "get_BitsPerSample"), flags, 2)
        this.vtbl.put_BitsPerSample := CallbackCreate(GetMethod(implObj, "put_BitsPerSample"), flags, 2)
        this.vtbl.get_ExtraData := CallbackCreate(GetMethod(implObj, "get_ExtraData"), flags, 2)
        this.vtbl.put_ExtraData := CallbackCreate(GetMethod(implObj, "put_ExtraData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FormatTag)
        CallbackFree(this.vtbl.put_FormatTag)
        CallbackFree(this.vtbl.get_Channels)
        CallbackFree(this.vtbl.put_Channels)
        CallbackFree(this.vtbl.get_SamplesPerSec)
        CallbackFree(this.vtbl.put_SamplesPerSec)
        CallbackFree(this.vtbl.get_AvgBytesPerSec)
        CallbackFree(this.vtbl.put_AvgBytesPerSec)
        CallbackFree(this.vtbl.get_BlockAlign)
        CallbackFree(this.vtbl.put_BlockAlign)
        CallbackFree(this.vtbl.get_BitsPerSample)
        CallbackFree(this.vtbl.put_BitsPerSample)
        CallbackFree(this.vtbl.get_ExtraData)
        CallbackFree(this.vtbl.put_ExtraData)
    }
}
