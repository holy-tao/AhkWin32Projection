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
     * @type {Integer} 
     */
    ImageableSizeWidthInMicrons {
        get => this.get_ImageableSizeWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ImageableSizeHeightInMicrons {
        get => this.get_ImageableSizeHeightInMicrons()
    }

    /**
     * @type {Integer} 
     */
    OriginWidthInMicrons {
        get => this.get_OriginWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    OriginHeightInMicrons {
        get => this.get_OriginHeightInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ExtentWidthInMicrons {
        get => this.get_ExtentWidthInMicrons()
    }

    /**
     * @type {Integer} 
     */
    ExtentHeightInMicrons {
        get => this.get_ExtentHeightInMicrons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageableSizeWidthInMicrons() {
        result := ComCall(10, this, "uint*", &pulImageableSizeWidth := 0, "HRESULT")
        return pulImageableSizeWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImageableSizeHeightInMicrons() {
        result := ComCall(11, this, "uint*", &pulImageableSizeHeight := 0, "HRESULT")
        return pulImageableSizeHeight
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginWidthInMicrons() {
        result := ComCall(12, this, "uint*", &pulOriginWidth := 0, "HRESULT")
        return pulOriginWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginHeightInMicrons() {
        result := ComCall(13, this, "uint*", &pulOriginHeight := 0, "HRESULT")
        return pulOriginHeight
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtentWidthInMicrons() {
        result := ComCall(14, this, "uint*", &pulExtentWidth := 0, "HRESULT")
        return pulExtentWidth
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExtentHeightInMicrons() {
        result := ComCall(15, this, "uint*", &pulExtentHeight := 0, "HRESULT")
        return pulExtentHeight
    }
}
