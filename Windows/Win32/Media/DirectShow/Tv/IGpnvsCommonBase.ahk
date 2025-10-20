#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IGpnvsCommonBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpnvsCommonBase
     * @type {Guid}
     */
    static IID => Guid("{907e0b5c-e42d-4f04-91f0-26f401f36907}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValueUpdateName"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetValueUpdateName(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }
}
