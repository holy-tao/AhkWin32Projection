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
     * 
     * @param {PWSTR} wszWriterMetadata 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszComponentLogicalPath 
     * @param {BOOLEAN} bNoRollForward 
     * @returns {HRESULT} 
     */
    PreRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(3, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszWriterMetadata 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszComponentLogicalPath 
     * @param {BOOLEAN} bNoRollForward 
     * @returns {HRESULT} 
     */
    PostRestore(wszWriterMetadata, wszComponentName, wszComponentLogicalPath, bNoRollForward) {
        wszWriterMetadata := wszWriterMetadata is String ? StrPtr(wszWriterMetadata) : wszWriterMetadata
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszComponentLogicalPath := wszComponentLogicalPath is String ? StrPtr(wszComponentLogicalPath) : wszComponentLogicalPath

        result := ComCall(4, this, "ptr", wszWriterMetadata, "ptr", wszComponentName, "ptr", wszComponentLogicalPath, "char", bNoRollForward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cComponents 
     * @param {Pointer<PWSTR>} rgComponentName 
     * @param {Pointer<PWSTR>} rgComponentLogicalPaths 
     * @param {Pointer<PWSTR>} prgComponentName 
     * @param {Pointer<PWSTR>} prgComponentLogicalPath 
     * @returns {HRESULT} 
     */
    OrderComponents(cComponents, rgComponentName, rgComponentLogicalPaths, prgComponentName, prgComponentLogicalPath) {
        result := ComCall(5, this, "uint", cComponents, "ptr", rgComponentName, "ptr", rgComponentLogicalPaths, "ptr", prgComponentName, "ptr", prgComponentLogicalPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbRollForwardSupported 
     * @returns {HRESULT} 
     */
    IsRollForwardSupported(pbRollForwardSupported) {
        result := ComCall(6, this, "char*", pbRollForwardSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
