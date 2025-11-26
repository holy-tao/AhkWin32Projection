#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISWbemObject.ahk
#Include .\ISWbemSecurity.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemEventSource extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemEventSource
     * @type {Guid}
     */
    static IID => Guid("{27d54d92-0ebe-11d2-8b22-00600806d9b6}")

    /**
     * The class identifier for SWbemEventSource
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d58-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NextEvent", "get_Security_"]

    /**
     * @type {ISWbemSecurity} 
     */
    Security_ {
        get => this.get_Security_()
    }

    /**
     * 
     * @param {Integer} iTimeoutMs 
     * @returns {ISWbemObject} 
     */
    NextEvent(iTimeoutMs) {
        result := ComCall(7, this, "int", iTimeoutMs, "ptr*", &objWbemObject := 0, "HRESULT")
        return ISWbemObject(objWbemObject)
    }

    /**
     * 
     * @returns {ISWbemSecurity} 
     */
    get_Security_() {
        result := ComCall(8, this, "ptr*", &objWbemSecurity := 0, "HRESULT")
        return ISWbemSecurity(objWbemSecurity)
    }
}
