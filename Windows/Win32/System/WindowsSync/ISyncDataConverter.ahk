#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumSyncChanges.ahk" { IEnumSyncChanges }
#Import ".\ILoadChangeContext.ahk" { ILoadChangeContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncDataConverter extends IUnknown {
    /**
     * The interface identifier for ISyncDataConverter
     * @type {Guid}
     */
    static IID := Guid("{435d4861-68d5-44aa-a0f9-72a0b00ef9cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncDataConverter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConvertDataRetrieverFromProviderFormat : IntPtr
        ConvertDataRetrieverToProviderFormat   : IntPtr
        ConvertDataFromProviderFormat          : IntPtr
        ConvertDataToProviderFormat            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncDataConverter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnkDataRetrieverIn 
     * @param {IEnumSyncChanges} pEnumSyncChanges 
     * @returns {IUnknown} 
     */
    ConvertDataRetrieverFromProviderFormat(pUnkDataRetrieverIn, pEnumSyncChanges) {
        result := ComCall(3, this, "ptr", pUnkDataRetrieverIn, "ptr", pEnumSyncChanges, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {IUnknown} pUnkDataRetrieverIn 
     * @param {IEnumSyncChanges} pEnumSyncChanges 
     * @returns {IUnknown} 
     */
    ConvertDataRetrieverToProviderFormat(pUnkDataRetrieverIn, pEnumSyncChanges) {
        result := ComCall(4, this, "ptr", pUnkDataRetrieverIn, "ptr", pEnumSyncChanges, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {ILoadChangeContext} pDataContext 
     * @param {IUnknown} pUnkDataIn 
     * @returns {IUnknown} 
     */
    ConvertDataFromProviderFormat(pDataContext, pUnkDataIn) {
        result := ComCall(5, this, "ptr", pDataContext, "ptr", pUnkDataIn, "ptr*", &ppUnkDataOut := 0, "HRESULT")
        return IUnknown(ppUnkDataOut)
    }

    /**
     * 
     * @param {ILoadChangeContext} pDataContext 
     * @param {IUnknown} pUnkDataOut 
     * @returns {IUnknown} 
     */
    ConvertDataToProviderFormat(pDataContext, pUnkDataOut) {
        result := ComCall(6, this, "ptr", pDataContext, "ptr", pUnkDataOut, "ptr*", &ppUnkDataout := 0, "HRESULT")
        return IUnknown(ppUnkDataout)
    }

    Query(iid) {
        if (ISyncDataConverter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConvertDataRetrieverFromProviderFormat := CallbackCreate(GetMethod(implObj, "ConvertDataRetrieverFromProviderFormat"), flags, 4)
        this.vtbl.ConvertDataRetrieverToProviderFormat := CallbackCreate(GetMethod(implObj, "ConvertDataRetrieverToProviderFormat"), flags, 4)
        this.vtbl.ConvertDataFromProviderFormat := CallbackCreate(GetMethod(implObj, "ConvertDataFromProviderFormat"), flags, 4)
        this.vtbl.ConvertDataToProviderFormat := CallbackCreate(GetMethod(implObj, "ConvertDataToProviderFormat"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConvertDataRetrieverFromProviderFormat)
        CallbackFree(this.vtbl.ConvertDataRetrieverToProviderFormat)
        CallbackFree(this.vtbl.ConvertDataFromProviderFormat)
        CallbackFree(this.vtbl.ConvertDataToProviderFormat)
    }
}
