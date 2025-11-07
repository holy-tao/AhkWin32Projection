#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IDWriteFontSet1.ahk

/**
 * Represents a font set.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwritefontset2
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontSet2 extends IDWriteFontSet1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontSet2
     * @type {Guid}
     */
    static IID => Guid("{dc7ead19-e54c-43af-b2da-4e2b79ba3f7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExpirationEvent"]

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset2-getexpirationevent
     */
    GetExpirationEvent() {
        result := ComCall(26, this, "ptr")
        return HANDLE({Value: result}, True)
    }
}
