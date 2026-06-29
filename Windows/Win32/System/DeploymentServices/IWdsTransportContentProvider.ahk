#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Used to describe a content provider.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportcontentprovider
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportContentProvider extends IDispatch {
    /**
     * The interface identifier for IWdsTransportContentProvider
     * @type {Guid}
     */
    static IID := Guid("{b9489f24-f219-4acf-aad7-265c7c08a6ae}")

    /**
     * The class identifier for WdsTransportContentProvider
     * @type {Guid}
     */
    static CLSID := Guid("{e0be741f-5a75-4eb9-8a2d-5e189b45f327}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportContentProvider interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                  : IntPtr
        get_Description           : IntPtr
        get_FilePath              : IntPtr
        get_InitializationRoutine : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportContentProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {BSTR} 
     */
    FilePath {
        get => this.get_FilePath()
    }

    /**
     * @type {BSTR} 
     */
    InitializationRoutine {
        get => this.get_InitializationRoutine()
    }

    /**
     * Retrieves the name of the content provider.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_name
     */
    get_Name() {
        pbszName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbszName, "HRESULT")
        return pbszName
    }

    /**
     * Retrieves the description of the content provider.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_description
     */
    get_Description() {
        pbszDescription := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbszDescription, "HRESULT")
        return pbszDescription
    }

    /**
     * Retrieves the path to the content provider’s DLL.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_filepath
     */
    get_FilePath() {
        pbszFilePath := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbszFilePath, "HRESULT")
        return pbszFilePath
    }

    /**
     * Retrieves the name of the method called to initialize the content provider.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportcontentprovider-get_initializationroutine
     */
    get_InitializationRoutine() {
        pbszInitializationRoutine := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbszInitializationRoutine, "HRESULT")
        return pbszInitializationRoutine
    }

    Query(iid) {
        if (IWdsTransportContentProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_FilePath := CallbackCreate(GetMethod(implObj, "get_FilePath"), flags, 2)
        this.vtbl.get_InitializationRoutine := CallbackCreate(GetMethod(implObj, "get_InitializationRoutine"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_FilePath)
        CallbackFree(this.vtbl.get_InitializationRoutine)
    }
}
