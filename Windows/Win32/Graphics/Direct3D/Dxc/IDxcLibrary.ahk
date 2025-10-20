#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 * @version v4.0.30319
 */
class IDxcLibrary extends IUnknown{
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
     * 
     * @param {Pointer<IMalloc>} pMalloc 
     * @returns {HRESULT} 
     */
    SetMalloc(pMalloc) {
        result := ComCall(3, this, "ptr", pMalloc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @param {Pointer<IDxcBlob>} ppResult 
     * @returns {HRESULT} 
     */
    CreateBlobFromBlob(pBlob, offset, length, ppResult) {
        result := ComCall(4, this, "ptr", pBlob, "uint", offset, "uint", length, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pFileName 
     * @param {Pointer<UInt32>} codePage 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlobFromFile(pFileName, codePage, pBlobEncoding) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        result := ComCall(5, this, "ptr", pFileName, "uint*", codePage, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlobWithEncodingFromPinned(pText, size, codePage, pBlobEncoding) {
        result := ComCall(6, this, "ptr", pText, "uint", size, "uint", codePage, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlobWithEncodingOnHeapCopy(pText, size, codePage, pBlobEncoding) {
        result := ComCall(7, this, "ptr", pText, "uint", size, "uint", codePage, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pText 
     * @param {Pointer<IMalloc>} pIMalloc 
     * @param {Integer} size 
     * @param {Integer} codePage 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    CreateBlobWithEncodingOnMalloc(pText, pIMalloc, size, codePage, pBlobEncoding) {
        result := ComCall(8, this, "ptr", pText, "ptr", pIMalloc, "uint", size, "uint", codePage, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcIncludeHandler>} ppResult 
     * @returns {HRESULT} 
     */
    CreateIncludeHandler(ppResult) {
        result := ComCall(9, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    CreateStreamFromBlobReadOnly(pBlob, ppStream) {
        result := ComCall(10, this, "ptr", pBlob, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsUtf8(pBlob, pBlobEncoding) {
        result := ComCall(11, this, "ptr", pBlob, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDxcBlob>} pBlob 
     * @param {Pointer<IDxcBlobEncoding>} pBlobEncoding 
     * @returns {HRESULT} 
     */
    GetBlobAsWide(pBlob, pBlobEncoding) {
        result := ComCall(12, this, "ptr", pBlob, "ptr", pBlobEncoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
