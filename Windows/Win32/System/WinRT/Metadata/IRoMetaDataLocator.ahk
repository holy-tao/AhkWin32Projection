#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRoSimpleMetaDataBuilder.ahk" { IRoSimpleMetaDataBuilder }

/**
 * Enables the RoGetParameterizedTypeInstanceIID function to access run-time metadata.
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/ns-roparameterizediid-irometadatalocator
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IRoMetaDataLocator extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRoMetaDataLocator interfaces
    */
    struct Vtbl {
        Locate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRoMetaDataLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} nameElement 
     * @param {IRoSimpleMetaDataBuilder} metaDataDestination 
     * @returns {HRESULT} 
     */
    Locate(nameElement, metaDataDestination) {
        nameElement := nameElement is String ? StrPtr(nameElement) : nameElement

        result := ComCall(0, this, "ptr", nameElement, "ptr", metaDataDestination, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRoMetaDataLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
