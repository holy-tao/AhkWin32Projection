#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IVisualTreeService.ahk

/**
 * Represents additional capabilities of an IVisualTreeService object.
 * @see https://docs.microsoft.com/windows/win32/api//xamlom/nn-xamlom-ivisualtreeservice2
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
     * 
     * @param {Integer} object 
     * @param {PWSTR} propertyName 
     * @param {Pointer<Integer>} pPropertyIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-getpropertyindex
     */
    GetPropertyIndex(object, propertyName, pPropertyIndex) {
        propertyName := propertyName is String ? StrPtr(propertyName) : propertyName

        result := ComCall(15, this, "uint", object, "ptr", propertyName, "uint*", pPropertyIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} object 
     * @param {Integer} propertyIndex 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-getproperty
     */
    GetProperty(object, propertyIndex, pValue) {
        result := ComCall(16, this, "uint", object, "uint", propertyIndex, "uint*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} resourceDictionary 
     * @param {Integer} key 
     * @param {Integer} newValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-replaceresource
     */
    ReplaceResource(resourceDictionary, key, newValue) {
        result := ComCall(17, this, "uint", resourceDictionary, "uint", key, "uint", newValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} handle 
     * @param {Integer} options 
     * @param {Integer} maxPixelWidth 
     * @param {Integer} maxPixelHeight 
     * @param {Pointer<IBitmapData>} ppBitmapData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/nf-xamlom-ivisualtreeservice2-rendertargetbitmap
     */
    RenderTargetBitmap(handle, options, maxPixelWidth, maxPixelHeight, ppBitmapData) {
        result := ComCall(18, this, "uint", handle, "int", options, "uint", maxPixelWidth, "uint", maxPixelHeight, "ptr*", ppBitmapData, "HRESULT")
        return result
    }
}
