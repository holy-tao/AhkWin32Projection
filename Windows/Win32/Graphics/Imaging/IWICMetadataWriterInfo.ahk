#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICMetadataWriter.ahk" { IWICMetadataWriter }
#Import ".\IWICMetadataHandlerInfo.ahk" { IWICMetadataHandlerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that provide basic information about the registered metadata writer.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriterinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataWriterInfo extends IWICMetadataHandlerInfo {
    /**
     * The interface identifier for IWICMetadataWriterInfo
     * @type {Guid}
     */
    static IID := Guid("{b22e3fba-3925-4323-b5c1-9ebfc430f236}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataWriterInfo interfaces
    */
    struct Vtbl extends IWICMetadataHandlerInfo.Vtbl {
        GetHeader      : IntPtr
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataWriterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the metadata header for the metadata writer.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The format container GUID to obtain the header for.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size of the <i>pHeader</i> buffer.
     * @param {Integer} pHeader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader">WICMetadataHeader</a>*</b>
     * 
     * Pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader">WICMetadataHeader</a>.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual size of the header.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-getheader
     */
    GetHeader(guidContainerFormat, cbSize, pHeader) {
        result := ComCall(18, this, Guid.Ptr, guidContainerFormat, "uint", cbSize, "ptr", pHeader, "uint*", &pcbActual := 0, "HRESULT")
        return pcbActual
    }

    /**
     * Creates an instance of an IWICMetadataWriter.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * Pointer that receives a pointer to a metadata writer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatawriterinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(19, this, "ptr*", &ppIWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIWriter)
    }

    Query(iid) {
        if (IWICMetadataWriterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHeader := CallbackCreate(GetMethod(implObj, "GetHeader"), flags, 5)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHeader)
        CallbackFree(this.vtbl.CreateInstance)
    }
}
