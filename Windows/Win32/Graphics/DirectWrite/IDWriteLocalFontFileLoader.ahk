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
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getfilepathlengthfromkey
     */
    GetFilePathLengthFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(4, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "uint*", &filePathLength := 0, "HRESULT")
        return filePathLength
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {PWSTR} filePath 
     * @param {Integer} filePathSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getfilepathfromkey
     */
    GetFilePathFromKey(fontFileReferenceKey, fontFileReferenceKeySize, filePath, filePathSize) {
        filePath := filePath is String ? StrPtr(filePath) : filePath

        result := ComCall(5, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", filePath, "uint", filePathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritelocalfontfileloader-getlastwritetimefromkey
     */
    GetLastWriteTimeFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        lastWriteTime := FILETIME()
        result := ComCall(6, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr", lastWriteTime, "HRESULT")
        return lastWriteTime
    }
}
