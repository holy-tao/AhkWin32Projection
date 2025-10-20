#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaPageImageableSize extends IPrintSchemaElement{
    /**
     * The interface identifier for IPrintSchemaPageImageableSize
     * @type {Guid}
     */
    static IID => Guid("{7c85bf5e-dc7c-4f61-839b-4107e1c9b68e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<UInt32>} pulImageableSizeWidth 
     * @returns {HRESULT} 
     */
    get_ImageableSizeWidthInMicrons(pulImageableSizeWidth) {
        result := ComCall(10, this, "uint*", pulImageableSizeWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulImageableSizeHeight 
     * @returns {HRESULT} 
     */
    get_ImageableSizeHeightInMicrons(pulImageableSizeHeight) {
        result := ComCall(11, this, "uint*", pulImageableSizeHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulOriginWidth 
     * @returns {HRESULT} 
     */
    get_OriginWidthInMicrons(pulOriginWidth) {
        result := ComCall(12, this, "uint*", pulOriginWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulOriginHeight 
     * @returns {HRESULT} 
     */
    get_OriginHeightInMicrons(pulOriginHeight) {
        result := ComCall(13, this, "uint*", pulOriginHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulExtentWidth 
     * @returns {HRESULT} 
     */
    get_ExtentWidthInMicrons(pulExtentWidth) {
        result := ComCall(14, this, "uint*", pulExtentWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulExtentHeight 
     * @returns {HRESULT} 
     */
    get_ExtentHeightInMicrons(pulExtentHeight) {
        result := ComCall(15, this, "uint*", pulExtentHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
