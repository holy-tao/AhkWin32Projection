#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemMethodSet extends IDispatch{
    /**
     * The interface identifier for ISWbemMethodSet
     * @type {Guid}
     */
    static IID => Guid("{c93ba292-d955-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemMethodSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5a-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemMethod>} objWbemMethod 
     * @returns {HRESULT} 
     */
    Item(strName, iFlags, objWbemMethod) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr", objWbemMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        result := ComCall(9, this, "int*", iCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
