#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataError
     * @type {Guid}
     */
    static IID => Guid("{b81ff171-20f3-11d2-8dcc-00a0c9b09c19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnError"]

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} token 
     * @returns {HRESULT} 
     */
    OnError(hrError, token) {
        result := ComCall(3, this, "int", hrError, "uint", token, "HRESULT")
        return result
    }
}
