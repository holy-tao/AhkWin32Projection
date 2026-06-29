#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines methods for performing application-specific restore tasks.
 * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nn-wsbapp-iwsbapplicationrestoresupport
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct IWsbApplicationRestoreSupport extends IUnknown {
    /**
     * The interface identifier for IWsbApplicationRestoreSupport
     * @type {Guid}
     */
    static IID := Guid("{8d3bdb38-4ee8-4718-85f9-c7dbc4ab77aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWsbApplicationRestoreSupport interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PreRestore             : IntPtr
        PostRestore            : IntPtr
        OrderComponents        : IntPtr
        IsRollForwardSupported : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWsbApplicationRestoreSupport.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Performs application-specific PreRestore operations.
     * @remarks
     * During application restore, Windows Server Backup calls this method before restoring the files for each application component.
     * @param {PWSTR} wszWriterMetadata A string that contains the VSS writer's metadata.
     * @param {PWSTR} wszComponentName The name of the component or component set. This should match the name in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {PWSTR} wszComponentLogicalPath The <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">logical path</a> of the component or component set. This should match the logical path in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {BOOLEAN} bNoRollForward Set to <b>TRUE</b> if a previous point-in-time recovery operation is in progress and no application rollforward should be performed. The previous logs for the application will be deleted before the application restore operation is performed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-prerestore
     */
    PreRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(3, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, BOOLEAN, bNoRollForward, "HRESULT")
        return result
    }

    /**
     * Performs application-specific PostRestore operations.
     * @remarks
     * During application restore, Windows Server Backup calls this method after restoring the files for each application component.
     * @param {PWSTR} wszWriterMetadata A string that contains the VSS writer's metadata.
     * @param {PWSTR} wszComponentName The name of the component or component set. This should match the name in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {PWSTR} wszComponentLogicalPath The <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">logical path</a> of the component or component set. This should match the logical path in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {BOOLEAN} bNoRollForward Set to <b>TRUE</b> if a previous point-in-time recovery operation is in progress and no application rollforward should be performed. The previous logs for the application will be deleted before the application restore operation is performed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-postrestore
     */
    PostRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(4, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, BOOLEAN, bNoRollForward, "HRESULT")
        return result
    }

    /**
     * Specifies the order in which application components are to be restored.
     * @remarks
     * Windows Server Backup calls this  method before restoring components for an application.
     * @param {Integer} cComponents The number of components to be restored. The value of this parameter can range from 0 to MAX_COMPONENTS.
     * @param {Pointer<PWSTR>} rgComponentName An array of <i>cComponents</i> names of components to be restored.
     * @param {Pointer<PWSTR>} rgComponentLogicalPaths An array of <i>cComponents</i> logical paths of components to be restored.
     * @param {Pointer<Pointer<PWSTR>>} prgComponentName An array of <i>cComponents</i> names of components to be restored,  in the order in which they are to be restored. This parameter receives <b>NULL</b> if no specific restore order is required.
     * @param {Pointer<Pointer<PWSTR>>} prgComponentLogicalPath An array of <i>cComponents</i> logical paths of components to be restored, in the order in which they are to be restored. This parameter receives <b>NULL</b> if no specific restore order is required.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-ordercomponents
     */
    OrderComponents(cComponents, rgComponentName, rgComponentLogicalPaths, prgComponentName, prgComponentLogicalPath) {
        rgComponentNameMarshal := rgComponentName is VarRef ? "ptr*" : "ptr"
        rgComponentLogicalPathsMarshal := rgComponentLogicalPaths is VarRef ? "ptr*" : "ptr"
        prgComponentNameMarshal := prgComponentName is VarRef ? "ptr*" : "ptr"
        prgComponentLogicalPathMarshal := prgComponentLogicalPath is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", cComponents, rgComponentNameMarshal, rgComponentName, rgComponentLogicalPathsMarshal, rgComponentLogicalPaths, prgComponentNameMarshal, prgComponentName, prgComponentLogicalPathMarshal, prgComponentLogicalPath, "HRESULT")
        return result
    }

    /**
     * Reports whether the application supports roll-forward restore.
     * @remarks
     * Applications that support roll-forward restore should set the value of the 
     *     <i>pbRollForwardSupported</i> parameter to <b>TRUE</b>.
     * @returns {Integer} Receives <b>TRUE</b> if roll-forward restore is supported, or 
     *       <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-isrollforwardsupported
     */
    IsRollForwardSupported() {
        result := ComCall(6, this, "char*", &pbRollForwardSupported := 0, "HRESULT")
        return pbRollForwardSupported
    }

    Query(iid) {
        if (IWsbApplicationRestoreSupport.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PreRestore := CallbackCreate(GetMethod(implObj, "PreRestore"), flags, 5)
        this.vtbl.PostRestore := CallbackCreate(GetMethod(implObj, "PostRestore"), flags, 5)
        this.vtbl.OrderComponents := CallbackCreate(GetMethod(implObj, "OrderComponents"), flags, 6)
        this.vtbl.IsRollForwardSupported := CallbackCreate(GetMethod(implObj, "IsRollForwardSupported"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PreRestore)
        CallbackFree(this.vtbl.PostRestore)
        CallbackFree(this.vtbl.OrderComponents)
        CallbackFree(this.vtbl.IsRollForwardSupported)
    }
}
