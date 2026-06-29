#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IWICMetadataHandlerInfo.ahk" { IWICMetadataHandlerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICMetadataReader.ahk" { IWICMetadataReader }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods that provide basic information about the registered metadata reader.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareaderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataReaderInfo extends IWICMetadataHandlerInfo {
    /**
     * The interface identifier for IWICMetadataReaderInfo
     * @type {Guid}
     */
    static IID := Guid("{eebf1f5b-07c1-4447-a3ab-22acaf78a804}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataReaderInfo interfaces
    */
    struct Vtbl extends IWICMetadataHandlerInfo.Vtbl {
        GetPatterns    : IntPtr
        MatchesPattern : IntPtr
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataReaderInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the metadata patterns associated with the metadata reader.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The cointainer format GUID.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <i>pPattern</i> buffer.
     * @param {Integer} pPattern Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadatapattern">WICMetadataPattern</a>*</b>
     * 
     * Pointer that receives the metadata patterns.
     * @param {Pointer<Integer>} pcCount Type: <b>UINT*</b>
     * 
     * Pointer that receives the number of metadata patterns.
     * @param {Pointer<Integer>} pcbActual Type: <b>UINT*</b>
     * 
     * Pointer that receives the size, in bytes, needed to obtain the metadata patterns.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-getpatterns
     */
    GetPatterns(guidContainerFormat, cbSize, pPattern, pcCount, pcbActual) {
        pcCountMarshal := pcCount is VarRef ? "uint*" : "ptr"
        pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, Guid.Ptr, guidContainerFormat, "uint", cbSize, "ptr", pPattern, pcCountMarshal, pcCount, pcbActualMarshal, pcbActual, "HRESULT")
        return result
    }

    /**
     * Determines if a stream contains a metadata item pattern.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The container format of the metadata item.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to search for the metadata pattern.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Pointer that receives <c>TRUE</code> if the stream contains the pattern; otherwise, <code>FALSE</c>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-matchespattern
     */
    MatchesPattern(guidContainerFormat, pIStream) {
        result := ComCall(19, this, Guid.Ptr, guidContainerFormat, "ptr", pIStream, BOOL.Ptr, &pfMatches := 0, "HRESULT")
        return pfMatches
    }

    /**
     * Creates an instance of an IWICMetadataReader.
     * @returns {IWICMetadataReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>**</b>
     * 
     * Pointer that receives a pointer to a metadata reader.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatareaderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(20, this, "ptr*", &ppIReader := 0, "HRESULT")
        return IWICMetadataReader(ppIReader)
    }

    Query(iid) {
        if (IWICMetadataReaderInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPatterns := CallbackCreate(GetMethod(implObj, "GetPatterns"), flags, 6)
        this.vtbl.MatchesPattern := CallbackCreate(GetMethod(implObj, "MatchesPattern"), flags, 4)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPatterns)
        CallbackFree(this.vtbl.MatchesPattern)
        CallbackFree(this.vtbl.CreateInstance)
    }
}
