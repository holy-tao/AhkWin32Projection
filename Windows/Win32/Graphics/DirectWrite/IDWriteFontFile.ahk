#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontFileLoader.ahk
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
     * Obtains the pointer to the reference key of a font file. The returned pointer is valid until the font file object is released.
     * @param {Pointer<Pointer<Void>>} fontFileReferenceKey Type: <b>const void**</b>
     * 
     * When this method returns, contains an address of  a pointer to the font file reference key. Note that the pointer value is only valid until the font file object it is obtained from is released. This parameter is passed uninitialized.
     * @param {Pointer<Integer>} fontFileReferenceKeySize Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the size of the font file reference key in bytes. This parameter is passed uninitialized.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfile-getreferencekey
     */
    GetReferenceKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        fontFileReferenceKeyMarshal := fontFileReferenceKey is VarRef ? "ptr*" : "ptr"
        fontFileReferenceKeySizeMarshal := fontFileReferenceKeySize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, fontFileReferenceKeyMarshal, fontFileReferenceKey, fontFileReferenceKeySizeMarshal, fontFileReferenceKeySize, "HRESULT")
        return result
    }

    /**
     * Obtains the file loader associated with a font file object.
     * @returns {IDWriteFontFileLoader} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader">IDWriteFontFileLoader</a>**</b>
     * 
     * When this method returns, contains the address of  a pointer to the font file loader associated with the font file object.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfile-getloader
     */
    GetLoader() {
        result := ComCall(4, this, "ptr*", &fontFileLoader := 0, "HRESULT")
        return IDWriteFontFileLoader(fontFileLoader)
    }

    /**
     * Analyzes a file and returns whether it represents a font, and whether the font type is supported by the font system.
     * @param {Pointer<BOOL>} isSupportedFontType Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if the font type is supported by the font system; otherwise, <b>FALSE</b>.
     * @param {Pointer<Integer>} fontFileType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_file_type">DWRITE_FONT_FILE_TYPE</a>*</b>
     * 
     * When this method returns, contains a value that indicates the type of the font file. Note that even if <i> isSupportedFontType</i> is <b>FALSE</b>,
     *      the <i>fontFileType</i> value may be different from <b>DWRITE_FONT_FILE_TYPE_UNKNOWN</b>.
     * @param {Pointer<Integer>} fontFaceType Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_face_type">DWRITE_FONT_FACE_TYPE</a>*</b>
     * 
     * When this method returns, contains a value that indicates the type of the font face. If <i>fontFileType</i> is not equal to <b>DWRITE_FONT_FILE_TYPE_UNKNOWN</b>, then that can be constructed from the font file.
     * @param {Pointer<Integer>} numberOfFaces Type: <b>UINT32*</b>
     * 
     * When this method returns, contains the number of font faces contained in the font file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritefontfile-analyze
     */
    Analyze(isSupportedFontType, fontFileType, fontFaceType, numberOfFaces) {
        isSupportedFontTypeMarshal := isSupportedFontType is VarRef ? "int*" : "ptr"
        fontFileTypeMarshal := fontFileType is VarRef ? "int*" : "ptr"
        fontFaceTypeMarshal := fontFaceType is VarRef ? "int*" : "ptr"
        numberOfFacesMarshal := numberOfFaces is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, isSupportedFontTypeMarshal, isSupportedFontType, fontFileTypeMarshal, fontFileType, fontFaceTypeMarshal, fontFaceType, numberOfFacesMarshal, numberOfFaces, "HRESULT")
        return result
    }
}
