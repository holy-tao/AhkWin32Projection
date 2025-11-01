#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugStackFrame
     * @type {Guid}
     */
    static IID => Guid("{51973c17-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodeContext", "GetDescriptionString", "GetLanguageString", "GetThread", "GetDebugProperty"]

    /**
     * 
     * @param {Pointer<IDebugCodeContext>} ppcc 
     * @returns {HRESULT} 
     */
    GetCodeContext(ppcc) {
        result := ComCall(3, this, "ptr*", ppcc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetDescriptionString(fLong, pbstrDescription) {
        result := ComCall(4, this, "int", fLong, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @param {Pointer<BSTR>} pbstrLanguage 
     * @returns {HRESULT} 
     */
    GetLanguageString(fLong, pbstrLanguage) {
        result := ComCall(5, this, "int", fLong, "ptr", pbstrLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationThread>} ppat 
     * @returns {HRESULT} 
     */
    GetThread(ppat) {
        result := ComCall(6, this, "ptr*", ppat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugProperty>} ppDebugProp 
     * @returns {HRESULT} 
     */
    GetDebugProperty(ppDebugProp) {
        result := ComCall(7, this, "ptr*", ppDebugProp, "HRESULT")
        return result
    }
}
