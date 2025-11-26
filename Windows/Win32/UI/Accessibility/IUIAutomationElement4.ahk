#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElementArray.ahk
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
     * @type {Integer} 
     */
    CurrentPositionInSet {
        get => this.get_CurrentPositionInSet()
    }

    /**
     * @type {Integer} 
     */
    CurrentSizeOfSet {
        get => this.get_CurrentSizeOfSet()
    }

    /**
     * @type {Integer} 
     */
    CurrentLevel {
        get => this.get_CurrentLevel()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentAnnotationTypes {
        get => this.get_CurrentAnnotationTypes()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CurrentAnnotationObjects {
        get => this.get_CurrentAnnotationObjects()
    }

    /**
     * @type {Integer} 
     */
    CachedPositionInSet {
        get => this.get_CachedPositionInSet()
    }

    /**
     * @type {Integer} 
     */
    CachedSizeOfSet {
        get => this.get_CachedSizeOfSet()
    }

    /**
     * @type {Integer} 
     */
    CachedLevel {
        get => this.get_CachedLevel()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CachedAnnotationTypes {
        get => this.get_CachedAnnotationTypes()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CachedAnnotationObjects {
        get => this.get_CachedAnnotationObjects()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentpositioninset
     */
    get_CurrentPositionInSet() {
        result := ComCall(94, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentsizeofset
     */
    get_CurrentSizeOfSet() {
        result := ComCall(95, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentlevel
     */
    get_CurrentLevel() {
        result := ComCall(96, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationtypes
     */
    get_CurrentAnnotationTypes() {
        result := ComCall(97, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationobjects
     */
    get_CurrentAnnotationObjects() {
        result := ComCall(98, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedpositioninset
     */
    get_CachedPositionInSet() {
        result := ComCall(99, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedsizeofset
     */
    get_CachedSizeOfSet() {
        result := ComCall(100, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedlevel
     */
    get_CachedLevel() {
        result := ComCall(101, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationtypes
     */
    get_CachedAnnotationTypes() {
        result := ComCall(102, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationobjects
     */
    get_CachedAnnotationObjects() {
        result := ComCall(103, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
