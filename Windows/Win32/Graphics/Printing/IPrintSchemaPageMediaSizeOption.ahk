#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaOption.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaPageMediaSizeOption extends IPrintSchemaOption{
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
     * 
     * @param {Pointer<UInt32>} pulWidth 
     * @returns {HRESULT} 
     */
    get_WidthInMicrons(pulWidth) {
        result := ComCall(14, this, "uint*", pulWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulHeight 
     * @returns {HRESULT} 
     */
    get_HeightInMicrons(pulHeight) {
        result := ComCall(15, this, "uint*", pulHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
