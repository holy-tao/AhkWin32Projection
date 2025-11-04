#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a font file. Applications such as font managers or font viewers can call IDWriteFontFile::Analyze to find out if a particular file is a font file, and whether it is a font type that is supported by the font system.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfile
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFile
     * @type {Guid}
     */
    static IID => Guid("{739d886a-cef5-47dc-8769-1a8b41bebbb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetReferenceKey", "GetLoader", "Analyze"]

    /**
     * 
     * @param {Pointer<Pointer<Void>>} fontFileReferenceKey 
     * @param {Pointer<Integer>} fontFileReferenceKeySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfile-getreferencekey
     */
    GetReferenceKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        fontFileReferenceKeyMarshal := fontFileReferenceKey is VarRef ? "ptr*" : "ptr"
        fontFileReferenceKeySizeMarshal := fontFileReferenceKeySize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, fontFileReferenceKeyMarshal, fontFileReferenceKey, fontFileReferenceKeySizeMarshal, fontFileReferenceKeySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFileLoader>} fontFileLoader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfile-getloader
     */
    GetLoader(fontFileLoader) {
        result := ComCall(4, this, "ptr*", fontFileLoader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isSupportedFontType 
     * @param {Pointer<Integer>} fontFileType 
     * @param {Pointer<Integer>} fontFaceType 
     * @param {Pointer<Integer>} numberOfFaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfile-analyze
     */
    Analyze(isSupportedFontType, fontFileType, fontFaceType, numberOfFaces) {
        fontFileTypeMarshal := fontFileType is VarRef ? "int*" : "ptr"
        fontFaceTypeMarshal := fontFaceType is VarRef ? "int*" : "ptr"
        numberOfFacesMarshal := numberOfFaces is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", isSupportedFontType, fontFileTypeMarshal, fontFileType, fontFaceTypeMarshal, fontFaceType, numberOfFacesMarshal, numberOfFaces, "HRESULT")
        return result
    }
}
