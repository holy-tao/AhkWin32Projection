#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationElement3.ahk" { IUIAutomationElement3 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Extends the IUIAutomationElement3 interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement4
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement4 extends IUIAutomationElement3 {
    /**
     * The interface identifier for IUIAutomationElement4
     * @type {Guid}
     */
    static IID := Guid("{3b6e233c-52fb-4063-a4c9-77c075c2a06b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement4 interfaces
    */
    struct Vtbl extends IUIAutomationElement3.Vtbl {
        get_CurrentPositionInSet     : IntPtr
        get_CurrentSizeOfSet         : IntPtr
        get_CurrentLevel             : IntPtr
        get_CurrentAnnotationTypes   : IntPtr
        get_CurrentAnnotationObjects : IntPtr
        get_CachedPositionInSet      : IntPtr
        get_CachedSizeOfSet          : IntPtr
        get_CachedLevel              : IntPtr
        get_CachedAnnotationTypes    : IntPtr
        get_CachedAnnotationObjects  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement4.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Returns the current 1-based integer for the ordinal position in the set for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentpositioninset
     */
    get_CurrentPositionInSet() {
        result := ComCall(94, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the current 1-based integer for the size of the set where the element is located.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentsizeofset
     */
    get_CurrentSizeOfSet() {
        result := ComCall(95, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the current 1-based integer for the level (hierarchy) for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentlevel
     */
    get_CurrentLevel() {
        result := ComCall(96, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the current list of annotation types associated with this element, such as comment, header, footer, and so on.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationtypes
     */
    get_CurrentAnnotationTypes() {
        result := ComCall(97, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the current list of annotation objects associated with this element, such as comment, header, footer, and so on.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_currentannotationobjects
     */
    get_CurrentAnnotationObjects() {
        result := ComCall(98, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Returns the cached 1-based integer for the ordinal position in the set for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedpositioninset
     */
    get_CachedPositionInSet() {
        result := ComCall(99, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the cached 1-based integer for the size of the set where the element is located.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedsizeofset
     */
    get_CachedSizeOfSet() {
        result := ComCall(100, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the cached 1-based integer for the level (hierarchy) for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedlevel
     */
    get_CachedLevel() {
        result := ComCall(101, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the cached list of annotation types associated with this element, such as comment, header, footer, and so on.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationtypes
     */
    get_CachedAnnotationTypes() {
        result := ComCall(102, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Returns the cached list of annotation objects associated with this element, such as comment, header, footer, and so on.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement4-get_cachedannotationobjects
     */
    get_CachedAnnotationObjects() {
        result := ComCall(103, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    Query(iid) {
        if (IUIAutomationElement4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentPositionInSet := CallbackCreate(GetMethod(implObj, "get_CurrentPositionInSet"), flags, 2)
        this.vtbl.get_CurrentSizeOfSet := CallbackCreate(GetMethod(implObj, "get_CurrentSizeOfSet"), flags, 2)
        this.vtbl.get_CurrentLevel := CallbackCreate(GetMethod(implObj, "get_CurrentLevel"), flags, 2)
        this.vtbl.get_CurrentAnnotationTypes := CallbackCreate(GetMethod(implObj, "get_CurrentAnnotationTypes"), flags, 2)
        this.vtbl.get_CurrentAnnotationObjects := CallbackCreate(GetMethod(implObj, "get_CurrentAnnotationObjects"), flags, 2)
        this.vtbl.get_CachedPositionInSet := CallbackCreate(GetMethod(implObj, "get_CachedPositionInSet"), flags, 2)
        this.vtbl.get_CachedSizeOfSet := CallbackCreate(GetMethod(implObj, "get_CachedSizeOfSet"), flags, 2)
        this.vtbl.get_CachedLevel := CallbackCreate(GetMethod(implObj, "get_CachedLevel"), flags, 2)
        this.vtbl.get_CachedAnnotationTypes := CallbackCreate(GetMethod(implObj, "get_CachedAnnotationTypes"), flags, 2)
        this.vtbl.get_CachedAnnotationObjects := CallbackCreate(GetMethod(implObj, "get_CachedAnnotationObjects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentPositionInSet)
        CallbackFree(this.vtbl.get_CurrentSizeOfSet)
        CallbackFree(this.vtbl.get_CurrentLevel)
        CallbackFree(this.vtbl.get_CurrentAnnotationTypes)
        CallbackFree(this.vtbl.get_CurrentAnnotationObjects)
        CallbackFree(this.vtbl.get_CachedPositionInSet)
        CallbackFree(this.vtbl.get_CachedSizeOfSet)
        CallbackFree(this.vtbl.get_CachedLevel)
        CallbackFree(this.vtbl.get_CachedAnnotationTypes)
        CallbackFree(this.vtbl.get_CachedAnnotationObjects)
    }
}
