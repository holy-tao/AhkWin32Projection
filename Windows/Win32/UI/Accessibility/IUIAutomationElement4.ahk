#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement3.ahk

/**
 * Extends the IUIAutomationElement3 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement4
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement4 extends IUIAutomationElement3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement4
     * @type {Guid}
     */
    static IID => Guid("{3b6e233c-52fb-4063-a4c9-77c075c2a06b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 94

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentPositionInSet", "get_CurrentSizeOfSet", "get_CurrentLevel", "get_CurrentAnnotationTypes", "get_CurrentAnnotationObjects", "get_CachedPositionInSet", "get_CachedSizeOfSet", "get_CachedLevel", "get_CachedAnnotationTypes", "get_CachedAnnotationObjects"]

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentpositioninset
     */
    get_CurrentPositionInSet(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(94, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentsizeofset
     */
    get_CurrentSizeOfSet(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(95, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentlevel
     */
    get_CurrentLevel(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(96, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationtypes
     */
    get_CurrentAnnotationTypes(retVal) {
        retValMarshal := retVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(97, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationobjects
     */
    get_CurrentAnnotationObjects(retVal) {
        result := ComCall(98, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedpositioninset
     */
    get_CachedPositionInSet(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(99, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedsizeofset
     */
    get_CachedSizeOfSet(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(100, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedlevel
     */
    get_CachedLevel(retVal) {
        retValMarshal := retVal is VarRef ? "int*" : "ptr"

        result := ComCall(101, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationtypes
     */
    get_CachedAnnotationTypes(retVal) {
        retValMarshal := retVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(102, this, retValMarshal, retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationobjects
     */
    get_CachedAnnotationObjects(retVal) {
        result := ComCall(103, this, "ptr*", retVal, "HRESULT")
        return result
    }
}
