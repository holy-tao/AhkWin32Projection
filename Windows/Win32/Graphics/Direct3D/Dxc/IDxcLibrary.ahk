#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDxcBlob.ahk
#Include .\IDxcBlobEncoding.ahk
#Include .\IDxcIncludeHandler.ahk
#Include ..\..\..\System\Com\IStream.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDxcLibrary
     * @type {Guid}
     */
    static IID => Guid("{e5204dc7-d18c-4c3c-bdfb-851673980fe7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMalloc", "CreateBlobFromBlob", "CreateBlobFromFile", "CreateBlobWithEncodingFromPinned", "CreateBlobWithEncodingOnHeapCopy", "CreateBlobWithEncodingOnMalloc", "CreateIncludeHandler", "CreateStreamFromBlobReadOnly", "GetBlobAsUtf8", "GetBlobAsWide"]

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
     * @param {Pointer<Integer>} codePage 
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
     * @param {Pointer} pText 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingFromPinned(pText, size, codePage) {
        result := ComCall(6, this, "ptr", pText, "uint", size, "uint", codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingOnHeapCopy(pText, size, codePage) {
        result := ComCall(7, this, "ptr", pText, "uint", size, "uint", codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
        return IDxcBlobEncoding(pBlobEncoding)
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @returns {IDxcBlobEncoding} 
     */
    CreateBlobWithEncodingOnMalloc(pText, pIMalloc, size, codePage) {
        result := ComCall(8, this, "ptr", pText, "ptr", pIMalloc, "uint", size, "uint", codePage, "ptr*", &pBlobEncoding := 0, "HRESULT")
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
}
