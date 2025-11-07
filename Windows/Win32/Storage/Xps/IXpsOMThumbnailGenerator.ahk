#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXpsOMImageResource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Generates a thumbnail image resource.
 * @remarks
 * 
 * To instantiate this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> as shown in the code example that follows.
 * 
 * 
 * ```cpp
 * 
 * IXpsOMThumbnailGenerator    *newInterface;
 * 
 * // Note the implicit requirement that CoInitializeEx 
 * //  has previously been called from this thread.
 * 
 * hr = CoCreateInstance(
 *       __uuidof(XpsOMThumbnailGenerator),
 *       NULL, 
 *       CLSCTX_INPROC_SERVER,
 *       __uuidof(IXpsOMThumbnailGenerator),
 *       reinterpret_cast<LPVOID*>(&newInterface)
 *       );
 * 
 * if (SUCCEEDED(hr))
 * {
 *     // use newInterface
 *     newInterface->Release();
 * }
 * else
 * {
 *     // evaluate HRESULT error returned in hr
 * }
 *  
 * 
 * ```
 * 
 * 
 * This interface requires XpsRasterService.dll. 
 * If XpsRasterService.dll is not present when <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> is called to create an <b>IXpsOMThumbnailGenerator</b> instance, <b>CoCreateInstance</b> returns E_FAIL.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomthumbnailgenerator
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMThumbnailGenerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMThumbnailGenerator
     * @type {Guid}
     */
    static IID => Guid("{15b873d5-1971-41e8-83a3-6578403064c7}")

    /**
     * The class identifier for XpsOMThumbnailGenerator
     * @type {Guid}
     */
    static CLSID => Guid("{7e4a23e2-b969-4761-be35-1a8ced58e323}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateThumbnail"]

    /**
     * 
     * @param {IXpsOMPage} page 
     * @param {Integer} thumbnailType 
     * @param {Integer} thumbnailSize 
     * @param {IOpcPartUri} imageResourcePartName 
     * @returns {IXpsOMImageResource} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomthumbnailgenerator-generatethumbnail
     */
    GenerateThumbnail(page, thumbnailType, thumbnailSize, imageResourcePartName) {
        result := ComCall(3, this, "ptr", page, "int", thumbnailType, "int", thumbnailSize, "ptr", imageResourcePartName, "ptr*", &imageResource := 0, "HRESULT")
        return IXpsOMImageResource(imageResource)
    }
}
