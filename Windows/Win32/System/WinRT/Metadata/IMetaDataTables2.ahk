#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMetaDataTables.ahk" { IMetaDataTables }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends IMetaDataTables to include methods for working with metadata streams.
 * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nn-rometadataapi-imetadatatables2
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataTables2 extends IMetaDataTables {
    /**
     * The interface identifier for IMetaDataTables2
     * @type {Guid}
     */
    static IID := Guid("{badb5f70-58da-43a9-a1c6-d74819f19b15}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataTables2 interfaces
    */
    struct Vtbl extends IMetaDataTables.Vtbl {
        GetMetaDataStorage    : IntPtr
        GetMetaDataStreamInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataTables2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the size and contents of the metadata stored in the specified section.
     * @param {Pointer<Pointer<Void>>} ppvMd A pointer to a metadata section.
     * @param {Pointer<Integer>} pcbMd The size of the metadata stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastorage
     */
    GetMetaDataStorage(ppvMd, pcbMd) {
        ppvMdMarshal := ppvMd is VarRef ? "ptr*" : "ptr"
        pcbMdMarshal := pcbMd is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, ppvMdMarshal, ppvMd, pcbMdMarshal, pcbMd, "HRESULT")
        return result
    }

    /**
     * Gets the name, size, and contents of the metadata stream at the specified index.
     * @param {Integer} ix The index of the requested metadata stream.
     * @param {Pointer<Pointer<Integer>>} ppchName A pointer to the name of the stream.
     * @param {Pointer<Pointer<Void>>} ppv A pointer to the metadata stream.
     * @param {Pointer<Integer>} pcb The size, in bytes, of <i>ppv</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastreaminfo
     */
    GetMetaDataStreamInfo(ix, ppchName, ppv, pcb) {
        ppchNameMarshal := ppchName is VarRef ? "ptr*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", ix, ppchNameMarshal, ppchName, ppvMarshal, ppv, pcbMarshal, pcb, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataTables2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetaDataStorage := CallbackCreate(GetMethod(implObj, "GetMetaDataStorage"), flags, 3)
        this.vtbl.GetMetaDataStreamInfo := CallbackCreate(GetMethod(implObj, "GetMetaDataStreamInfo"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetaDataStorage)
        CallbackFree(this.vtbl.GetMetaDataStreamInfo)
    }
}
