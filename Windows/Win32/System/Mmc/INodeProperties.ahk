#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The INodeProperties interface retrieves text-only properties for a node.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-inodeproperties
 * @namespace Windows.Win32.System.Mmc
 */
export default struct INodeProperties extends IUnknown {
    /**
     * The interface identifier for INodeProperties
     * @type {Guid}
     */
    static IID := Guid("{15bc4d24-a522-4406-aa55-0749537a6865}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INodeProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INodeProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetProperty method retrieves text-only property values for a node. Your implementation of the INodeProperties::GetProperty method is called when an application based on the MMC 2.0 Automation Object Model retrieves the Node.Property property.
     * @remarks
     * The Extended View extension uses two properties: CCF_DESCRIPTION and CCF_HTML_DETAILS. As an alternative to supplying values for these properties using the data object to query the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-description">CCF_DESCRIPTION</a> and 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-html-details">CCF_HTML_DETAILS</a> clipboard formats, a snap-in can use <b>INodeProperties::GetProperty</b> to return the property values to the Extended View. This alternative is beneficial in situations where a snap-in's data object does not provide the desired information.
     * 
     * In addition to providing CCF_DESCRIPTION and CCF_HTML_DETAILS property values, a snap-in can use 
     * INodeProperties to provide values for other text-based properties (for example, with a new view extension).
     * 
     * For more information and a code example for <b>INodeProperties::GetProperty</b>, see 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/using-the-extended-view-extension-implementation-details">Using the Extended View Extension - Implementation Details</a>.
     * @param {IDataObject} pDataObject A pointer to the snap-in data object.
     * @param {BSTR} szPropertyName The name of the property retrieved.
     * @returns {BSTR} Text value for the property.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-inodeproperties-getproperty
     */
    GetProperty(pDataObject, szPropertyName) {
        szPropertyName := szPropertyName is String ? BSTR.Alloc(szPropertyName).Value : szPropertyName

        pbstrProperty := BSTR.Owned()
        result := ComCall(3, this, "ptr", pDataObject, BSTR, szPropertyName, BSTR.Ptr, pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    Query(iid) {
        if (INodeProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperty)
    }
}
