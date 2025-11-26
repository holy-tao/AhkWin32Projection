#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the properties of an annotation in a document.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationannotationpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationAnnotationPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationAnnotationPattern
     * @type {Guid}
     */
    static IID => Guid("{9a175b21-339e-41b1-8e8b-623f6b681098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentAnnotationTypeId", "get_CurrentAnnotationTypeName", "get_CurrentAuthor", "get_CurrentDateTime", "get_CurrentTarget", "get_CachedAnnotationTypeId", "get_CachedAnnotationTypeName", "get_CachedAuthor", "get_CachedDateTime", "get_CachedTarget"]

    /**
     * @type {Integer} 
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
     * @type {Integer} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentannotationtypeid
     */
    get_CurrentAnnotationTypeId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentannotationtypename
     */
    get_CurrentAnnotationTypeName() {
        retVal := BSTR()
        result := ComCall(4, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentauthor
     */
    get_CurrentAuthor() {
        retVal := BSTR()
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currentdatetime
     */
    get_CurrentDateTime() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_currenttarget
     */
    get_CurrentTarget() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedannotationtypeid
     */
    get_CachedAnnotationTypeId() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedannotationtypename
     */
    get_CachedAnnotationTypeName() {
        retVal := BSTR()
        result := ComCall(9, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedauthor
     */
    get_CachedAuthor() {
        retVal := BSTR()
        result := ComCall(10, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cacheddatetime
     */
    get_CachedDateTime() {
        retVal := BSTR()
        result := ComCall(11, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationannotationpattern-get_cachedtarget
     */
    get_CachedTarget() {
        result := ComCall(12, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }
}
