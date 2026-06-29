#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Supplies methods that provide information about the handler to methods of the IHandlerActivationHost interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihandlerinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IHandlerInfo extends IUnknown {
    /**
     * The interface identifier for IHandlerInfo
     * @type {Guid}
     */
    static IID := Guid("{997706ef-f880-453b-8118-39e1a2d2655a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHandlerInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetApplicationDisplayName   : IntPtr
        GetApplicationPublisher     : IntPtr
        GetApplicationIconReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHandlerInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the display name of the application that implemented the handler.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that, when this method returns successfully, receives the display name. If no display name could be found, the name of the application's .exe file is used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationdisplayname
     */
    GetApplicationDisplayName() {
        result := ComCall(3, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the name of the publisher of the application that implemented the handler.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that, when this method returns successfully, receives the publisher's name.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationpublisher
     */
    GetApplicationPublisher() {
        result := ComCall(4, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the icon of the application that implemented the handler.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a string that, when this method returns successfully, receives the path of the icon.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ihandlerinfo-getapplicationiconreference
     */
    GetApplicationIconReference() {
        result := ComCall(5, this, PWSTR.Ptr, &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IHandlerInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetApplicationDisplayName := CallbackCreate(GetMethod(implObj, "GetApplicationDisplayName"), flags, 2)
        this.vtbl.GetApplicationPublisher := CallbackCreate(GetMethod(implObj, "GetApplicationPublisher"), flags, 2)
        this.vtbl.GetApplicationIconReference := CallbackCreate(GetMethod(implObj, "GetApplicationIconReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetApplicationDisplayName)
        CallbackFree(this.vtbl.GetApplicationPublisher)
        CallbackFree(this.vtbl.GetApplicationIconReference)
    }
}
