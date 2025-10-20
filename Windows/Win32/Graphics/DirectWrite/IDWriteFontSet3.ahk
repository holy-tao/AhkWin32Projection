#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFontSet2.ahk

/**
 * Represents a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontset3
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet3 extends IDWriteFontSet2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet3
     * @type {Guid}
     */
    static IID => Guid("{7c073ef2-a7f4-4045-8c32-8ab8ae640f90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFontSourceType", "GetFontSourceNameLength", "GetFontSourceName"]

    /**
     * 
     * @param {Integer} fontIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcetype
     */
    GetFontSourceType(fontIndex) {
        result := ComCall(27, this, "uint", fontIndex, "int")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcenamelength
     */
    GetFontSourceNameLength(listIndex) {
        result := ComCall(28, this, "uint", listIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} listIndex 
     * @param {PWSTR} stringBuffer 
     * @param {Integer} stringBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset3-getfontsourcename
     */
    GetFontSourceName(listIndex, stringBuffer, stringBufferSize) {
        stringBuffer := stringBuffer is String ? StrPtr(stringBuffer) : stringBuffer

        result := ComCall(29, this, "uint", listIndex, "ptr", stringBuffer, "uint", stringBufferSize, "HRESULT")
        return result
    }
}
