#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssComponent interface is a C++ (not COM) interface containing methods for examining and modifying information about components contained in a requester's Backup Components Document.
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/nl-vswriter-ivsscomponent
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssComponent extends IUnknown{
    /**
     * The interface identifier for IVssComponent
     * @type {Guid}
     */
    static IID => Guid("{d2c72c96-c121-4518-b627-e5a93d010ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} 
     */
    GetLogicalPath(pbstrPath) {
        result := ComCall(3, this, "ptr", pbstrPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pct 
     * @returns {HRESULT} 
     */
    GetComponentType(pct) {
        result := ComCall(4, this, "int*", pct, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetComponentName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbSucceeded 
     * @returns {HRESULT} 
     */
    GetBackupSucceeded(pbSucceeded) {
        result := ComCall(6, this, "int*", pbSucceeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcMappings 
     * @returns {HRESULT} 
     */
    GetAlternateLocationMappingCount(pcMappings) {
        result := ComCall(7, this, "uint*", pcMappings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iMapping 
     * @param {Pointer<IVssWMFiledesc>} ppFiledesc 
     * @returns {HRESULT} 
     */
    GetAlternateLocationMapping(iMapping, ppFiledesc) {
        result := ComCall(8, this, "uint", iMapping, "ptr", ppFiledesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszData 
     * @returns {HRESULT} 
     */
    SetBackupMetadata(wszData) {
        wszData := wszData is String ? StrPtr(wszData) : wszData

        result := ComCall(9, this, "ptr", wszData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetBackupMetadata(pbstrData) {
        result := ComCall(10, this, "ptr", pbstrData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilename 
     * @param {PWSTR} wszRanges 
     * @param {PWSTR} wszMetadata 
     * @returns {HRESULT} 
     */
    AddPartialFile(wszPath, wszFilename, wszRanges, wszMetadata) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilename := wszFilename is String ? StrPtr(wszFilename) : wszFilename
        wszRanges := wszRanges is String ? StrPtr(wszRanges) : wszRanges
        wszMetadata := wszMetadata is String ? StrPtr(wszMetadata) : wszMetadata

        result := ComCall(11, this, "ptr", wszPath, "ptr", wszFilename, "ptr", wszRanges, "ptr", wszMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcPartialFiles 
     * @returns {HRESULT} 
     */
    GetPartialFileCount(pcPartialFiles) {
        result := ComCall(12, this, "uint*", pcPartialFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iPartialFile 
     * @param {Pointer<BSTR>} pbstrPath 
     * @param {Pointer<BSTR>} pbstrFilename 
     * @param {Pointer<BSTR>} pbstrRange 
     * @param {Pointer<BSTR>} pbstrMetadata 
     * @returns {HRESULT} 
     */
    GetPartialFile(iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata) {
        result := ComCall(13, this, "uint", iPartialFile, "ptr", pbstrPath, "ptr", pbstrFilename, "ptr", pbstrRange, "ptr", pbstrMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbSelectedForRestore 
     * @returns {HRESULT} 
     */
    IsSelectedForRestore(pbSelectedForRestore) {
        result := ComCall(14, this, "int*", pbSelectedForRestore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbAdditionalRestores 
     * @returns {HRESULT} 
     */
    GetAdditionalRestores(pbAdditionalRestores) {
        result := ComCall(15, this, "int*", pbAdditionalRestores, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcNewTarget 
     * @returns {HRESULT} 
     */
    GetNewTargetCount(pcNewTarget) {
        result := ComCall(16, this, "uint*", pcNewTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iNewTarget 
     * @param {Pointer<IVssWMFiledesc>} ppFiledesc 
     * @returns {HRESULT} 
     */
    GetNewTarget(iNewTarget, ppFiledesc) {
        result := ComCall(17, this, "uint", iNewTarget, "ptr", ppFiledesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszSourcePath 
     * @param {PWSTR} wszSourceFilename 
     * @param {PWSTR} wszSourceRangeList 
     * @param {PWSTR} wszDestinationPath 
     * @param {PWSTR} wszDestinationFilename 
     * @param {PWSTR} wszDestinationRangeList 
     * @returns {HRESULT} 
     */
    AddDirectedTarget(wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList) {
        wszSourcePath := wszSourcePath is String ? StrPtr(wszSourcePath) : wszSourcePath
        wszSourceFilename := wszSourceFilename is String ? StrPtr(wszSourceFilename) : wszSourceFilename
        wszSourceRangeList := wszSourceRangeList is String ? StrPtr(wszSourceRangeList) : wszSourceRangeList
        wszDestinationPath := wszDestinationPath is String ? StrPtr(wszDestinationPath) : wszDestinationPath
        wszDestinationFilename := wszDestinationFilename is String ? StrPtr(wszDestinationFilename) : wszDestinationFilename
        wszDestinationRangeList := wszDestinationRangeList is String ? StrPtr(wszDestinationRangeList) : wszDestinationRangeList

        result := ComCall(18, this, "ptr", wszSourcePath, "ptr", wszSourceFilename, "ptr", wszSourceRangeList, "ptr", wszDestinationPath, "ptr", wszDestinationFilename, "ptr", wszDestinationRangeList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcDirectedTarget 
     * @returns {HRESULT} 
     */
    GetDirectedTargetCount(pcDirectedTarget) {
        result := ComCall(19, this, "uint*", pcDirectedTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iDirectedTarget 
     * @param {Pointer<BSTR>} pbstrSourcePath 
     * @param {Pointer<BSTR>} pbstrSourceFileName 
     * @param {Pointer<BSTR>} pbstrSourceRangeList 
     * @param {Pointer<BSTR>} pbstrDestinationPath 
     * @param {Pointer<BSTR>} pbstrDestinationFilename 
     * @param {Pointer<BSTR>} pbstrDestinationRangeList 
     * @returns {HRESULT} 
     */
    GetDirectedTarget(iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList) {
        result := ComCall(20, this, "uint", iDirectedTarget, "ptr", pbstrSourcePath, "ptr", pbstrSourceFileName, "ptr", pbstrSourceRangeList, "ptr", pbstrDestinationPath, "ptr", pbstrDestinationFilename, "ptr", pbstrDestinationRangeList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszRestoreMetadata 
     * @returns {HRESULT} 
     */
    SetRestoreMetadata(wszRestoreMetadata) {
        wszRestoreMetadata := wszRestoreMetadata is String ? StrPtr(wszRestoreMetadata) : wszRestoreMetadata

        result := ComCall(21, this, "ptr", wszRestoreMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRestoreMetadata 
     * @returns {HRESULT} 
     */
    GetRestoreMetadata(pbstrRestoreMetadata) {
        result := ComCall(22, this, "ptr", pbstrRestoreMetadata, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} target 
     * @returns {HRESULT} 
     */
    SetRestoreTarget(target) {
        result := ComCall(23, this, "int", target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTarget 
     * @returns {HRESULT} 
     */
    GetRestoreTarget(pTarget) {
        result := ComCall(24, this, "int*", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPreRestoreFailureMsg 
     * @returns {HRESULT} 
     */
    SetPreRestoreFailureMsg(wszPreRestoreFailureMsg) {
        wszPreRestoreFailureMsg := wszPreRestoreFailureMsg is String ? StrPtr(wszPreRestoreFailureMsg) : wszPreRestoreFailureMsg

        result := ComCall(25, this, "ptr", wszPreRestoreFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPreRestoreFailureMsg 
     * @returns {HRESULT} 
     */
    GetPreRestoreFailureMsg(pbstrPreRestoreFailureMsg) {
        result := ComCall(26, this, "ptr", pbstrPreRestoreFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPostRestoreFailureMsg 
     * @returns {HRESULT} 
     */
    SetPostRestoreFailureMsg(wszPostRestoreFailureMsg) {
        wszPostRestoreFailureMsg := wszPostRestoreFailureMsg is String ? StrPtr(wszPostRestoreFailureMsg) : wszPostRestoreFailureMsg

        result := ComCall(27, this, "ptr", wszPostRestoreFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPostRestoreFailureMsg 
     * @returns {HRESULT} 
     */
    GetPostRestoreFailureMsg(pbstrPostRestoreFailureMsg) {
        result := ComCall(28, this, "ptr", pbstrPostRestoreFailureMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszBackupStamp 
     * @returns {HRESULT} 
     */
    SetBackupStamp(wszBackupStamp) {
        wszBackupStamp := wszBackupStamp is String ? StrPtr(wszBackupStamp) : wszBackupStamp

        result := ComCall(29, this, "ptr", wszBackupStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupStamp 
     * @returns {HRESULT} 
     */
    GetBackupStamp(pbstrBackupStamp) {
        result := ComCall(30, this, "ptr", pbstrBackupStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupStamp 
     * @returns {HRESULT} 
     */
    GetPreviousBackupStamp(pbstrBackupStamp) {
        result := ComCall(31, this, "ptr", pbstrBackupStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupOptions 
     * @returns {HRESULT} 
     */
    GetBackupOptions(pbstrBackupOptions) {
        result := ComCall(32, this, "ptr", pbstrBackupOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRestoreOptions 
     * @returns {HRESULT} 
     */
    GetRestoreOptions(pbstrRestoreOptions) {
        result := ComCall(33, this, "ptr", pbstrRestoreOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcRestoreSubcomponent 
     * @returns {HRESULT} 
     */
    GetRestoreSubcomponentCount(pcRestoreSubcomponent) {
        result := ComCall(34, this, "uint*", pcRestoreSubcomponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iComponent 
     * @param {Pointer<BSTR>} pbstrLogicalPath 
     * @param {Pointer<BSTR>} pbstrComponentName 
     * @param {Pointer<Boolean>} pbRepair 
     * @returns {HRESULT} 
     */
    GetRestoreSubcomponent(iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair) {
        result := ComCall(35, this, "uint", iComponent, "ptr", pbstrLogicalPath, "ptr", pbstrComponentName, "int*", pbRepair, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    GetFileRestoreStatus(pStatus) {
        result := ComCall(36, this, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {BOOL} bRecursive 
     * @param {FILETIME} ftLastModifyTime 
     * @returns {HRESULT} 
     */
    AddDifferencedFilesByLastModifyTime(wszPath, wszFilespec, bRecursive, ftLastModifyTime) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(37, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", ftLastModifyTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {BOOL} bRecursive 
     * @param {BSTR} bstrLsnString 
     * @returns {HRESULT} 
     */
    AddDifferencedFilesByLastModifyLSN(wszPath, wszFilespec, bRecursive, bstrLsnString) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        bstrLsnString := bstrLsnString is String ? BSTR.Alloc(bstrLsnString).Value : bstrLsnString

        result := ComCall(38, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", bstrLsnString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcDifferencedFiles 
     * @returns {HRESULT} 
     */
    GetDifferencedFilesCount(pcDifferencedFiles) {
        result := ComCall(39, this, "uint*", pcDifferencedFiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iDifferencedFile 
     * @param {Pointer<BSTR>} pbstrPath 
     * @param {Pointer<BSTR>} pbstrFilespec 
     * @param {Pointer<BOOL>} pbRecursive 
     * @param {Pointer<BSTR>} pbstrLsnString 
     * @param {Pointer<FILETIME>} pftLastModifyTime 
     * @returns {HRESULT} 
     */
    GetDifferencedFile(iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime) {
        result := ComCall(40, this, "uint", iDifferencedFile, "ptr", pbstrPath, "ptr", pbstrFilespec, "ptr", pbRecursive, "ptr", pbstrLsnString, "ptr", pftLastModifyTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
