#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UIA_ANNOTATIONTYPE.ahk" { UIA_ANNOTATIONTYPE }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Provides access to the properties of an annotation in a document.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationannotationpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationAnnotationPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationAnnotationPattern
     * @type {Guid}
     */
    static IID := Guid("{9a175b21-339e-41b1-8e8b-623f6b681098}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationAnnotationPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentAnnotationTypeId   : IntPtr
        get_CurrentAnnotationTypeName : IntPtr
        get_CurrentAuthor             : IntPtr
        get_CurrentDateTime           : IntPtr
        get_CurrentTarget             : IntPtr
        get_CachedAnnotationTypeId    : IntPtr
        get_CachedAnnotationTypeName  : IntPtr
        get_CachedAuthor              : IntPtr
        get_CachedDateTime            : IntPtr
        get_CachedTarget              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationAnnotationPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_ANNOTATIONTYPE} 
     */
    CurrentAnnotationTypeId {
        get => this.get_CurrentAnnotationTypeId()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAnnotationTypeName {
        get => this.get_CurrentAnnotationTypeName()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAuthor {
        get => this.get_CurrentAuthor()
    }

    /**
     * @type {BSTR} 
     */
    CurrentDateTime {
        get => this.get_CurrentDateTime()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentTarget {
        get => this.get_CurrentTarget()
    }

    /**
     * @type {UIA_ANNOTATIONTYPE} 
     */
    CachedAnnotationTypeId {
        get => this.get_CachedAnnotationTypeId()
    }

    /**
     * @type {BSTR} 
     */
    CachedAnnotationTypeName {
        get => this.get_CachedAnnotationTypeName()
    }

    /**
     * @type {BSTR} 
     */
    CachedAuthor {
        get => this.get_CachedAuthor()
    }

    /**
     * @type {BSTR} 
     */
    CachedDateTime {
        get => this.get_CachedDateTime()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedTarget {
        get => this.get_CachedTarget()
    }

    /**
     * Retrieves a value that identifies the annotation's type.
     * @returns {UIA_ANNOTATIONTYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentannotationtypeid
     */
    get_CurrentAnnotationTypeId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the localized name of this annotation's type.
     * @remarks
     * The name of the annotation type can correspond to one of the annotation type identifiers (for example, “Comment” for  <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">AnnotationType_Comment</a>), but it is not required to.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentannotationtypename
     */
    get_CurrentAnnotationTypeName() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the annotation author.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentauthor
     */
    get_CurrentAuthor() {
        retVal := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the date and time that this annotation was created.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentdatetime
     */
    get_CurrentDateTime() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the element that is being annotated.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currenttarget
     */
    get_CurrentTarget() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves a cached value that identifies this annotation's type.
     * @returns {UIA_ANNOTATIONTYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedannotationtypeid
     */
    get_CachedAnnotationTypeId() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached localized name of this annotation's type.
     * @remarks
     * The name of the annotation type can correspond to one of the annotation type identifiers (for example, “Comment” for  <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">AnnotationType_Comment</a>), but it is not required to.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedannotationtypename
     */
    get_CachedAnnotationTypeName() {
        retVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the annotation author.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedauthor
     */
    get_CachedAuthor() {
        retVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached date and time that this annotation was created.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cacheddatetime
     */
    get_CachedDateTime() {
        retVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that is being annotated.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedtarget
     */
    get_CachedTarget() {
        result := ComCall(12, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    Query(iid) {
        if (IUIAutomationAnnotationPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentAnnotationTypeId := CallbackCreate(GetMethod(implObj, "get_CurrentAnnotationTypeId"), flags, 2)
        this.vtbl.get_CurrentAnnotationTypeName := CallbackCreate(GetMethod(implObj, "get_CurrentAnnotationTypeName"), flags, 2)
        this.vtbl.get_CurrentAuthor := CallbackCreate(GetMethod(implObj, "get_CurrentAuthor"), flags, 2)
        this.vtbl.get_CurrentDateTime := CallbackCreate(GetMethod(implObj, "get_CurrentDateTime"), flags, 2)
        this.vtbl.get_CurrentTarget := CallbackCreate(GetMethod(implObj, "get_CurrentTarget"), flags, 2)
        this.vtbl.get_CachedAnnotationTypeId := CallbackCreate(GetMethod(implObj, "get_CachedAnnotationTypeId"), flags, 2)
        this.vtbl.get_CachedAnnotationTypeName := CallbackCreate(GetMethod(implObj, "get_CachedAnnotationTypeName"), flags, 2)
        this.vtbl.get_CachedAuthor := CallbackCreate(GetMethod(implObj, "get_CachedAuthor"), flags, 2)
        this.vtbl.get_CachedDateTime := CallbackCreate(GetMethod(implObj, "get_CachedDateTime"), flags, 2)
        this.vtbl.get_CachedTarget := CallbackCreate(GetMethod(implObj, "get_CachedTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentAnnotationTypeId)
        CallbackFree(this.vtbl.get_CurrentAnnotationTypeName)
        CallbackFree(this.vtbl.get_CurrentAuthor)
        CallbackFree(this.vtbl.get_CurrentDateTime)
        CallbackFree(this.vtbl.get_CurrentTarget)
        CallbackFree(this.vtbl.get_CachedAnnotationTypeId)
        CallbackFree(this.vtbl.get_CachedAnnotationTypeName)
        CallbackFree(this.vtbl.get_CachedAuthor)
        CallbackFree(this.vtbl.get_CachedDateTime)
        CallbackFree(this.vtbl.get_CachedTarget)
    }
}
