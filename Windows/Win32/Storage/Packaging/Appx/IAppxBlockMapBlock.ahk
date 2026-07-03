#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAppxBlockMapBlock interface provides a read-only object that represents an individual block within a file contained in the block map file (AppxBlockMap.xml) for the App package.
 * @remarks
 * Each <b>Block</b> element has an attribute for the hash value and compressed size of the block.
 * 
 * For a code example, see the [Query app package and app manifest sample](https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/AppxPackingDescribeAppx).
 * 
 * <div class="code"></div>
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxblockmapblock
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxBlockMapBlock extends IUnknown {
    /**
     * The interface identifier for IAppxBlockMapBlock
     * @type {Guid}
     */
    static IID := Guid("{75cf3930-3244-4fe0-a8c8-e0bcb270b889}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxBlockMapBlock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHash           : IntPtr
        GetCompressedSize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxBlockMapBlock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the hash value of the block.
     * @remarks
     * The <i>buffer</i> value corresponds to the <b>Hash</b> attribute of the <b>Block</b> element.
     * 
     * The caller is responsible for deallocating the memory used for <i>buffer</i>. Use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to deallocate the memory.
     * @param {Pointer<Integer>} bufferSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a>*</b>
     * 
     * The length of  <i>buffer</i>.
     * @returns {Pointer<Integer>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * The byte sequence representing the hash value of the block.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapblock-gethash
     */
    GetHash(bufferSize) {
        bufferSizeMarshal := bufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, bufferSizeMarshal, bufferSize, "ptr*", &_buffer := 0, "HRESULT")
        return _buffer
    }

    /**
     * Retrieves compressed size of the block.
     * @remarks
     * This size corresponds to the compressed size of the block. 
     * 
     * The <i>size</i> value corresponds to the <b>Size</b> attribute of the <a href="https://docs.microsoft.com/uwp/schemas/blockmapschema/element-block">Block</a> element in the block map.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT32</a>*</b>
     * 
     * The compressed size of the block, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxblockmapblock-getcompressedsize
     */
    GetCompressedSize() {
        result := ComCall(4, this, "uint*", &_size := 0, "HRESULT")
        return _size
    }

    Query(iid) {
        if (IAppxBlockMapBlock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHash := CallbackCreate(GetMethod(implObj, "GetHash"), flags, 3)
        this.vtbl.GetCompressedSize := CallbackCreate(GetMethod(implObj, "GetCompressedSize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHash)
        CallbackFree(this.vtbl.GetCompressedSize)
    }
}
