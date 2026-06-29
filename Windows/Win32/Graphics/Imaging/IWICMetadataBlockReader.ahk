#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICMetadataReader.ahk" { IWICMetadataReader }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that provide access to all of the codec's top level metadata blocks.
 * @remarks
 * <b>IWICMetadataBlockReader</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter">IWICMetadataBlockWriter</a> operate at the root level only; that is, they provide read and write access, respectively, to the top level metadata blocks. They are implemented by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>, respectively. To handle any metadata blocks that are not at the top level of the hierarchy, use <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>.
 * 
 * 
 * <div class="alert"><b>Note</b>  The codec's decoder and encoder implement this interface to expose the enumeration of all top level metadata blocks.  While the codec parses the image stream, it calls services like <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nf-wincodecsdk-iwiccomponentfactory-createmetadatareaderfromcontainer">CreateMetadataReaderFromContainer</a> to instantiate metadata readers for any block that is recognized as being able to be embedded in the decoder's container format.  The collection of metadata readers is exposed through this interface. For more info, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-howtowriteacodec">How to Write a WIC-Enabled CODEC</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataBlockReader extends IUnknown {
    /**
     * The interface identifier for IWICMetadataBlockReader
     * @type {Guid}
     */
    static IID := Guid("{feaa2a8d-b3f3-43e4-b25c-d1de990a1ae1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataBlockReader interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContainerFormat : IntPtr
        GetCount           : IntPtr
        GetReaderByIndex   : IntPtr
        GetEnumerator      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataBlockReader.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the container format of the decoder.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * The container format of the decoder. The native container format GUIDs are listed in <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-guids-clsids">WIC GUIDs and CLSIDs</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves the number of top level metadata blocks.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * When this method returns, contains the number of top level metadata blocks.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &pcCount := 0, "HRESULT")
        return pcCount
    }

    /**
     * Retrieves an IWICMetadataReader for a specified top level metadata block.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the desired top level metadata block to retrieve.
     * @returns {IWICMetadataReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a>**</b>
     * 
     * When this method returns, contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a> specified by <i>nIndex</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getreaderbyindex
     */
    GetReaderByIndex(nIndex) {
        result := ComCall(5, this, "uint", nIndex, "ptr*", &ppIMetadataReader := 0, "HRESULT")
        return IWICMetadataReader(ppIMetadataReader)
    }

    /**
     * Retrieves an enumeration of IWICMetadataReader objects representing each of the top level metadata blocks.
     * @returns {IEnumUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>**</b>
     * 
     * When this method returns, contains a pointer to an enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatareader">IWICMetadataReader</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockreader-getenumerator
     */
    GetEnumerator() {
        result := ComCall(6, this, "ptr*", &ppIEnumMetadata := 0, "HRESULT")
        return IEnumUnknown(ppIEnumMetadata)
    }

    Query(iid) {
        if (IWICMetadataBlockReader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContainerFormat := CallbackCreate(GetMethod(implObj, "GetContainerFormat"), flags, 2)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetReaderByIndex := CallbackCreate(GetMethod(implObj, "GetReaderByIndex"), flags, 3)
        this.vtbl.GetEnumerator := CallbackCreate(GetMethod(implObj, "GetEnumerator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContainerFormat)
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetReaderByIndex)
        CallbackFree(this.vtbl.GetEnumerator)
    }
}
