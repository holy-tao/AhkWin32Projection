#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkTablet3 extends IDispatch{
    /**
     * The interface identifier for IInkTablet3
     * @type {Guid}
     */
    static IID => Guid("{7e313997-1327-41dd-8ca9-79f24be17250}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pIsMultiTouch 
     * @returns {HRESULT} 
     */
    get_IsMultiTouch(pIsMultiTouch) {
        result := ComCall(7, this, "ptr", pIsMultiTouch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMaximumCursors 
     * @returns {HRESULT} 
     */
    get_MaximumCursors(pMaximumCursors) {
        result := ComCall(8, this, "uint*", pMaximumCursors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
