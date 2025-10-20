#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IActiveScriptParseProcedure64.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptParseProcedure2_64 extends IActiveScriptParseProcedure64{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptParseProcedure2_64
     * @type {Guid}
     */
    static IID => Guid("{fe7c4271-210c-448d-9f54-76dab7047b28}")

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
