#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetThreadSwitch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetThreadSwitch
     * @type {Guid}
     */
    static IID => Guid("{79eac9e8-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Prepare", "Continue"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Prepare() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Continue() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
