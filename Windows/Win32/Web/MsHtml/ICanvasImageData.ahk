#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ICanvasImageData extends IDispatch{
    /**
     * The interface identifier for ICanvasImageData
     * @type {Guid}
     */
    static IID => Guid("{3051071a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for CanvasImageData
     * @type {Guid}
     */
    static CLSID => Guid("{3051071b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<UInt32>} p 
     * @returns {HRESULT} 
     */
    get_width(p) {
        result := ComCall(7, this, "uint*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} p 
     * @returns {HRESULT} 
     */
    get_height(p) {
        result := ComCall(8, this, "uint*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} p 
     * @returns {HRESULT} 
     */
    get_data(p) {
        result := ComCall(9, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
