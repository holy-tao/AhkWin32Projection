#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaPageImageableSize extends IPrintSchemaElement{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImageableSizeWidthInMicrons", "get_ImageableSizeHeightInMicrons", "get_OriginWidthInMicrons", "get_OriginHeightInMicrons", "get_ExtentWidthInMicrons", "get_ExtentHeightInMicrons"]

    /**
     * 
     * @param {Pointer<Integer>} pulImageableSizeWidth 
     * @returns {HRESULT} 
     */
    get_ImageableSizeWidthInMicrons(pulImageableSizeWidth) {
        result := ComCall(10, this, "uint*", pulImageableSizeWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulImageableSizeHeight 
     * @returns {HRESULT} 
     */
    get_ImageableSizeHeightInMicrons(pulImageableSizeHeight) {
        result := ComCall(11, this, "uint*", pulImageableSizeHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulOriginWidth 
     * @returns {HRESULT} 
     */
    get_OriginWidthInMicrons(pulOriginWidth) {
        result := ComCall(12, this, "uint*", pulOriginWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulOriginHeight 
     * @returns {HRESULT} 
     */
    get_OriginHeightInMicrons(pulOriginHeight) {
        result := ComCall(13, this, "uint*", pulOriginHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulExtentWidth 
     * @returns {HRESULT} 
     */
    get_ExtentWidthInMicrons(pulExtentWidth) {
        result := ComCall(14, this, "uint*", pulExtentWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulExtentHeight 
     * @returns {HRESULT} 
     */
    get_ExtentHeightInMicrons(pulExtentHeight) {
        result := ComCall(15, this, "uint*", pulExtentHeight, "HRESULT")
        return result
    }
}
