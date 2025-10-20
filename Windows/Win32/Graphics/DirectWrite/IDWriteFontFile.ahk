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
     * 
     * @param {Pointer<Void>} fontFileReferenceKey 
     * @param {Pointer<UInt32>} fontFileReferenceKeySize 
     * @returns {HRESULT} 
     */
    GetReferenceKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(3, this, "ptr", fontFileReferenceKey, "uint*", fontFileReferenceKeySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDWriteFontFileLoader>} fontFileLoader 
     * @returns {HRESULT} 
     */
    GetLoader(fontFileLoader) {
        result := ComCall(4, this, "ptr", fontFileLoader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isSupportedFontType 
     * @param {Pointer<Int32>} fontFileType 
     * @param {Pointer<Int32>} fontFaceType 
     * @param {Pointer<UInt32>} numberOfFaces 
     * @returns {HRESULT} 
     */
    Analyze(isSupportedFontType, fontFileType, fontFaceType, numberOfFaces) {
        result := ComCall(5, this, "ptr", isSupportedFontType, "int*", fontFileType, "int*", fontFaceType, "uint*", numberOfFaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
