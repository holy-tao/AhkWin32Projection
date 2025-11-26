#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes the properties of an annotation in a document.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iannotationprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAnnotationProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnnotationProvider
     * @type {Guid}
     */
    static IID => Guid("{f95c7e80-bd63-4601-9782-445ebff011fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnnotationTypeId", "get_AnnotationTypeName", "get_Author", "get_DateTime", "get_Target"]

    /**
     * @type {Integer} 
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
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypeid
     */
    get_AnnotationTypeId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * The name of this annotation type.
     * @remarks
     * 
     * The name of the annotation type can correspond to one of the annotation type identifiers (for example, “Comment” for  <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">AnnotationType_Comment</a>), but it is not required to.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypename
     */
    get_AnnotationTypeName() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * The name of the annotation author.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iannotationprovider-get_author
     */
    get_Author() {
        retVal := BSTR()
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * The date and time when this annotation was created.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iannotationprovider-get_datetime
     */
    get_DateTime() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * The UI Automation element that is being annotated.
     * @returns {IRawElementProviderSimple} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iannotationprovider-get_target
     */
    get_Target() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IRawElementProviderSimple(retVal)
    }
}
