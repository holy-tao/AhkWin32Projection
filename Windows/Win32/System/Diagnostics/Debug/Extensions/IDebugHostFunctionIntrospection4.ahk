#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include .\IDebugHostFunctionIntrospection3.ahk
#Include .\Location.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugHostFunctionIntrospection4 extends IDebugHostFunctionIntrospection3 {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostFunctionIntrospection4
     * @type {Guid}
     */
    static IID => Guid("{f93f6699-1f2e-4fb2-8164-363a78f7914e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPrologueRange", "GetEpilogueRange"]

    /**
     * @param {Pointer<Location>} pPrologueStart 
     * @param {Pointer<Location>} pPrologueEnd 
     * @returns {HRESULT} 
     */
    GetPrologueRange(pPrologueStart, pPrologueEnd) {
        result := ComCall(9, this, "ptr", pPrologueStart, "ptr", pPrologueEnd, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Location>} pEpilogueStart 
     * @param {Pointer<Location>} pEpilogueEnd 
     * @returns {HRESULT} 
     */
    GetEpilogueRange(pEpilogueStart, pEpilogueEnd) {
        result := ComCall(10, this, "ptr", pEpilogueStart, "ptr", pEpilogueEnd, "HRESULT")
        return result
    }
}
