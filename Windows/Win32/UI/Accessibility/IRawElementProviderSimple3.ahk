#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UIA_METADATA_ID.ahk" { UIA_METADATA_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRawElementProviderSimple2.ahk" { IRawElementProviderSimple2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Extends the IRawElementProviderSimple2 interface to enable retrieving metadata about how accessible technology should say the preferred content type.
 * @remarks
 * Screen reading accessibility tools like Narrator use a speech synthesizer to read what an app is showing.  Speech synthesizers usually read the provided content well based on the content description.
 * 
 * However, the speech synthesizer could use some help describing the preferred content type. The SayAs command provides accurate content reading from a Microsoft UI Automation provider to a UI Automation client (such as a screen reader) through UI Automation core APIs.
 * 
 * Examples:
 * 
 * <ul>
 * <li>Given the date 10/4, is the format Month/Day or Day/Month?
 * If a screen reader does not know, you could hear October 4th or 10th April. 
 * </li>
 * <li>
 * Given the string "10-100", is this
 * "Ten to one hundred" or
 * "Ten minus 100"?
 * 
 * The ability to mark the "10" as a number and the "-100" as a number helps active technology (AT) read it better.
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple3
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IRawElementProviderSimple3 extends IRawElementProviderSimple2 {
    /**
     * The interface identifier for IRawElementProviderSimple3
     * @type {Guid}
     */
    static IID := Guid("{fcf5d820-d7ec-4613-bdf6-42a84ce7daaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRawElementProviderSimple3 interfaces
    */
    struct Vtbl extends IRawElementProviderSimple2.Vtbl {
        GetMetadataValue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRawElementProviderSimple3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets metadata from the UI Automation element that indicates how the information should be interpreted. (IRawElementProviderSimple3.GetMetadataValue)
     * @param {Integer} targetId The ID of the property to retrieve.
     * @param {UIA_METADATA_ID} metadataId Specifies the type of metadata to retrieve.
     * @returns {VARIANT} The metadata.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-irawelementprovidersimple3-getmetadatavalue
     */
    GetMetadataValue(targetId, metadataId) {
        returnVal := VARIANT()
        result := ComCall(8, this, "int", targetId, UIA_METADATA_ID, metadataId, VARIANT.Ptr, returnVal, "HRESULT")
        return returnVal
    }

    Query(iid) {
        if (IRawElementProviderSimple3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMetadataValue := CallbackCreate(GetMethod(implObj, "GetMetadataValue"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMetadataValue)
    }
}
