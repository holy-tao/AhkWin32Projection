#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAzAuthorizationStore.ahk" { IAzAuthorizationStore }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IAzApplication2.ahk" { IAzApplication2 }

/**
 * Inherits from the AzAuthorizationStore object and implements methods to create and open IAzApplication2 objects.
 * @see https://learn.microsoft.com/windows/win32/api/azroles/nn-azroles-iazauthorizationstore2
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct IAzAuthorizationStore2 extends IAzAuthorizationStore {
    /**
     * The interface identifier for IAzAuthorizationStore2
     * @type {Guid}
     */
    static IID := Guid("{b11e5584-d577-4273-b6c5-0973e0f8e80d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAzAuthorizationStore2 interfaces
    */
    struct Vtbl extends IAzAuthorizationStore.Vtbl {
        OpenApplication2   : IntPtr
        CreateApplication2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAzAuthorizationStore2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens the IAzApplication2 object with the specified name.
     * @param {BSTR} bstrApplicationName The name of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object to open.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication2} A pointer to a pointer to the opened <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore2-openapplication2
     */
    OpenApplication2(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(58, this, BSTR, bstrApplicationName, VARIANT, varReserved, "ptr*", &ppApplication := 0, "HRESULT")
        return IAzApplication2(ppApplication)
    }

    /**
     * Creates an IAzApplication2 object by using the specified name.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nf-azroles-iazapplication-submit">IAzApplication::Submit</a> method to persist any changes made by the returned object.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object is an immediate child object of the <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazauthorizationstore2">IAzAuthorizationStore2</a> object.
     * @param {BSTR} bstrApplicationName The name for the new <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @param {VARIANT} varReserved Reserved for future use.
     * @returns {IAzApplication2} A pointer to a pointer to the created <a href="https://docs.microsoft.com/windows/desktop/api/azroles/nn-azroles-iazapplication2">IAzApplication2</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/azroles/nf-azroles-iazauthorizationstore2-createapplication2
     */
    CreateApplication2(bstrApplicationName, varReserved) {
        bstrApplicationName := bstrApplicationName is String ? BSTR.Alloc(bstrApplicationName).Value : bstrApplicationName

        result := ComCall(59, this, BSTR, bstrApplicationName, VARIANT, varReserved, "ptr*", &ppApplication := 0, "HRESULT")
        return IAzApplication2(ppApplication)
    }

    Query(iid) {
        if (IAzAuthorizationStore2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenApplication2 := CallbackCreate(GetMethod(implObj, "OpenApplication2"), flags, 4)
        this.vtbl.CreateApplication2 := CallbackCreate(GetMethod(implObj, "CreateApplication2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenApplication2)
        CallbackFree(this.vtbl.CreateApplication2)
    }
}
