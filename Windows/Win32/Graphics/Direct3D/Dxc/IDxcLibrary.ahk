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
        result := ComCall(3, this, "ptr", pMalloc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @returns {Pointer<IDxcBlob>} 
     */
    CreateBlobFromBlob(pBlob, offset, length) {
        result := ComCall(4, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<Integer>} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    CreateBlobFromFile(pFileName, codePage) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        codePageMarshal := codePage is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pFileName, codePageMarshal, codePage, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    CreateBlobWithEncodingFromPinned(pText, size_, codePage) {
        result := ComCall(6, this, "ptr", pText, "uint", size_, "uint", codePage, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    CreateBlobWithEncodingOnHeapCopy(pText, size_, codePage) {
        result := ComCall(7, this, "ptr", pText, "uint", size_, "uint", codePage, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {IMalloc} pIMalloc 
     * @param {Integer} size_ 
     * @param {Integer} codePage 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    CreateBlobWithEncodingOnMalloc(pText, pIMalloc, size_, codePage) {
        result := ComCall(8, this, "ptr", pText, "ptr", pIMalloc, "uint", size_, "uint", codePage, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }

    /**
     * 
     * @returns {Pointer<IDxcIncludeHandler>} 
     */
    CreateIncludeHandler() {
        result := ComCall(9, this, "ptr*", &ppResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppResult
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IStream>} 
     */
    CreateStreamFromBlobReadOnly(pBlob) {
        result := ComCall(10, this, "ptr", pBlob, "ptr*", &ppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppStream
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    GetBlobAsUtf8(pBlob) {
        result := ComCall(11, this, "ptr", pBlob, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }

    /**
     * 
     * @param {IDxcBlob} pBlob 
     * @returns {Pointer<IDxcBlobEncoding>} 
     */
    GetBlobAsWide(pBlob) {
        result := ComCall(12, this, "ptr", pBlob, "ptr*", &pBlobEncoding := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBlobEncoding
    }
}
