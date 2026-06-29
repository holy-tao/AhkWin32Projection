#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UIA_ANNOTATIONTYPE.ahk" { UIA_ANNOTATIONTYPE }

/**
 * Exposes the properties of an annotation in a document.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iannotationprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IAnnotationProvider extends IUnknown {
    /**
     * The interface identifier for IAnnotationProvider
     * @type {Guid}
     */
    static IID := Guid("{f95c7e80-bd63-4601-9782-445ebff011fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAnnotationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AnnotationTypeId   : IntPtr
        get_AnnotationTypeName : IntPtr
        get_Author             : IntPtr
        get_DateTime           : IntPtr
        get_Target             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAnnotationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_ANNOTATIONTYPE} 
     */
    AnnotationTypeId {
        get => this.get_AnnotationTypeId()
    }

    /**
     * @type {BSTR} 
     */
    AnnotationTypeName {
        get => this.get_AnnotationTypeName()
    }

    /**
     * @type {BSTR} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {BSTR} 
     */
    DateTime {
        get => this.get_DateTime()
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * The annotation type identifier of this annotation.
     * @returns {UIA_ANNOTATIONTYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypeid
     */
    get_AnnotationTypeId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * The name of this annotation type.
     * @remarks
     * The name of the annotation type can correspond to one of the annotation type identifiers (for example, “Comment” for  <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">AnnotationType_Comment</a>), but it is not required to.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypename
     */
    get_AnnotationTypeName() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * The name of the annotation author.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_author
     */
    get_Author() {
        retVal := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * The date and time when this annotation was created.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_datetime
     */
    get_DateTime() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * The UI Automation element that is being annotated.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_target
     */
    get_Target() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IRawElementProviderSimple(retVal)
    }

    Query(iid) {
        if (IAnnotationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AnnotationTypeId := CallbackCreate(GetMethod(implObj, "get_AnnotationTypeId"), flags, 2)
        this.vtbl.get_AnnotationTypeName := CallbackCreate(GetMethod(implObj, "get_AnnotationTypeName"), flags, 2)
        this.vtbl.get_Author := CallbackCreate(GetMethod(implObj, "get_Author"), flags, 2)
        this.vtbl.get_DateTime := CallbackCreate(GetMethod(implObj, "get_DateTime"), flags, 2)
        this.vtbl.get_Target := CallbackCreate(GetMethod(implObj, "get_Target"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AnnotationTypeId)
        CallbackFree(this.vtbl.get_AnnotationTypeName)
        CallbackFree(this.vtbl.get_Author)
        CallbackFree(this.vtbl.get_DateTime)
        CallbackFree(this.vtbl.get_Target)
    }
}
