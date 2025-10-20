#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of XPS_DASH structures.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomdashcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMDashCollection extends IUnknown{
    /**
     * The interface identifier for IXpsOMDashCollection
     * @type {Guid}
     */
    static IID => Guid("{081613f4-74eb-48f2-83b3-37a9ce2d7dc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<XPS_DASH>} dash 
     * @returns {HRESULT} 
     */
    GetAt(index, dash) {
        result := ComCall(4, this, "uint", index, "ptr", dash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<XPS_DASH>} dash 
     * @returns {HRESULT} 
     */
    InsertAt(index, dash) {
        result := ComCall(5, this, "uint", index, "ptr", dash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    RemoveAt(index) {
        result := ComCall(6, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<XPS_DASH>} dash 
     * @returns {HRESULT} 
     */
    SetAt(index, dash) {
        result := ComCall(7, this, "uint", index, "ptr", dash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<XPS_DASH>} dash 
     * @returns {HRESULT} 
     */
    Append(dash) {
        result := ComCall(8, this, "ptr", dash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
