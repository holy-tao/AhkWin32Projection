#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISQLGetDiagField extends IUnknown{
    /**
     * The interface identifier for ISQLGetDiagField
     * @type {Guid}
     */
    static IID => Guid("{228972f1-b5ff-11d0-8a80-00c04fd611cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<KAGGETDIAG>} pDiagInfo 
     * @returns {HRESULT} 
     */
    GetDiagField(pDiagInfo) {
        result := ComCall(3, this, "ptr", pDiagInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
