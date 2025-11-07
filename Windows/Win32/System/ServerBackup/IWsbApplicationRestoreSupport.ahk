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
     * 
     * @param {PWSTR} wszWriterMetadata 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszComponentLogicalPath 
     * @param {BOOLEAN} bNoRollForward 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-prerestore
     */
    PreRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(3, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszWriterMetadata 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszComponentLogicalPath 
     * @param {BOOLEAN} bNoRollForward 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-postrestore
     */
    PostRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(4, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cComponents 
     * @param {Pointer<PWSTR>} rgComponentName 
     * @param {Pointer<PWSTR>} rgComponentLogicalPaths 
     * @param {Pointer<Pointer<PWSTR>>} prgComponentName 
     * @param {Pointer<Pointer<PWSTR>>} prgComponentLogicalPath 
     * @returns {HRESULT} 
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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wsbapp/nf-wsbapp-iwsbapplicationrestoresupport-isrollforwardsupported
     */
    IsRollForwardSupported() {
        result := ComCall(6, this, "char*", &pbRollForwardSupported := 0, "HRESULT")
        return pbRollForwardSupported
    }
}
