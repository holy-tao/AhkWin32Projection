#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A collection of IXpsOMGradientStop interface pointers.
 * @remarks
 * 
  * For more information about the collection methods, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dd372931(v=vs.85)">Working with XPS OM Collection Interfaces</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomgradientstopcollection
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMGradientStopCollection extends IUnknown{
    /**
     * The interface identifier for IXpsOMGradientStopCollection
     * @type {Guid}
     */
    static IID => Guid("{c9174c3a-3cd3-4319-bda4-11a39392ceef}")

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
     * @param {Pointer<IXpsOMGradientStop>} stop 
     * @returns {HRESULT} 
     */
    GetAt(index, stop) {
        result := ComCall(4, this, "uint", index, "ptr", stop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IXpsOMGradientStop>} stop 
     * @returns {HRESULT} 
     */
    InsertAt(index, stop) {
        result := ComCall(5, this, "uint", index, "ptr", stop, "int")
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
     * @param {Pointer<IXpsOMGradientStop>} stop 
     * @returns {HRESULT} 
     */
    SetAt(index, stop) {
        result := ComCall(7, this, "uint", index, "ptr", stop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsOMGradientStop>} stop 
     * @returns {HRESULT} 
     */
    Append(stop) {
        result := ComCall(8, this, "ptr", stop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
