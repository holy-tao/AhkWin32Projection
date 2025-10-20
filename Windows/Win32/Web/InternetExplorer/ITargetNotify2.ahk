#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITargetNotify.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetNotify2 extends ITargetNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetNotify2
     * @type {Guid}
     */
    static IID => Guid("{3050f6b1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOptionString"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOptions 
     * @returns {HRESULT} 
     */
    GetOptionString(pbstrOptions) {
        result := ComCall(5, this, "ptr", pbstrOptions, "HRESULT")
        return result
    }
}
