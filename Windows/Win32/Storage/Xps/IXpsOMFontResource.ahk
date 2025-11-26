#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IXpsOMResource.ahk

/**
 * Provides an IStream interface to a font resource.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomfontresource
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMFontResource extends IXpsOMResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMFontResource
     * @type {Guid}
     */
    static IID => Guid("{a8c45708-47d9-4af4-8d20-33b48c9b8485}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStream", "SetContent", "GetEmbeddingOption"]

    /**
     * Gets a new, read-only copy of the stream that is associated with this resource.
     * @returns {IStream} A new, read-only copy of the stream that is associated with this resource.
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getstream
     */
    GetStream() {
        result := ComCall(5, this, "ptr*", &readerStream := 0, "HRESULT")
        return IStream(readerStream)
    }

    /**
     * Sets the read-only stream to be associated with this resource.
     * @param {IStream} sourceStream The read-only stream to be associated with this resource.
     * @param {Integer} embeddingOption The <a href="https://docs.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_font_embedding">XPS_FONT_EMBEDDING</a> value that describes how the resource is to be obfuscated.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-setcontent
     */
    SetContent(sourceStream, embeddingOption, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "int", embeddingOption, "ptr", partName, "HRESULT")
        return result
    }

    /**
     * Gets the embedding option that will be applied when the resource is serialized.
     * @returns {Integer} The stream's embedding option.
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
     * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getembeddingoption
     */
    GetEmbeddingOption() {
        result := ComCall(7, this, "int*", &embeddingOption := 0, "HRESULT")
        return embeddingOption
    }
}
