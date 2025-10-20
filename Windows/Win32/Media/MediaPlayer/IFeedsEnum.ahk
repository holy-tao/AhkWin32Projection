#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedsEnum extends IDispatch{
    /**
     * The interface identifier for IFeedsEnum
     * @type {Guid}
     */
    static IID => Guid("{e3cd0028-2eed-4c60-8fae-a3225309a836}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} count 
     * @returns {HRESULT} 
     */
    get_Count(count) {
        result := ComCall(7, this, "int*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    Item(index, disp) {
        result := ComCall(8, this, "int", index, "ptr", disp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} enumVar 
     * @returns {HRESULT} 
     */
    get__NewEnum(enumVar) {
        result := ComCall(9, this, "ptr", enumVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
