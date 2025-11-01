#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptParseProcedure32.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptParseProcedure2_32 extends IActiveScriptParseProcedure32{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptParseProcedure2_32
     * @type {Guid}
     */
    static IID => Guid("{71ee5b20-fb04-11d1-b3a8-00a0c911e8b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
