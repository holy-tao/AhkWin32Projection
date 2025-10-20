#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Image.ahk

/**
 * Represents a producer of pixels that can fill an arbitrary 2D plane.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/nn-d2d1_3-id2d1imagesource
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ImageSource extends ID2D1Image{
    /**
     * The interface identifier for ID2D1ImageSource
     * @type {Guid}
     */
    static IID => Guid("{c9b664e5-74a1-4378-9ac2-eefc37a3f4d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @returns {HRESULT} 
     */
    OfferResources() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} resourcesDiscarded 
     * @returns {HRESULT} 
     */
    TryReclaimResources(resourcesDiscarded) {
        result := ComCall(5, this, "ptr", resourcesDiscarded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
