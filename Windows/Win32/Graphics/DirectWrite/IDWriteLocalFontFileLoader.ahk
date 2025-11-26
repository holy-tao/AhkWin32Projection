#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IDWriteFontFileLoader.ahk

/**
 * A built-in implementation of the IDWriteFontFileLoader interface, that operates on local font files and exposes local font file information from the font file reference key.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritelocalfontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteLocalFontFileLoader extends IDWriteFontFileLoader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteLocalFontFileLoader
     * @type {Guid}
     */
    static IID => Guid("{b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFilePathLengthFromKey", "GetFilePathFromKey", "GetLastWriteTimeFromKey"]

    /**
     * Obtains the length of the absolute file path from the font file reference key.
     * @param {Pointer} fontFileReferenceKey Type: <b>const void*</b>
     * 
     * Font file reference key that uniquely identifies the local font file
     *     within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * Size of font file reference key in bytes.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * Length of the file path string, not including the terminated <b>NULL</b> character.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalfontfileloader-getfilepathlengthfromkey
     */
    GetFilePathLengthFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "uint*", &filePathLength := 0, "HRESULT")
        return filePathLength
    }

    /**
     * Obtains the absolute font file path from the font file reference key.
     * @param {Pointer} fontFileReferenceKey Type: <b>const void*</b>
     * 
     * The font file reference key that uniquely identifies the local font file
     *     within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * The size of font file reference key in bytes.
     * @param {PWSTR} filePath Type: <b>WCHAR*</b>
     * 
     * The character array that receives the local file path.
     * @param {Integer} filePathSize Type: <b>UINT32</b>
     * 
     * The length of the file path character array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalfontfileloader-getfilepathfromkey
     */
    GetFilePathFromKey(fontFileReferenceKey, fontFileReferenceKeySize, filePath, filePathSize) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", filePath, "uint", filePathSize, "HRESULT")
        return result
    }

    /**
     * Obtains the last write time of the file from the font file reference key.
     * @param {Pointer} fontFileReferenceKey Type: <b>const void*</b>
     * 
     * The font file reference key that uniquely identifies the local font file
     *     within the scope of the font loader being used.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * The size of font file reference key in bytes.
     * @returns {FILETIME} Type: <b>FILETIME*</b>
     * 
     * The time of the last font file modification.
     * @see https://docs.microsoft.com/windows/win32/api//dwrite/nf-dwrite-idwritelocalfontfileloader-getlastwritetimefromkey
     */
    GetLastWriteTimeFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        lastWriteTime := FILETIME()
        result := ComCall(6, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", lastWriteTime, "HRESULT")
        return lastWriteTime
    }
}
