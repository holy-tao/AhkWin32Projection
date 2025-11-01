#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles loading font file resources of a particular type from a font file reference key into a font file stream object.
 * @remarks
 * 
  * The font file loader interface is recommended to be implemented by a singleton object. Note that font file loader implementations must not register themselves with DirectWrite factory inside their constructors and must not unregister themselves in their destructors, because registration and unregistraton operations increment and decrement the object reference count respectively. Instead, registration and unregistration of font file loaders with DirectWrite factory should be performed outside of the font file loader implementation as a separate step.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontFileLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontFileLoader
     * @type {Guid}
     */
    static IID => Guid("{727cad4e-d6af-4c9e-8a08-d695b11caa49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStreamFromKey"]

    /**
     * 
     * @param {Pointer} fontFileReferenceKey 
     * @param {Integer} fontFileReferenceKeySize 
     * @param {Pointer<IDWriteFontFileStream>} fontFileStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileloader-createstreamfromkey
     */
    CreateStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize, fontFileStream) {
        result := ComCall(3, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr*", fontFileStream, "HRESULT")
        return result
    }
}
