#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IStream>} readerStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getstream
     */
    GetStream(readerStream) {
        result := ComCall(5, this, "ptr*", readerStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} sourceStream 
     * @param {Integer} embeddingOption 
     * @param {IOpcPartUri} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-setcontent
     */
    SetContent(sourceStream, embeddingOption, partName) {
        result := ComCall(6, this, "ptr", sourceStream, "int", embeddingOption, "ptr", partName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} embeddingOption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomfontresource-getembeddingoption
     */
    GetEmbeddingOption(embeddingOption) {
        embeddingOptionMarshal := embeddingOption is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, embeddingOptionMarshal, embeddingOption, "HRESULT")
        return result
    }
}
