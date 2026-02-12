#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapPropertiesView.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides read access to image properties and metadata. A particular instance of BitmapPropertiesView may represent the entire contents of the frame metadata, or any nested metadata block within the frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmappropertiesview
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapPropertiesView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapPropertiesView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapPropertiesView.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously retrieves one or more bitmap properties.
     * @remarks
     * The asynchronous operation produces a collection representing the requested image property keys and their values. The values are stored as [BitmapTypedValue](bitmaptypedvalue.md), which contains both the actual data as well as the [PropertyType](/windows/desktop/api/windows.foundation/ne-windows-foundation-propertytype) of the data.
     * 
     * A particular image may only contain some (or none) of the requested properties. In this case the collection will only have key-value pairs for the properties which were found in the image. You need to check for the existence of the property before you attempt to get data from it: 
     * 
     * ```javascript
     * bitmapPropertiesView.getPropertiesAsync(["System.Title"]).done(function (retrievedProperties) {
     *   if (retrievedProperties.hasKey("System.Title")) {
     * 	  	var titleProperty = retrievedProperties.lookup("System.Title");
     * 	  	var title = titleProperty.value;
     * 	 }
     * });
     * ```
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection of strings representing the property keys or queries that are being requested. Valid strings include [Windows properties](/windows/desktop/wic/photo-metadata-policies) and [Windows Imaging Component metadata queries](/windows/desktop/wic/-wic-native-image-format-metadata-queries).
     * @returns {IAsyncOperation<BitmapPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmappropertiesview.getpropertiesasync
     */
    GetPropertiesAsync(propertiesToRetrieve) {
        if (!this.HasProp("__IBitmapPropertiesView")) {
            if ((queryResult := this.QueryInterface(IBitmapPropertiesView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapPropertiesView := IBitmapPropertiesView(outPtr)
        }

        return this.__IBitmapPropertiesView.GetPropertiesAsync(propertiesToRetrieve)
    }

;@endregion Instance Methods
}
