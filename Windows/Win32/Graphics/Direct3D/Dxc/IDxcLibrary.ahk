#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IMalloc.ahk" { IMalloc }
#Import ".\DXC_CP.ahk" { DXC_CP }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDxcIncludeHandler.ahk" { IDxcIncludeHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDxcBlobEncoding.ahk" { IDxcBlobEncoding }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDxcBlob.ahk" { IDxcBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcLibrary extends IUnknown {
    /**
     * The interface identifier for IDxcLibrary
     * @type {Guid}
     */
    static IID := Guid("{e5204dc7-d18c-4c3c-bdfb-851673980fe7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcLibrary interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetMalloc                        : IntPtr
        CreateBlobFromBlob               : IntPtr
        CreateBlobFromFile               : IntPtr
        CreateBlobWithEncodingFromPinned : IntPtr
        CreateBlobWithEncodingOnHeapCopy : IntPtr
        CreateBlobWithEncodingOnMalloc   : IntPtr
        CreateIncludeHandler             : IntPtr
        CreateStreamFromBlobReadOnly     : IntPtr
        GetBlobAsUtf8                    : IntPtr
        GetBlobAsWide                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcLibrary.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMalloc} pMalloc 
     * @returns {HRESULT} 
     */
    SetMalloc(pMalloc) {
        result := ComCall(3, this, "ptr", pMalloc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @returns {IDxcBlob} 
     */
    CreateBlobFromBlob(pBlob, offset, length) {
        result := ComCall(4, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcBlob(ppResult)
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<DXC_CP>} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobFromFile(pFileName, codePage) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        codePageMarshal := codePage is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pFileName, codePageMarshal, codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {Integer} pText 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingFromPinned(pText, _size, codePage) {
        result := ComCall(6, this, "ptr", pText, "uint", _size, DXC_CP, codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {Integer} pText 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingOnHeapCopy(pText, _size, codePage) {
        result := ComCall(7, this, "ptr", pText, "uint", _size, DXC_CP, codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {Integer} pText 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} _size 
     * @param {DXC_CP} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingOnMalloc(pText, pIMalloc, _size, codePage) {
        result := ComCall(8, this, "ptr", pText, "ptr", pIMalloc, "uint", _size, DXC_CP, codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @returns {IDxcIncludeHandler} 
     */
    CreateIncludeHandler() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "HRESULT")
        return IDxcIncludeHandler(ppResult)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IStream} 
     */
    CreateStreamFromBlobReadOnly(pBlob) {
        result := ComCall(10, this, "ptr", pBlob, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IDxcBlobEncoding} 
     */
    GetBlobAsUtf8(pBlob) {
        result := ComCall(11, this, "ptr", pBlob, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {IDxcBlobEncoding} 
     */
    GetBlobAsWide(pBlob) {
        result := ComCall(12, this, "ptr", pBlob, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    Query(iid) {
        if (IDxcLibrary.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMalloc := CallbackCreate(GetMethod(implObj, "SetMalloc"), flags, 2)
        this.vtbl.CreateBlobFromBlob := CallbackCreate(GetMethod(implObj, "CreateBlobFromBlob"), flags, 5)
        this.vtbl.CreateBlobFromFile := CallbackCreate(GetMethod(implObj, "CreateBlobFromFile"), flags, 4)
        this.vtbl.CreateBlobWithEncodingFromPinned := CallbackCreate(GetMethod(implObj, "CreateBlobWithEncodingFromPinned"), flags, 5)
        this.vtbl.CreateBlobWithEncodingOnHeapCopy := CallbackCreate(GetMethod(implObj, "CreateBlobWithEncodingOnHeapCopy"), flags, 5)
        this.vtbl.CreateBlobWithEncodingOnMalloc := CallbackCreate(GetMethod(implObj, "CreateBlobWithEncodingOnMalloc"), flags, 6)
        this.vtbl.CreateIncludeHandler := CallbackCreate(GetMethod(implObj, "CreateIncludeHandler"), flags, 2)
        this.vtbl.CreateStreamFromBlobReadOnly := CallbackCreate(GetMethod(implObj, "CreateStreamFromBlobReadOnly"), flags, 3)
        this.vtbl.GetBlobAsUtf8 := CallbackCreate(GetMethod(implObj, "GetBlobAsUtf8"), flags, 3)
        this.vtbl.GetBlobAsWide := CallbackCreate(GetMethod(implObj, "GetBlobAsWide"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMalloc)
        CallbackFree(this.vtbl.CreateBlobFromBlob)
        CallbackFree(this.vtbl.CreateBlobFromFile)
        CallbackFree(this.vtbl.CreateBlobWithEncodingFromPinned)
        CallbackFree(this.vtbl.CreateBlobWithEncodingOnHeapCopy)
        CallbackFree(this.vtbl.CreateBlobWithEncodingOnMalloc)
        CallbackFree(this.vtbl.CreateIncludeHandler)
        CallbackFree(this.vtbl.CreateStreamFromBlobReadOnly)
        CallbackFree(this.vtbl.GetBlobAsUtf8)
        CallbackFree(this.vtbl.GetBlobAsWide)
    }
}
