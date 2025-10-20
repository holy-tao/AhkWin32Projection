#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Image.ahk

/**
 * Represents an image source which shares resources with an original image source.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1transformedimagesource
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1TransformedImageSource extends ID2D1Image{
    /**
     * The interface identifier for ID2D1TransformedImageSource
     * @type {Guid}
     */
    static IID => Guid("{7f1f79e5-2796-416c-8f55-700f911445e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Pointer<ID2D1ImageSource>} imageSource 
     * @returns {String} Nothing - always returns an empty string
     */
    GetSource(imageSource) {
        ComCall(4, this, "ptr", imageSource)
        return result
    }

    /**
     * 
     * @param {Pointer<D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES>} properties 
     * @returns {String} Nothing - always returns an empty string
     */
    GetProperties(properties) {
        ComCall(5, this, "ptr", properties)
        return result
    }
}
