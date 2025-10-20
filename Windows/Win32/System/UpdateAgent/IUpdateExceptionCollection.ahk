#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an ordered read-only list of IUpdateException interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateexceptioncollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateExceptionCollection extends IDispatch{
    /**
     * The interface identifier for IUpdateExceptionCollection
     * @type {Guid}
     */
    static IID => Guid("{503626a3-8e14-4729-9355-0fe664bd2321}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUpdateException>} retval 
     * @returns {HRESULT} 
     */
    get_Item(index, retval) {
        result := ComCall(7, this, "int", index, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_Count(retval) {
        result := ComCall(9, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
