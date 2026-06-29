#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICMetadataWriter.ahk" { IWICMetadataWriter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICMetadataBlockReader.ahk" { IWICMetadataBlockReader }

/**
 * Exposes methods that enable the encoding of metadata. This interface is implemented by the decoder and its image frames.
 * @remarks
 * When the encoder is told to commit, it goes through each metadata writer and serializes the metadata content into the encoding stream.
 *             If the metadata block contains metadata important to the integrity of the file, such as the image width or height or other intrinsic information about the image, the encoder must set the critical metadata items prior to serializing the metadata.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockwriter
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICMetadataBlockWriter extends IWICMetadataBlockReader {
    /**
     * The interface identifier for IWICMetadataBlockWriter
     * @type {Guid}
     */
    static IID := Guid("{08fb9676-b444-41e8-8dbe-6a53a542bff1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICMetadataBlockWriter interfaces
    */
    struct Vtbl extends IWICMetadataBlockReader.Vtbl {
        InitializeFromBlockReader : IntPtr
        GetWriterByIndex          : IntPtr
        AddWriter                 : IntPtr
        SetWriterByIndex          : IntPtr
        RemoveWriterByIndex       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICMetadataBlockWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes an IWICMetadataBlockWriter from the given IWICMetadataBlockReader. This will prepopulate the metadata block writer with all the metadata in the metadata block reader.
     * @param {IWICMetadataBlockReader} pIMDBlockReader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatablockreader">IWICMetadataBlockReader</a> used to initialize the block writer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-initializefromblockreader
     */
    InitializeFromBlockReader(pIMDBlockReader) {
        result := ComCall(7, this, "ptr", pIMDBlockReader, "HRESULT")
        return result
    }

    /**
     * Retrieves the IWICMetadataWriter that resides at the specified index.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata writer to be retrieved. This index is zero-based.
     * @returns {IWICMetadataWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to the metadata writer that resides at the specified index.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-getwriterbyindex
     */
    GetWriterByIndex(nIndex) {
        result := ComCall(8, this, "uint", nIndex, "ptr*", &ppIMetadataWriter := 0, "HRESULT")
        return IWICMetadataWriter(ppIMetadataWriter)
    }

    /**
     * Adds a top-level metadata block by adding a IWICMetadataWriter for it.
     * @param {IWICMetadataWriter} pIMetadataWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * A pointer to the metadata writer to add to the image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-addwriter
     */
    AddWriter(pIMetadataWriter) {
        result := ComCall(9, this, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * Replaces the metadata writer at the specified index location.
     * @remarks
     * Typically, the current metadata writer at the specified index will be replaced with the new writer. However, the App0 metadata writer cannot be replaced within a JPEG stream. 
     * 
     * This function cannot be used to add metadata writers. If no metadata writer exists at the specified index, the function will fail.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index position at which to place the metadata writer. This index is zero-based.
     * @param {IWICMetadataWriter} pIMetadataWriter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodecsdk/nn-wincodecsdk-iwicmetadatawriter">IWICMetadataWriter</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-setwriterbyindex
     */
    SetWriterByIndex(nIndex, pIMetadataWriter) {
        result := ComCall(10, this, "uint", nIndex, "ptr", pIMetadataWriter, "HRESULT")
        return result
    }

    /**
     * Removes the metadata writer from the specified index location.
     * @remarks
     * After removing a metadata writer, remaining metadata writers can be expected to move up to occupy the vacated location. Indexes for remaining metadata items as well as the count will change.
     * @param {Integer} nIndex Type: <b>UINT</b>
     * 
     * The index of the metadata writer to remove.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/nf-wincodecsdk-iwicmetadatablockwriter-removewriterbyindex
     */
    RemoveWriterByIndex(nIndex) {
        result := ComCall(11, this, "uint", nIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICMetadataBlockWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeFromBlockReader := CallbackCreate(GetMethod(implObj, "InitializeFromBlockReader"), flags, 2)
        this.vtbl.GetWriterByIndex := CallbackCreate(GetMethod(implObj, "GetWriterByIndex"), flags, 3)
        this.vtbl.AddWriter := CallbackCreate(GetMethod(implObj, "AddWriter"), flags, 2)
        this.vtbl.SetWriterByIndex := CallbackCreate(GetMethod(implObj, "SetWriterByIndex"), flags, 3)
        this.vtbl.RemoveWriterByIndex := CallbackCreate(GetMethod(implObj, "RemoveWriterByIndex"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeFromBlockReader)
        CallbackFree(this.vtbl.GetWriterByIndex)
        CallbackFree(this.vtbl.AddWriter)
        CallbackFree(this.vtbl.SetWriterByIndex)
        CallbackFree(this.vtbl.RemoveWriterByIndex)
    }
}
