#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ExtendedProperty.ahk" { ExtendedProperty }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\UIA_STYLE_ID.ahk" { UIA_STYLE_ID }

/**
 * Enables Microsoft UI Automation clients to retrieve the visual styles associated with an element in a document.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationstylespattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationStylesPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationStylesPattern
     * @type {Guid}
     */
    static IID := Guid("{85b5f0a2-bd79-484a-ad2b-388c9838d5fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationStylesPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentStyleId                  : IntPtr
        get_CurrentStyleName                : IntPtr
        get_CurrentFillColor                : IntPtr
        get_CurrentFillPatternStyle         : IntPtr
        get_CurrentShape                    : IntPtr
        get_CurrentFillPatternColor         : IntPtr
        get_CurrentExtendedProperties       : IntPtr
        GetCurrentExtendedPropertiesAsArray : IntPtr
        get_CachedStyleId                   : IntPtr
        get_CachedStyleName                 : IntPtr
        get_CachedFillColor                 : IntPtr
        get_CachedFillPatternStyle          : IntPtr
        get_CachedShape                     : IntPtr
        get_CachedFillPatternColor          : IntPtr
        get_CachedExtendedProperties        : IntPtr
        GetCachedExtendedPropertiesAsArray  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationStylesPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_STYLE_ID} 
     */
    CurrentStyleId {
        get => this.get_CurrentStyleId()
    }

    /**
     * @type {BSTR} 
     */
    CurrentStyleName {
        get => this.get_CurrentStyleName()
    }

    /**
     * @type {Integer} 
     */
    CurrentFillColor {
        get => this.get_CurrentFillColor()
    }

    /**
     * @type {BSTR} 
     */
    CurrentFillPatternStyle {
        get => this.get_CurrentFillPatternStyle()
    }

    /**
     * @type {BSTR} 
     */
    CurrentShape {
        get => this.get_CurrentShape()
    }

    /**
     * @type {Integer} 
     */
    CurrentFillPatternColor {
        get => this.get_CurrentFillPatternColor()
    }

    /**
     * @type {BSTR} 
     */
    CurrentExtendedProperties {
        get => this.get_CurrentExtendedProperties()
    }

    /**
     * @type {UIA_STYLE_ID} 
     */
    CachedStyleId {
        get => this.get_CachedStyleId()
    }

    /**
     * @type {BSTR} 
     */
    CachedStyleName {
        get => this.get_CachedStyleName()
    }

    /**
     * @type {Integer} 
     */
    CachedFillColor {
        get => this.get_CachedFillColor()
    }

    /**
     * @type {BSTR} 
     */
    CachedFillPatternStyle {
        get => this.get_CachedFillPatternStyle()
    }

    /**
     * @type {BSTR} 
     */
    CachedShape {
        get => this.get_CachedShape()
    }

    /**
     * @type {Integer} 
     */
    CachedFillPatternColor {
        get => this.get_CachedFillPatternColor()
    }

    /**
     * @type {BSTR} 
     */
    CachedExtendedProperties {
        get => this.get_CachedExtendedProperties()
    }

    /**
     * Retrieves the identifier of the visual style associated with an element in a document.
     * @returns {UIA_STYLE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentstyleid
     */
    get_CurrentStyleId() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the visual style associated with an element in a document.
     * @remarks
     * The style name typically indicates the role of the element in the document, such as “Heading 1.”
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentstylename
     */
    get_CurrentStyleName() {
        retVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the fill color of an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentfillcolor
     */
    get_CurrentFillColor() {
        result := ComCall(5, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CurrentFillPatternStyle() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the shape of an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentshape
     */
    get_CurrentShape() {
        retVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the color of the pattern used to fill an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentfillpatterncolor
     */
    get_CurrentFillPatternColor() {
        result := ComCall(8, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a localized string that contains the list of extended properties for an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_currentextendedproperties
     */
    get_CurrentExtendedProperties() {
        retVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Pointer<Pointer<ExtendedProperty>>} propertyArray 
     * @param {Pointer<Integer>} propertyCount 
     * @returns {HRESULT} 
     */
    GetCurrentExtendedPropertiesAsArray(propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "ptr*" : "ptr"
        propertyCountMarshal := propertyCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, propertyArrayMarshal, propertyArray, propertyCountMarshal, propertyCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the cached identifier of the visual style associated with an element in a document.
     * @returns {UIA_STYLE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedstyleid
     */
    get_CachedStyleId() {
        result := ComCall(11, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the visual style associated with an element in a document.
     * @remarks
     * The style name typically indicates the role of the element in the document, such as “Heading 1.”
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedstylename
     */
    get_CachedStyleName() {
        retVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached fill color of an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedfillcolor
     */
    get_CachedFillColor() {
        result := ComCall(13, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CachedFillPatternStyle() {
        retVal := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached shape of an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedshape
     */
    get_CachedShape() {
        retVal := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached color of the pattern used to fill an element in a document.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedfillpatterncolor
     */
    get_CachedFillPatternColor() {
        result := ComCall(16, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached localized string that contains the list of extended properties for an element in a document.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstylespattern-get_cachedextendedproperties
     */
    get_CachedExtendedProperties() {
        retVal := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Pointer<Pointer<ExtendedProperty>>} propertyArray 
     * @param {Pointer<Integer>} propertyCount 
     * @returns {HRESULT} 
     */
    GetCachedExtendedPropertiesAsArray(propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "ptr*" : "ptr"
        propertyCountMarshal := propertyCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, propertyArrayMarshal, propertyArray, propertyCountMarshal, propertyCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationStylesPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentStyleId := CallbackCreate(GetMethod(implObj, "get_CurrentStyleId"), flags, 2)
        this.vtbl.get_CurrentStyleName := CallbackCreate(GetMethod(implObj, "get_CurrentStyleName"), flags, 2)
        this.vtbl.get_CurrentFillColor := CallbackCreate(GetMethod(implObj, "get_CurrentFillColor"), flags, 2)
        this.vtbl.get_CurrentFillPatternStyle := CallbackCreate(GetMethod(implObj, "get_CurrentFillPatternStyle"), flags, 2)
        this.vtbl.get_CurrentShape := CallbackCreate(GetMethod(implObj, "get_CurrentShape"), flags, 2)
        this.vtbl.get_CurrentFillPatternColor := CallbackCreate(GetMethod(implObj, "get_CurrentFillPatternColor"), flags, 2)
        this.vtbl.get_CurrentExtendedProperties := CallbackCreate(GetMethod(implObj, "get_CurrentExtendedProperties"), flags, 2)
        this.vtbl.GetCurrentExtendedPropertiesAsArray := CallbackCreate(GetMethod(implObj, "GetCurrentExtendedPropertiesAsArray"), flags, 3)
        this.vtbl.get_CachedStyleId := CallbackCreate(GetMethod(implObj, "get_CachedStyleId"), flags, 2)
        this.vtbl.get_CachedStyleName := CallbackCreate(GetMethod(implObj, "get_CachedStyleName"), flags, 2)
        this.vtbl.get_CachedFillColor := CallbackCreate(GetMethod(implObj, "get_CachedFillColor"), flags, 2)
        this.vtbl.get_CachedFillPatternStyle := CallbackCreate(GetMethod(implObj, "get_CachedFillPatternStyle"), flags, 2)
        this.vtbl.get_CachedShape := CallbackCreate(GetMethod(implObj, "get_CachedShape"), flags, 2)
        this.vtbl.get_CachedFillPatternColor := CallbackCreate(GetMethod(implObj, "get_CachedFillPatternColor"), flags, 2)
        this.vtbl.get_CachedExtendedProperties := CallbackCreate(GetMethod(implObj, "get_CachedExtendedProperties"), flags, 2)
        this.vtbl.GetCachedExtendedPropertiesAsArray := CallbackCreate(GetMethod(implObj, "GetCachedExtendedPropertiesAsArray"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentStyleId)
        CallbackFree(this.vtbl.get_CurrentStyleName)
        CallbackFree(this.vtbl.get_CurrentFillColor)
        CallbackFree(this.vtbl.get_CurrentFillPatternStyle)
        CallbackFree(this.vtbl.get_CurrentShape)
        CallbackFree(this.vtbl.get_CurrentFillPatternColor)
        CallbackFree(this.vtbl.get_CurrentExtendedProperties)
        CallbackFree(this.vtbl.GetCurrentExtendedPropertiesAsArray)
        CallbackFree(this.vtbl.get_CachedStyleId)
        CallbackFree(this.vtbl.get_CachedStyleName)
        CallbackFree(this.vtbl.get_CachedFillColor)
        CallbackFree(this.vtbl.get_CachedFillPatternStyle)
        CallbackFree(this.vtbl.get_CachedShape)
        CallbackFree(this.vtbl.get_CachedFillPatternColor)
        CallbackFree(this.vtbl.get_CachedExtendedProperties)
        CallbackFree(this.vtbl.GetCachedExtendedPropertiesAsArray)
    }
}
