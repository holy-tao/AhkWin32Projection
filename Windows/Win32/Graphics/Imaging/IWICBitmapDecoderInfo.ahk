#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapCodecInfo.ahk" { IWICBitmapCodecInfo }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IWICBitmapDecoder.ahk" { IWICBitmapDecoder }

/**
 * Exposes methods that provide information about a decoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapdecoderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapDecoderInfo extends IWICBitmapCodecInfo {
    /**
     * The interface identifier for IWICBitmapDecoderInfo
     * @type {Guid}
     */
    static IID := Guid("{d8cd007f-d08f-4191-9bfc-236ea7f0e4b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapDecoderInfo interfaces
    */
    struct Vtbl extends IWICBitmapCodecInfo.Vtbl {
        GetPatterns    : IntPtr
        MatchesPattern : IntPtr
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapDecoderInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the file pattern signatures supported by the decoder.
     * @remarks
     * To retrieve all pattern signatures, this method should first be called with <i>pPatterns</i> set to <c>NULL</c> to retrieve the actual buffer size needed through <i>pcbPatternsActual</i>.
     *                Once the needed buffer size is known, allocate a buffer of the needed size and call <b>GetPatterns</b> again with the allocated buffer.
     * @param {Integer} cbSizePatterns Type: <b>UINT</b>
     * 
     * The array size of the <i>pPatterns</i> array.
     * @param {Integer} pPatterns Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmappattern">WICBitmapPattern</a>*</b>
     * 
     * Receives a list of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicbitmappattern">WICBitmapPattern</a> objects supported by the decoder.
     * @param {Pointer<Integer>} pcPatterns Type: <b>UINT*</b>
     * 
     * Receives the number of patterns the decoder supports.
     * @param {Pointer<Integer>} pcbPatternsActual Type: <b>UINT*</b>
     * 
     * Receives the actual buffer size needed to retrieve all pattern signatures supported by the decoder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-getpatterns
     */
    GetPatterns(cbSizePatterns, pPatterns, pcPatterns, pcbPatternsActual) {
        pcPatternsMarshal := pcPatterns is VarRef ? "uint*" : "ptr"
        pcbPatternsActualMarshal := pcbPatternsActual is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", cbSizePatterns, "ptr", pPatterns, pcPatternsMarshal, pcPatterns, pcbPatternsActualMarshal, pcbPatternsActual, "HRESULT")
        return result
    }

    /**
     * Retrieves a value that indicates whether the codec recognizes the pattern within a specified stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to pattern match within.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer that receives <b>TRUE</b> if the patterns match; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-matchespattern
     */
    MatchesPattern(pIStream) {
        result := ComCall(24, this, "ptr", pIStream, BOOL.Ptr, &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * Creates a new IWICBitmapDecoder instance.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(25, this, "ptr*", &ppIBitmapDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIBitmapDecoder)
    }

    Query(iid) {
        if (IWICBitmapDecoderInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPatterns := CallbackCreate(GetMethod(implObj, "GetPatterns"), flags, 5)
        this.vtbl.MatchesPattern := CallbackCreate(GetMethod(implObj, "MatchesPattern"), flags, 3)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPatterns)
        CallbackFree(this.vtbl.MatchesPattern)
        CallbackFree(this.vtbl.CreateInstance)
    }
}
