#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssCreateExpressWriterMetadata interface is a COM interface containing methods to construct the Writer Metadata Document for an express writer.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscreateexpresswritermetadata
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssCreateExpressWriterMetadata extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssCreateExpressWriterMetadata
     * @type {Guid}
     */
    static IID => Guid("{9c772e77-b26e-427f-92dd-c996f41ea5e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddExcludeFiles", "AddComponent", "AddFilesToFileGroup", "SetRestoreMethod", "AddComponentDependency", "SetBackupSchema", "SaveAsXML"]

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {Integer} bRecursive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addexcludefiles
     */
    AddExcludeFiles(wszPath, wszFilespec, bRecursive) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(3, this, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {PWSTR} wszLogicalPath 
     * @param {PWSTR} wszComponentName 
     * @param {PWSTR} wszCaption 
     * @param {Pointer<Integer>} pbIcon 
     * @param {Integer} cbIcon 
     * @param {Integer} bRestoreMetadata 
     * @param {Integer} bNotifyOnBackupComplete 
     * @param {Integer} bSelectable 
     * @param {Integer} bSelectableForRestore 
     * @param {Integer} dwComponentFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addcomponent
     */
    AddComponent(ct, wszLogicalPath, wszComponentName, wszCaption, pbIcon, cbIcon, bRestoreMetadata, bNotifyOnBackupComplete, bSelectable, bSelectableForRestore, dwComponentFlags) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszComponentName := wszComponentName is String ? StrPtr(wszComponentName) : wszComponentName
        wszCaption := wszCaption is String ? StrPtr(wszCaption) : wszCaption

        pbIconMarshal := pbIcon is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "int", ct, "ptr", wszLogicalPath, "ptr", wszComponentName, "ptr", wszCaption, pbIconMarshal, pbIcon, "uint", cbIcon, "char", bRestoreMetadata, "char", bNotifyOnBackupComplete, "char", bSelectable, "char", bSelectableForRestore, "uint", dwComponentFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszLogicalPath 
     * @param {PWSTR} wszGroupName 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {Integer} bRecursive 
     * @param {PWSTR} wszAlternateLocation 
     * @param {Integer} dwBackupTypeMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addfilestofilegroup
     */
    AddFilesToFileGroup(wszLogicalPath, wszGroupName, wszPath, wszFilespec, bRecursive, wszAlternateLocation, dwBackupTypeMask) {
        wszLogicalPath := wszLogicalPath is String ? StrPtr(wszLogicalPath) : wszLogicalPath
        wszGroupName := wszGroupName is String ? StrPtr(wszGroupName) : wszGroupName
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        wszAlternateLocation := wszAlternateLocation is String ? StrPtr(wszAlternateLocation) : wszAlternateLocation

        result := ComCall(5, this, "ptr", wszLogicalPath, "ptr", wszGroupName, "ptr", wszPath, "ptr", wszFilespec, "char", bRecursive, "ptr", wszAlternateLocation, "uint", dwBackupTypeMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} method 
     * @param {PWSTR} wszService 
     * @param {PWSTR} wszUserProcedure 
     * @param {Integer} writerRestore 
     * @param {Integer} bRebootRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-setrestoremethod
     */
    SetRestoreMethod(method, wszService, wszUserProcedure, writerRestore, bRebootRequired) {
        wszService := wszService is String ? StrPtr(wszService) : wszService
        wszUserProcedure := wszUserProcedure is String ? StrPtr(wszUserProcedure) : wszUserProcedure

        result := ComCall(6, this, "int", method, "ptr", wszService, "ptr", wszUserProcedure, "int", writerRestore, "char", bRebootRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszForLogicalPath 
     * @param {PWSTR} wszForComponentName 
     * @param {Guid} onWriterId 
     * @param {PWSTR} wszOnLogicalPath 
     * @param {PWSTR} wszOnComponentName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-addcomponentdependency
     */
    AddComponentDependency(wszForLogicalPath, wszForComponentName, onWriterId, wszOnLogicalPath, wszOnComponentName) {
        wszForLogicalPath := wszForLogicalPath is String ? StrPtr(wszForLogicalPath) : wszForLogicalPath
        wszForComponentName := wszForComponentName is String ? StrPtr(wszForComponentName) : wszForComponentName
        wszOnLogicalPath := wszOnLogicalPath is String ? StrPtr(wszOnLogicalPath) : wszOnLogicalPath
        wszOnComponentName := wszOnComponentName is String ? StrPtr(wszOnComponentName) : wszOnComponentName

        result := ComCall(7, this, "ptr", wszForLogicalPath, "ptr", wszForComponentName, "ptr", onWriterId, "ptr", wszOnLogicalPath, "ptr", wszOnComponentName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSchemaMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-setbackupschema
     */
    SetBackupSchema(dwSchemaMask) {
        result := ComCall(8, this, "uint", dwSchemaMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrXML 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscreateexpresswritermetadata-saveasxml
     */
    SaveAsXML(pbstrXML) {
        result := ComCall(9, this, "ptr", pbstrXML, "HRESULT")
        return result
    }
}
