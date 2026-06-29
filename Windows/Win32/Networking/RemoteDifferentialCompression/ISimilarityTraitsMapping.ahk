#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISimilarityTraitsMappedView.ahk" { ISimilarityTraitsMappedView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RdcMappingAccessMode.ahk" { RdcMappingAccessMode }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides methods that an RDC application can implement for creating and manipulating a file mapping object for a similarity traits table file.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/nn-msrdc-isimilaritytraitsmapping
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 */
export default struct ISimilarityTraitsMapping extends IUnknown {
    /**
     * The interface identifier for ISimilarityTraitsMapping
     * @type {Guid}
     */
    static IID := Guid("{96236a7d-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for SimilarityTraitsMapping
     * @type {Guid}
     */
    static CLSID := Guid("{96236a94-9dbc-11da-9e3f-0011114ae311}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISimilarityTraitsMapping interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CloseMapping  : IntPtr
        SetFileSize   : IntPtr
        GetFileSize   : IntPtr
        OpenMapping   : IntPtr
        ResizeMapping : IntPtr
        GetPageSize   : IntPtr
        CreateView    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISimilarityTraitsMapping.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Closes a file mapping object for a similarity traits table file.
     * @remarks
     * Note that there may still be valid views open on the file. No new views may be created after the mapping is closed, but existing views continue to work.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-closemapping
     */
    CloseMapping() {
        ComCall(3, this)
    }

    /**
     * Sets the size of a similarity traits table file.
     * @param {Integer} fileSize Pointer to a location that specifies the file size, in bytes.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-setfilesize
     */
    SetFileSize(fileSize) {
        result := ComCall(4, this, "uint", fileSize, "HRESULT")
        return result
    }

    /**
     * Returns the size of a similarity traits table file.
     * @returns {Integer} Pointer to a location that receives the file size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-getfilesize
     */
    GetFileSize() {
        result := ComCall(5, this, "uint*", &fileSize := 0, "HRESULT")
        return fileSize
    }

    /**
     * Opens the file mapping object for a similarity traits table file.
     * @param {RdcMappingAccessMode} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @param {Integer} begin File offset, in bytes, where the file mapping is to begin.
     * @param {Integer} end File offset, in bytes, where the file mapping is to end.
     * @returns {Integer} Pointer to a location that receives the file offset, in bytes, of the actual end of the file mapping, rounded up to the nearest block size.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-openmapping
     */
    OpenMapping(accessMode, begin, end) {
        result := ComCall(6, this, RdcMappingAccessMode, accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * Resizes the file mapping object for a similarity traits table file.
     * @param {RdcMappingAccessMode} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @param {Integer} begin File offset, in bytes, where the file mapping is to begin.
     * @param {Integer} end File offset, in bytes, where the file mapping is to end.
     * @returns {Integer} Pointer to a location that receives the file offset, in bytes, of the actual end of the file mapping, rounded up to the nearest block size.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-resizemapping
     */
    ResizeMapping(accessMode, begin, end) {
        result := ComCall(7, this, RdcMappingAccessMode, accessMode, "uint", begin, "uint", end, "uint*", &actualEnd := 0, "HRESULT")
        return actualEnd
    }

    /**
     * Returns the page size (disk block size) for a similarity traits table file.
     * @param {Pointer<Integer>} pageSize Pointer to a location that receives the page size, in bytes. This page size must be at least 65536 bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-getpagesize
     */
    GetPageSize(pageSize) {
        pageSizeMarshal := pageSize is VarRef ? "uint*" : "ptr"

        ComCall(8, this, pageSizeMarshal, pageSize)
    }

    /**
     * Maps a view of the file mapping for a similarity traits table file.
     * @remarks
     * Data accessed through read-only views will never be modified.
     * @param {Integer} minimumMappedPages Minimum number of pages of the file mapping to map to the view.
     * @param {RdcMappingAccessMode} accessMode <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ne-msrdc-rdcmappingaccessmode">RdcMappingAccessMode</a> enumeration value that specifies the desired access to the file mapping object.
     * @returns {ISimilarityTraitsMappedView} Pointer to a location that will receive the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nn-msrdc-isimilaritytraitsmappedview">ISimilarityTraitsMappedView</a> interface pointer. Callers must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-isimilaritytraitsmapping-createview
     */
    CreateView(minimumMappedPages, accessMode) {
        result := ComCall(9, this, "uint", minimumMappedPages, RdcMappingAccessMode, accessMode, "ptr*", &mappedView := 0, "HRESULT")
        return ISimilarityTraitsMappedView(mappedView)
    }

    Query(iid) {
        if (ISimilarityTraitsMapping.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CloseMapping := CallbackCreate(GetMethod(implObj, "CloseMapping"), flags, 1)
        this.vtbl.SetFileSize := CallbackCreate(GetMethod(implObj, "SetFileSize"), flags, 2)
        this.vtbl.GetFileSize := CallbackCreate(GetMethod(implObj, "GetFileSize"), flags, 2)
        this.vtbl.OpenMapping := CallbackCreate(GetMethod(implObj, "OpenMapping"), flags, 5)
        this.vtbl.ResizeMapping := CallbackCreate(GetMethod(implObj, "ResizeMapping"), flags, 5)
        this.vtbl.GetPageSize := CallbackCreate(GetMethod(implObj, "GetPageSize"), flags, 2)
        this.vtbl.CreateView := CallbackCreate(GetMethod(implObj, "CreateView"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CloseMapping)
        CallbackFree(this.vtbl.SetFileSize)
        CallbackFree(this.vtbl.GetFileSize)
        CallbackFree(this.vtbl.OpenMapping)
        CallbackFree(this.vtbl.ResizeMapping)
        CallbackFree(this.vtbl.GetPageSize)
        CallbackFree(this.vtbl.CreateView)
    }
}
