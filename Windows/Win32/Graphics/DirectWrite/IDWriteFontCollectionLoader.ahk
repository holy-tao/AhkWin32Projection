#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to construct a collection of fonts given a particular type of key.
 * @remarks
 * 
  * The font collection loader interface is recommended to be implemented by a singleton object. Note that font collection loader implementations must not register themselves with DirectWrite factory inside their constructors and must not unregister themselves in their destructors, because registration and unregistraton operations increment and decrement the object reference count respectively. Instead, registration and unregistration of font file loaders with DirectWrite factory should be performed outside of the font file loader implementation as a separate step.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/nn-dwrite-idwritefontcollectionloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteFontCollectionLoader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteFontCollectionLoader
     * @type {Guid}
     */
    static IID => Guid("{cca920e4-52f0-492b-bfa8-29c72ee0a468}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateEnumeratorFromKey"]

    /**
     * 
     * @param {IDWriteFactory} factory 
     * @param {Pointer} collectionKey 
     * @param {Integer} collectionKeySize 
     * @param {Pointer<IDWriteFontFileEnumerator>} fontFileEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollectionloader-createenumeratorfromkey
     */
    CreateEnumeratorFromKey(factory, collectionKey, collectionKeySize, fontFileEnumerator) {
        result := ComCall(3, this, "ptr", factory, "ptr", collectionKey, "uint", collectionKeySize, "ptr*", fontFileEnumerator, "HRESULT")
        return result
    }
}
