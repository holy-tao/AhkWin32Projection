#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemSink extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemSink
     * @type {Guid}
     */
    static IID => Guid("{75718c9f-f029-11d1-a1ac-00c04fb6c223}")

    /**
     * The class identifier for SWbemSink
     * @type {Guid}
     */
    static CLSID => Guid("{75718c9a-f029-11d1-a1ac-00c04fb6c223}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
