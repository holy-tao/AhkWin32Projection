#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugCodeContext.ahk
#Include ..\IDebugProperty.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\IDebugApplicationThread.ahk
#Include ..\..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
class IDebugStackFrame extends IUnknown {

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
     * @returns {IDebugCodeContext} 
     */
    GetCodeContext() {
        result := ComCall(3, this, "ptr*", &ppcc := 0, "HRESULT")
        return IDebugCodeContext(ppcc)
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetDescriptionString(fLong) {
        pbstrDescription := BSTR({Value: 0}, True)
        result := ComCall(4, this, "int", fLong, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BOOL} fLong 
     * @returns {BSTR} 
     */
    GetLanguageString(fLong) {
        pbstrLanguage := BSTR({Value: 0}, True)
        result := ComCall(5, this, "int", fLong, "ptr", pbstrLanguage, "HRESULT")
        return pbstrLanguage
    }

    /**
     * 
     * @returns {IDebugApplicationThread} 
     */
    GetThread() {
        result := ComCall(6, this, "ptr*", &ppat := 0, "HRESULT")
        return IDebugApplicationThread(ppat)
    }

    /**
     * 
     * @returns {IDebugProperty} 
     */
    GetDebugProperty() {
        result := ComCall(7, this, "ptr*", &ppDebugProp := 0, "HRESULT")
        return IDebugProperty(ppDebugProp)
    }
}
