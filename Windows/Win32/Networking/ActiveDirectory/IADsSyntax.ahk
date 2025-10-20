#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IADs.ahk

/**
 * The IADsSyntax interface specifies methods to identify and modify the available Automation data types used to represent its data.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadssyntax
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsSyntax extends IADs{
    /**
     * The interface identifier for IADsSyntax
     * @type {Guid}
     */
    static IID => Guid("{c8f93dd2-4ae0-11cf-9e73-00aa004a5691}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<Int32>} retval 
     * @returns {HRESULT} 
     */
    get_OleAutoDataType(retval) {
        result := ComCall(20, this, "int*", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnOleAutoDataType 
     * @returns {HRESULT} 
     */
    put_OleAutoDataType(lnOleAutoDataType) {
        result := ComCall(21, this, "int", lnOleAutoDataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
