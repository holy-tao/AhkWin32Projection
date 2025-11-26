#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines methods for performing application-specific restore tasks.
 * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nn-wsbapp-iwsbapplicationrestoresupport
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class IWsbApplicationRestoreSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWsbApplicationRestoreSupport
     * @type {Guid}
     */
    static IID => Guid("{8d3bdb38-4ee8-4718-85f9-c7dbc4ab77aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreRestore", "PostRestore", "OrderComponents", "IsRollForwardSupported"]

    /**
     * Performs application-specific PreRestore operations.
     * @param {PWSTR} wszWriterMetadata A string that contains the VSS writer's metadata.
     * @param {PWSTR} wszComponentName The name of the component or component set. This should match the name in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {PWSTR} wszComponentLogicalPath The <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">logical path</a> of the component or component set. This should match the logical path in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {BOOLEAN} bNoRollForward Set to <b>TRUE</b> if a previous point-in-time recovery operation is in progress and no application rollforward should be performed. The previous logs for the application will be deleted before the application restore operation is performed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-prerestore
     */
    PreRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(3, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "HRESULT")
        return result
    }

    /**
     * Performs application-specific PostRestore operations.
     * @param {PWSTR} wszWriterMetadata A string that contains the VSS writer's metadata.
     * @param {PWSTR} wszComponentName The name of the component or component set. This should match the name in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {PWSTR} wszComponentLogicalPath The <a href="https://docs.microsoft.com/windows/desktop/VSS/logical-pathing-of-components">logical path</a> of the component or component set. This should match the logical path in the metadata that the <i>wszWriterMetadata</i> parameter points to.
     * @param {BOOLEAN} bNoRollForward Set to <b>TRUE</b> if a previous point-in-time recovery operation is in progress and no application rollforward should be performed. The previous logs for the application will be deleted before the application restore operation is performed.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-postrestore
     */
    PostRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(4, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "HRESULT")
        return result
    }

    /**
     * Specifies the order in which application components are to be restored.
     * @param {Integer} cComponents The number of components to be restored. The value of this parameter can range from 0 to MAX_COMPONENTS.
     * @param {Pointer<PWSTR>} rgComponentName An array of <i>cComponents</i> names of components to be restored.
     * @param {Pointer<PWSTR>} rgComponentLogicalPaths An array of <i>cComponents</i> logical paths of components to be restored.
     * @param {Pointer<Pointer<PWSTR>>} prgComponentName An array of <i>cComponents</i> names of components to be restored,  in the order in which they are to be restored. This parameter receives <b>NULL</b> if no specific restore order is required.
     * @param {Pointer<Pointer<PWSTR>>} prgComponentLogicalPath An array of <i>cComponents</i> logical paths of components to be restored, in the order in which they are to be restored. This parameter receives <b>NULL</b> if no specific restore order is required.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise. Possible return values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-ordercomponents
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
     * @returns {Integer} Receives <b>TRUE</b> if roll-forward restore is supported, or 
     *       <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-isrollforwardsupported
     */
    IsRollForwardSupported() {
        result := ComCall(6, this, "char*", &pbRollForwardSupported := 0, "HRESULT")
        return pbRollForwardSupported
    }
}
