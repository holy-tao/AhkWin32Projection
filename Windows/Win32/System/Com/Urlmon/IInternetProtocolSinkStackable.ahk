#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IInternetProtocolSinkStackable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInternetProtocolSinkStackable
     * @type {Guid}
     */
    static IID => Guid("{79eac9f0-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchSink", "CommitSwitch", "RollbackSwitch"]

    /**
     * 
     * @param {IInternetProtocolSink} pOIProtSink 
     * @returns {HRESULT} 
     */
    SwitchSink(pOIProtSink) {
        result := ComCall(3, this, "ptr", pOIProtSink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CommitSwitch() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RollbackSwitch() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
