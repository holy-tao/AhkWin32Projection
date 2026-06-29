#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFactory.ahk" { IDWriteFactory }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDWriteFontFileEnumerator.ahk" { IDWriteFontFileEnumerator }

/**
 * Used to construct a collection of fonts given a particular type of key.
 * @remarks
 * The font collection loader interface is recommended to be implemented by a singleton object. Note that font collection loader implementations must not register themselves with DirectWrite factory inside their constructors and must not unregister themselves in their destructors, because registration and unregistration operations increment and decrement the object reference count respectively. Instead, registration and unregistration of font file loaders with DirectWrite factory should be performed outside of the font file loader implementation as a separate step.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontcollectionloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontCollectionLoader extends IUnknown {
    /**
     * The interface identifier for IDWriteFontCollectionLoader
     * @type {Guid}
     */
    static IID := Guid("{cca920e4-52f0-492b-bfa8-29c72ee0a468}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontCollectionLoader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateEnumeratorFromKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontCollectionLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font file enumerator object that encapsulates a collection of font files. The font system calls back to this interface to create a font collection.
     * @param {IDWriteFactory} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefactory">IDWriteFactory</a> object that was used to create the current font collection.
     * @param {Integer} collectionKey Type: <b>const void*</b>
     * 
     * A font collection key that uniquely identifies the collection of font files within
     *      the scope of the font collection loader being used. The buffer allocated for this key must be at least  the size, in bytes, specified by <i>collectionKeySize</i>.
     * @param {Integer} collectionKeySize Type: <b>UINT32</b>
     * 
     * The size of the font collection key, in bytes.
     * @returns {IDWriteFontFileEnumerator} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileenumerator">IDWriteFontFileEnumerator</a>**</b>
     * 
     * When this method returns, contains the address of  a pointer to the newly created font file enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontcollectionloader-createenumeratorfromkey
     */
    CreateEnumeratorFromKey(factory, collectionKey, collectionKeySize) {
        result := ComCall(3, this, "ptr", factory, "ptr", collectionKey, "uint", collectionKeySize, "ptr*", &fontFileEnumerator := 0, "HRESULT")
        return IDWriteFontFileEnumerator(fontFileEnumerator)
    }

    Query(iid) {
        if (IDWriteFontCollectionLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateEnumeratorFromKey := CallbackCreate(GetMethod(implObj, "CreateEnumeratorFromKey"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateEnumeratorFromKey)
    }
}
