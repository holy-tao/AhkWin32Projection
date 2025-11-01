#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the top-level entry into the XPS object model tree.
 * @remarks
 * 
  * The code example that follows illustrates how to create an instance of  this interface.
  * 
  * 
  * ```cpp
  * 
  * IXpsOMPackage    *newInterface;
  * 
  * // Note the implicit requirement that CoInitializeEx 
  * //  has previously been called from this thread.
  * 
  * hr = CoCreateInstance(
  *       __uuidof(XpsOMObjectFactory),
  *       NULL, 
  *       CLSCTX_INPROC_SERVER,
  *       __uuidof(IXpsOMObjectFactory),
  *       reinterpret_cast<LPVOID*>(&xpsFactory)
  *       );
  * 
  * if (SUCCEEDED(hr))
  * {
  *     hr = xpsFactory->CreatePackage (&newInterface);
  *     if (SUCCEEDED(hr))
  *     {
  *         // use newInterface
  * 
  *         newInterface->Release();
  *     }
  * 
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
  * For information about using this interface in a program, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd316970(v=vs.85)">Create a Blank XPS OM</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsompackage
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMPackage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMPackage
     * @type {Guid}
     */
    static IID => Guid("{18c3df65-81e1-4674-91dc-fc452f5a416f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDocumentSequence", "SetDocumentSequence", "GetCoreProperties", "SetCoreProperties", "GetDiscardControlPartName", "SetDiscardControlPartName", "GetThumbnailResource", "SetThumbnailResource", "WriteToFile", "WriteToStream"]

    /**
     * 
     * @param {Pointer<IXpsOMDocumentSequence>} documentSequence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getdocumentsequence
     */
    GetDocumentSequence(documentSequence) {
        result := ComCall(3, this, "ptr*", documentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMDocumentSequence} documentSequence 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setdocumentsequence
     */
    SetDocumentSequence(documentSequence) {
        result := ComCall(4, this, "ptr", documentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMCoreProperties>} coreProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getcoreproperties
     */
    GetCoreProperties(coreProperties) {
        result := ComCall(5, this, "ptr*", coreProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMCoreProperties} coreProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setcoreproperties
     */
    SetCoreProperties(coreProperties) {
        result := ComCall(6, this, "ptr", coreProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcPartUri>} discardControlPartUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getdiscardcontrolpartname
     */
    GetDiscardControlPartName(discardControlPartUri) {
        result := ComCall(7, this, "ptr*", discardControlPartUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpcPartUri} discardControlPartUri 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setdiscardcontrolpartname
     */
    SetDiscardControlPartName(discardControlPartUri) {
        result := ComCall(8, this, "ptr", discardControlPartUri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMImageResource>} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-getthumbnailresource
     */
    GetThumbnailResource(imageResource) {
        result := ComCall(9, this, "ptr*", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsOMImageResource} imageResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-setthumbnailresource
     */
    SetThumbnailResource(imageResource) {
        result := ComCall(10, this, "ptr", imageResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<SECURITY_ATTRIBUTES>} securityAttributes 
     * @param {Integer} flagsAndAttributes 
     * @param {BOOL} optimizeMarkupSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-writetofile
     */
    WriteToFile(fileName, securityAttributes, flagsAndAttributes, optimizeMarkupSize) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(11, this, "ptr", fileName, "ptr", securityAttributes, "uint", flagsAndAttributes, "int", optimizeMarkupSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISequentialStream} stream 
     * @param {BOOL} optimizeMarkupSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsompackage-writetostream
     */
    WriteToStream(stream, optimizeMarkupSize) {
        result := ComCall(12, this, "ptr", stream, "int", optimizeMarkupSize, "HRESULT")
        return result
    }
}
