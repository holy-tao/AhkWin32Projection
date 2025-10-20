#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLErrorInfo extends IUnknown{
    /**
     * The interface identifier for ISQLErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a74-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSQLState 
     * @param {Pointer<Int32>} plNativeError 
     * @returns {HRESULT} 
     */
    GetSQLInfo(pbstrSQLState, plNativeError) {
        result := ComCall(3, this, "ptr", pbstrSQLState, "int*", plNativeError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
