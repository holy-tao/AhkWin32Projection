#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBitmapProperties.ahk
#Include .\IBitmapPropertiesView.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides read and write access to image properties and metadata.
 * @remarks
 * An instance of this class can represent one of the following:
 * 
 * 
 * + The entire contents of the frame metadata.
 * + The entire contents of the container level metadata.
 * + A specific nested metadata block within the frame or container.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapproperties
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class BitmapProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapProperties.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously sets one or more bitmap properties.
     * @remarks
     * Use a [BitmapPropertySet](bitmappropertyset.md) to store metadata items that you want to set on the encoder. Each metadata item is a key-value pair.
     * 
     * The key is a string that identifies the metadata item to set. [BitmapEncoder](bitmapencoder.md) accepts some Windows properties as well as queries constructed using the WIC metadata query language. For a list of supported Windows properties, see [Supported Windows Properties](/windows/desktop/properties/props). For a summary of supported WIC metadata queries, see the [WIC Native Image Format Metadata Queries](/windows/desktop/wic/-wic-native-image-format-metadata-queries) topic.
     * 
     * The value is a [BitmapTypedValue](bitmaptypedvalue.md) which allows you to associate the actual metadata value with an explicit data type ([Windows.Foundation.PropertyType](../windows.foundation/propertytype.md)).
     * 
     * Each image format has specific requirements around the type of every bitmap property, and you must ensure that the [Type](bitmaptypedvalue_type.md) field of each [BitmapTypedValue](bitmaptypedvalue.md) is correctly set for the selected property. For example, the [System.Photo.Orientation](/windows/desktop/properties/props-system-photo-orientation) Windows property is stored in the file as a UInt16, and therefore the [Type](bitmaptypedvalue_type.md) field must be set to UInt16. For more info about Windows property types, see [Photo Metadata Policies](/windows/desktop/wic/photo-metadata-policies). For more info about Windows Imaging Component metadata query types, see [Native Image Format Metadata Queries](/windows/desktop/wic/-wic-native-image-format-metadata-queries).
     * @param {IIterable<IKeyValuePair<HSTRING, BitmapTypedValue>>} propertiesToSet A collection of key-value pairs representing the bitmap properties to be set. Each key is a string containing the Windows property or metadata query, and the corresponding value is a [BitmapTypedValue](bitmaptypedvalue.md) with the data and the correct [PropertyType](../windows.foundation/propertytype.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapproperties.setpropertiesasync
     */
    SetPropertiesAsync(propertiesToSet) {
        if (!this.HasProp("__IBitmapProperties")) {
            if ((queryResult := this.QueryInterface(IBitmapProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBitmapProperties := IBitmapProperties(outPtr)
        }

        return this.__IBitmapProperties.SetPropertiesAsync(propertiesToSet)
    }

    /**
     * Asynchronously retrieves one or more bitmap properties.
     * @remarks
     * This method is identical to [BitmapPropertiesView.GetPropertiesAsync](bitmappropertiesview_getpropertiesasync_1829853186.md).
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection of strings containing the specified property keys.
     * @returns {IAsyncOperation<BitmapPropertySet>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.imaging.bitmapproperties.getpropertiesasync
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
