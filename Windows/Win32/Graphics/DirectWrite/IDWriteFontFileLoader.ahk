#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFontFileStream.ahk" { IDWriteFontFileStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles loading font file resources of a particular type from a font file reference key into a font file stream object.
 * @remarks
 * The font file loader interface is recommended to be implemented by a singleton object. Note that font file loader implementations must not register themselves with DirectWrite factory inside their constructors and must not unregister themselves in their destructors, because registration and unregistration operations increment and decrement the object reference count respectively. Instead, registration and unregistration of font file loaders with DirectWrite factory should be performed outside of the font file loader implementation as a separate step.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfileloader
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontFileLoader extends IUnknown {
    /**
     * The interface identifier for IDWriteFontFileLoader
     * @type {Guid}
     */
    static IID := Guid("{727cad4e-d6af-4c9e-8a08-d695b11caa49}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontFileLoader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateStreamFromKey : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontFileLoader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a font file stream object that encapsulates an open file resource.
     * @remarks
     * The resource is closed when the last reference to <i>fontFileStream</i> is released.
     * @param {Integer} fontFileReferenceKey Type: <b>const void*</b>
     * 
     * A pointer to a font file reference key that uniquely identifies the font file resource
     *      within the scope of the font loader being used. The buffer allocated for this key must at least be the size, in bytes, specified by <i> fontFileReferenceKeySize</i>.
     * @param {Integer} fontFileReferenceKeySize Type: <b>UINT32</b>
     * 
     * The size of font file reference key, in bytes.
     * @returns {IDWriteFontFileStream} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the newly created <a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontfilestream">IDWriteFontFileStream</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite/nf-dwrite-idwritefontfileloader-createstreamfromkey
     */
    CreateStreamFromKey(fontFileReferenceKey, fontFileReferenceKeySize) {
        result := ComCall(3, this, "ptr", fontFileReferenceKey, "uint", fontFileReferenceKeySize, "ptr*", &fontFileStream := 0, "HRESULT")
        return IDWriteFontFileStream(fontFileStream)
    }

    Query(iid) {
        if (IDWriteFontFileLoader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStreamFromKey := CallbackCreate(GetMethod(implObj, "CreateStreamFromKey"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStreamFromKey)
    }
}
