#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class IDebugStackFrame extends IUnknown{
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
     * 
     * @param {Pointer<IDebugCodeContext>} ppcc 
     * @returns {HRESULT} 
     */
    GetCodeContext(ppcc) {
        result := ComCall(3, this, "ptr", ppcc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetDescriptionString(fLong, pbstrDescription) {
        result := ComCall(4, this, "int", fLong, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @param {Pointer<BSTR>} pbstrLanguage 
     * @returns {HRESULT} 
     */
    GetLanguageString(fLong, pbstrLanguage) {
        result := ComCall(5, this, "int", fLong, "ptr", pbstrLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugApplicationThread>} ppat 
     * @returns {HRESULT} 
     */
    GetThread(ppat) {
        result := ComCall(6, this, "ptr", ppat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugProperty>} ppDebugProp 
     * @returns {HRESULT} 
     */
    GetDebugProperty(ppDebugProp) {
        result := ComCall(7, this, "ptr", ppDebugProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
