#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaOption.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaPageMediaSizeOption extends IPrintSchemaOption{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchemaPageMediaSizeOption
     * @type {Guid}
     */
    static IID => Guid("{68746729-f493-4830-a10f-69028774605d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WidthInMicrons", "get_HeightInMicrons"]

    /**
     * 
     * @param {Pointer<Integer>} pulWidth 
     * @returns {HRESULT} 
     */
    get_WidthInMicrons(pulWidth) {
        pulWidthMarshal := pulWidth is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pulWidthMarshal, pulWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulHeight 
     * @returns {HRESULT} 
     */
    get_HeightInMicrons(pulHeight) {
        pulHeightMarshal := pulHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, pulHeightMarshal, pulHeight, "HRESULT")
        return result
    }
}
