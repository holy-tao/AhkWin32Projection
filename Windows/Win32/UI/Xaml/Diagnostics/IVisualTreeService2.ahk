#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IBitmapData.ahk
#Include .\IVisualTreeService.ahk

/**
 * Represents additional capabilities of an IVisualTreeService object.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/nn-xamlom-ivisualtreeservice2
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class IVisualTreeService2 extends IVisualTreeService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualTreeService2
     * @type {Guid}
     */
    static IID => Guid("{130f5136-ec43-4f61-89c7-9801a36d2e95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyIndex", "GetProperty", "ReplaceResource", "RenderTargetBitmap"]

    /**
     * Gets the property index for the specified property name.
     * @remarks
     * This index can be passed to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/xaml_diagnostics/ivisualtreeservice2-getproperty">GetProperty</a> method in order to retrieve a specific property on an object.
     * @param {Integer} object_R 
     * @param {PWSTR} propertyName The name of the dependency property for which to get the index.
     * @returns {Integer} The index of the specified property.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-getpropertyindex
     */
    GetPropertyIndex(object_R, propertyName) {
        propertyName := propertyName is String ? StrPtr(propertyName) : propertyName

        result := ComCall(15, this, "uint", object_R, "ptr", propertyName, "uint*", &pPropertyIndex := 0, "HRESULT")
        return pPropertyIndex
    }

    /**
     * Gets the effective value of the specified dependency property.
     * @param {Integer} object_R 
     * @param {Integer} propertyIndex The index of the  property to get the value from.
     * @returns {Integer} The effective value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-getproperty
     */
    GetProperty(object_R, propertyIndex) {
        result := ComCall(16, this, "uint", object_R, "uint", propertyIndex, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Replaces an existing resource with a new one of the same type.
     * @param {Integer} resourceDictionary The dictionary that contains the resource to replace.
     * @param {Integer} key The key of the resource to replace.
     * @param {Integer} newValue The value to replace the resource with.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-replaceresource
     */
    ReplaceResource(resourceDictionary, key, newValue) {
        result := ComCall(17, this, "uint", resourceDictionary, "uint", key, "uint", newValue, "HRESULT")
        return result
    }

    /**
     * Returns an image that represents the object described by handle, or returns an error if the object does not have or cannot provide such an image.
     * @remarks
     * The returned image will have
     * 
     * <ul>
     * <li>Format:    <b>DXGI_FORMAT_B8G8R8A8_UNORM</b></li>
     * <li>AlphaMode: <b>DXGI_ALPHA_MODE_PREMULTIPLIED</b></li>
     * </ul>
     *  If the requested bitmap falls within the max pixel width and max pixel height specified, then the bitmap will be returned in its original size. If the size of the image is larger than either one of the two max values specified, then, before the bitmap is returned, the bitmap will be uniformly scaled down until its dimensions fall within the boundaries of the <i>maxPixelWidth</i> and <i>maxPixelHeight</i> specified.
     * @param {Integer} handle The handle associated with the visual for which the caller is requesting a bitmap.
     * @param {Integer} options A flag that specifies whether only the texture associated with the visual should be rendered, or whether the texture and its children should be rendered.
     * @param {Integer} maxPixelWidth The maximum width, in pixels, of the returned bitmap.
     * @param {Integer} maxPixelHeight The maximum height, in pixels, of the returned bitmap.
     * @returns {IBitmapData} The structure containing the requested bitmap information as well as information pertaining to that bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-rendertargetbitmap
     */
    RenderTargetBitmap(handle, options, maxPixelWidth, maxPixelHeight) {
        result := ComCall(18, this, "uint", handle, "int", options, "uint", maxPixelWidth, "uint", maxPixelHeight, "ptr*", &ppBitmapData := 0, "HRESULT")
        return IBitmapData(ppBitmapData)
    }
}
