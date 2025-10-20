#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IBlockFormats extends IDispatch{
    /**
     * The interface identifier for IBlockFormats
     * @type {Guid}
     */
    static IID => Guid("{3050f830-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for BlockFormats
     * @type {Guid}
     */
    static CLSID => Guid("{3050f831-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} p 
     * @returns {HRESULT} 
     */
    get__NewEnum(p) {
        result := ComCall(7, this, "ptr", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} p 
     * @returns {HRESULT} 
     */
    get_Count(p) {
        result := ComCall(8, this, "int*", p, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarIndex 
     * @param {Pointer<BSTR>} pbstrBlockFormat 
     * @returns {HRESULT} 
     */
    Item(pvarIndex, pbstrBlockFormat) {
        result := ComCall(9, this, "ptr", pvarIndex, "ptr", pbstrBlockFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
