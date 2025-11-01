#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IActiveScriptErrorDebug110 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveScriptErrorDebug110
     * @type {Guid}
     */
    static IID => Guid("{516e42b6-89a8-4530-937b-5f0708431442}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetExceptionThrownKind"]

    /**
     * 
     * @param {Pointer<Integer>} pExceptionKind 
     * @returns {HRESULT} 
     */
    GetExceptionThrownKind(pExceptionKind) {
        result := ComCall(3, this, "int*", pExceptionKind, "HRESULT")
        return result
    }
}
