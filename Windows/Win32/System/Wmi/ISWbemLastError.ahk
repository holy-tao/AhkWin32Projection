#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISWbemObject.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemLastError extends ISWbemObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemLastError
     * @type {Guid}
     */
    static IID => Guid("{d962db84-d4bb-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemLastError
     * @type {Guid}
     */
    static CLSID => Guid("{c2feeeac-cfcd-11d1-8b05-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
