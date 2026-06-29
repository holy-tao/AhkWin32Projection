#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXpsOMResource.ahk" { IXpsOMResource }
#Import "..\Packaging\Opc\IOpcPartUri.ahk" { IOpcPartUri }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\XPS_FONT_EMBEDDING.ahk" { XPS_FONT_EMBEDDING }

/**
 * Provides an IStream interface to a font resource.
 * @remarks
 * The code example that follows illustrates how to create an instance of  this interface.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMFontResource    *newInterface;
 * IOpcPartUri           *partUri;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *     __uuidof(XpsOMObjectFactory),
 *     NULL,
 *     CLSCTX_INPROC_SERVER,
 *     _uuidof(IXpsOMObjectFactory),
 *     reinterpret_cast<LPVOID*>(&xpsFactory)
 *     );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     // The partUriString and acquiredStream variables 
 *     //   are defined outside of this example.
 *     hr = xpsFactory->CreatePartUri(partUriString, &partUri);
 *     if (SUCCEEDED(hr))
 *     {
 *         hr = xpsFactory->CreateFontResource (
 *             acquiredStream, 
 *             XPS_FONT_EMBEDDING_NORMAL,    // normal
 *             partUri, 
 *             FALSE,                        // not obfuscated
 *             &newInterface);
 *         if (SUCCEEDED(hr))
 *         {
 *             // use newInterface
 * 
 *             newInterface->Release();
 *         }
 *         partUri->Release();
 *     }
 *     xpsFactory->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct IXpsOMFontResource extends IXpsOMResource {
    /**
     * The interface identifier for IXpsOMFontResource
     * @type {Guid}
     */
    static IID := Guid("{a8c45708-47d9-4af4-8d20-33b48c9b8485}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsOMFontResource interfaces
    */
    struct Vtbl extends IXpsOMResource.Vtbl {
        GetStream          : IntPtr
        SetContent         : IntPtr
        GetEmbeddingOption : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsOMFontResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource. (IXpsOMFontResource.GetStream)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> object returned by this method might return an error of E_PENDING, which indicates that the stream length has not been determined yet.  This behavior is different from that of a standard <b>IStream</b> object.
     * 
     * This method calls the stream's <b>Clone</b> method to create the stream returned in <i>stream</i>. As a result, the performance of this method will depend on that of the stream's <b>Clone</b> method.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &readerStream := 0, "HRESULT")
        return IStream(readerStream)
    }

    /**
     * Sets the read-only stream to be associated with this resource. (IXpsOMFontResource.SetContent)
     * @remarks
     * The calling method  should treat this stream as a single-threaded apartment (STA) model object and not re-enter any of the stream interface's methods.
     * 
     * The stream  assigned to this resource should not be obfuscated. Obfuscation of the font resource takes place during serialization.
     * 
     * Providing an obfuscated font stream while setting the <i>embeddingOption</i> to XPS_FONT_EMBEDDING_OBFUSCATED will result in a font that is not obfuscated in the serialized XPS document.
     * 
     * <i>partName</i> resets the part name for this object and is checked against the value of  <i>embeddingOption</i> for the proper obfuscation syntax.
     * 
     * Because <a href="https://docs.microsoft.com/windows/desktop/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getstream">GetStream</a> gets a clone of  the stream that is set by this method, the provided stream should have an efficient cloning method. A stream with an inefficient cloning method will reduce the performance of <b>GetStream</b>.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {XPS_FONT_EMBEDDING} embeddingOption The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING</a> value that describes how the resource is to be obfuscated.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_NORMAL"></a><a id="xps_font_embedding_normal"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is neither obfuscated nor restricted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_OBFUSCATED"></a><a id="xps_font_embedding_obfuscated"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_OBFUSCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is obfuscated but not restricted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_RESTRICTED"></a><a id="xps_font_embedding_restricted"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_RESTRICTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is both obfuscated and restricted.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IOpcPartUri} partName The part name to be assigned to this resource.
     * @returns {HRESULT} If the method succeeds, it returns S_OK; otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-setcontent
     */
    SetContent(sourceStream, embeddingOption, partName) {
        result := ComCall(6, this, "ptr", sourceStream, XPS_FONT_EMBEDDING, embeddingOption, "ptr", partName, "HRESULT")
        return result
    }

    /**
     * Gets the embedding option that will be applied when the resource is serialized.
     * @returns {XPS_FONT_EMBEDDING} The stream's embedding option.
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING</a> value describes how the resource is obfuscated. The following possible values are returned in this parameter:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_NORMAL"></a><a id="xps_font_embedding_normal"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_NORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is neither obfuscated nor restricted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_OBFUSCATED"></a><a id="xps_font_embedding_obfuscated"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_OBFUSCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is obfuscated but not restricted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XPS_FONT_EMBEDDING_RESTRICTED"></a><a id="xps_font_embedding_restricted"></a><dl>
     * <dt><b>XPS_FONT_EMBEDDING_RESTRICTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Font resource is both obfuscated and restricted.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getembeddingoption
     */
    GetEmbeddingOption() {
        result := ComCall(7, this, "int*", &embeddingOption := 0, "HRESULT")
        return embeddingOption
    }

    Query(iid) {
        if (IXpsOMFontResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStream := CallbackCreate(GetMethod(implObj, "GetStream"), flags, 2)
        this.vtbl.SetContent := CallbackCreate(GetMethod(implObj, "SetContent"), flags, 4)
        this.vtbl.GetEmbeddingOption := CallbackCreate(GetMethod(implObj, "GetEmbeddingOption"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStream)
        CallbackFree(this.vtbl.SetContent)
        CallbackFree(this.vtbl.GetEmbeddingOption)
    }
}
