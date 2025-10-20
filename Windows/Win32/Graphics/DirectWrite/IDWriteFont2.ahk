#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDWriteFont1.ahk

/**
 * Represents a physical font in a font collection.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/nn-dwrite_2-idwritefont2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFont2 extends IDWriteFont1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFont2
     * @type {Guid}
     */
    static IID => Guid("{29748ed6-8c9c-4a6a-be0b-d912e8538944}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsColorFont"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefont2-iscolorfont
     */
    IsColorFont() {
        result := ComCall(18, this, "int")
        return result
    }
}
