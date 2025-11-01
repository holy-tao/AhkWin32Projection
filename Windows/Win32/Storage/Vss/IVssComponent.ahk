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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLogicalPath", "GetComponentType", "GetComponentName", "GetBackupSucceeded", "GetAlternateLocationMappingCount", "GetAlternateLocationMapping", "SetBackupMetadata", "GetBackupMetadata", "AddPartialFile", "GetPartialFileCount", "GetPartialFile", "IsSelectedForRestore", "GetAdditionalRestores", "GetNewTargetCount", "GetNewTarget", "AddDirectedTarget", "GetDirectedTargetCount", "GetDirectedTarget", "SetRestoreMetadata", "GetRestoreMetadata", "SetRestoreTarget", "GetRestoreTarget", "SetPreRestoreFailureMsg", "GetPreRestoreFailureMsg", "SetPostRestoreFailureMsg", "GetPostRestoreFailureMsg", "SetBackupStamp", "GetBackupStamp", "GetPreviousBackupStamp", "GetBackupOptions", "GetRestoreOptions", "GetRestoreSubcomponentCount", "GetRestoreSubcomponent", "GetFileRestoreStatus", "AddDifferencedFilesByLastModifyTime", "AddDifferencedFilesByLastModifyLSN", "GetDifferencedFilesCount", "GetDifferencedFile"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getlogicalpath
     */
    GetLogicalPath(pbstrPath) {
        result := ComCall(3, this, "ptr", pbstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pct 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getcomponenttype
     */
    GetComponentType(pct) {
        pctMarshal := pct is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pctMarshal, pct, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getcomponentname
     */
    GetComponentName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbSucceeded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getbackupsucceeded
     */
    GetBackupSucceeded(pbSucceeded) {
        pbSucceededMarshal := pbSucceeded is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pbSucceededMarshal, pbSucceeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcMappings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getalternatelocationmappingcount
     */
    GetAlternateLocationMappingCount(pcMappings) {
        pcMappingsMarshal := pcMappings is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pcMappingsMarshal, pcMappings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iMapping 
     * @param {Pointer<IVssWMFiledesc>} ppFiledesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getalternatelocationmapping
     */
    GetAlternateLocationMapping(iMapping, ppFiledesc) {
        result := ComCall(8, this, "uint", iMapping, "ptr*", ppFiledesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setbackupmetadata
     */
    SetBackupMetadata(wszData) {
        wszData := wszData is String ? StrPtr(wszData) : wszData

        result := ComCall(9, this, "ptr", wszData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getbackupmetadata
     */
    GetBackupMetadata(pbstrData) {
        result := ComCall(10, this, "ptr", pbstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilename 
     * @param {PWSTR} wszRanges 
     * @param {PWSTR} wszMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-addpartialfile
     */
    AddPartialFile(wszPath, wszFilename, wszRanges, wszMetadata) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilename := wszFilename is String ? StrPtr(wszFilename) : wszFilename
        wszRanges := wszRanges is String ? StrPtr(wszRanges) : wszRanges
        wszMetadata := wszMetadata is String ? StrPtr(wszMetadata) : wszMetadata

        result := ComCall(11, this, "ptr", wszPath, "ptr", wszFilename, "ptr", wszRanges, "ptr", wszMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcPartialFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getpartialfilecount
     */
    GetPartialFileCount(pcPartialFiles) {
        pcPartialFilesMarshal := pcPartialFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pcPartialFilesMarshal, pcPartialFiles, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getpartialfile
     */
    GetPartialFile(iPartialFile, pbstrPath, pbstrFilename, pbstrRange, pbstrMetadata) {
        result := ComCall(13, this, "uint", iPartialFile, "ptr", pbstrPath, "ptr", pbstrFilename, "ptr", pbstrRange, "ptr", pbstrMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbSelectedForRestore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-isselectedforrestore
     */
    IsSelectedForRestore(pbSelectedForRestore) {
        pbSelectedForRestoreMarshal := pbSelectedForRestore is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pbSelectedForRestoreMarshal, pbSelectedForRestore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Boolean>} pbAdditionalRestores 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getadditionalrestores
     */
    GetAdditionalRestores(pbAdditionalRestores) {
        pbAdditionalRestoresMarshal := pbAdditionalRestores is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pbAdditionalRestoresMarshal, pbAdditionalRestores, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcNewTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getnewtargetcount
     */
    GetNewTargetCount(pcNewTarget) {
        pcNewTargetMarshal := pcNewTarget is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcNewTargetMarshal, pcNewTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iNewTarget 
     * @param {Pointer<IVssWMFiledesc>} ppFiledesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getnewtarget
     */
    GetNewTarget(iNewTarget, ppFiledesc) {
        result := ComCall(17, this, "uint", iNewTarget, "ptr*", ppFiledesc, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-adddirectedtarget
     */
    AddDirectedTarget(wszSourcePath, wszSourceFilename, wszSourceRangeList, wszDestinationPath, wszDestinationFilename, wszDestinationRangeList) {
        wszSourcePath := wszSourcePath is String ? StrPtr(wszSourcePath) : wszSourcePath
        wszSourceFilename := wszSourceFilename is String ? StrPtr(wszSourceFilename) : wszSourceFilename
        wszSourceRangeList := wszSourceRangeList is String ? StrPtr(wszSourceRangeList) : wszSourceRangeList
        wszDestinationPath := wszDestinationPath is String ? StrPtr(wszDestinationPath) : wszDestinationPath
        wszDestinationFilename := wszDestinationFilename is String ? StrPtr(wszDestinationFilename) : wszDestinationFilename
        wszDestinationRangeList := wszDestinationRangeList is String ? StrPtr(wszDestinationRangeList) : wszDestinationRangeList

        result := ComCall(18, this, "ptr", wszSourcePath, "ptr", wszSourceFilename, "ptr", wszSourceRangeList, "ptr", wszDestinationPath, "ptr", wszDestinationFilename, "ptr", wszDestinationRangeList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcDirectedTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getdirectedtargetcount
     */
    GetDirectedTargetCount(pcDirectedTarget) {
        pcDirectedTargetMarshal := pcDirectedTarget is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, pcDirectedTargetMarshal, pcDirectedTarget, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getdirectedtarget
     */
    GetDirectedTarget(iDirectedTarget, pbstrSourcePath, pbstrSourceFileName, pbstrSourceRangeList, pbstrDestinationPath, pbstrDestinationFilename, pbstrDestinationRangeList) {
        result := ComCall(20, this, "uint", iDirectedTarget, "ptr", pbstrSourcePath, "ptr", pbstrSourceFileName, "ptr", pbstrSourceRangeList, "ptr", pbstrDestinationPath, "ptr", pbstrDestinationFilename, "ptr", pbstrDestinationRangeList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszRestoreMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setrestoremetadata
     */
    SetRestoreMetadata(wszRestoreMetadata) {
        wszRestoreMetadata := wszRestoreMetadata is String ? StrPtr(wszRestoreMetadata) : wszRestoreMetadata

        result := ComCall(21, this, "ptr", wszRestoreMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRestoreMetadata 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getrestoremetadata
     */
    GetRestoreMetadata(pbstrRestoreMetadata) {
        result := ComCall(22, this, "ptr", pbstrRestoreMetadata, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setrestoretarget
     */
    SetRestoreTarget(target) {
        result := ComCall(23, this, "int", target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getrestoretarget
     */
    GetRestoreTarget(pTarget) {
        pTargetMarshal := pTarget is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pTargetMarshal, pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPreRestoreFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setprerestorefailuremsg
     */
    SetPreRestoreFailureMsg(wszPreRestoreFailureMsg) {
        wszPreRestoreFailureMsg := wszPreRestoreFailureMsg is String ? StrPtr(wszPreRestoreFailureMsg) : wszPreRestoreFailureMsg

        result := ComCall(25, this, "ptr", wszPreRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPreRestoreFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getprerestorefailuremsg
     */
    GetPreRestoreFailureMsg(pbstrPreRestoreFailureMsg) {
        result := ComCall(26, this, "ptr", pbstrPreRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPostRestoreFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setpostrestorefailuremsg
     */
    SetPostRestoreFailureMsg(wszPostRestoreFailureMsg) {
        wszPostRestoreFailureMsg := wszPostRestoreFailureMsg is String ? StrPtr(wszPostRestoreFailureMsg) : wszPostRestoreFailureMsg

        result := ComCall(27, this, "ptr", wszPostRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPostRestoreFailureMsg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getpostrestorefailuremsg
     */
    GetPostRestoreFailureMsg(pbstrPostRestoreFailureMsg) {
        result := ComCall(28, this, "ptr", pbstrPostRestoreFailureMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszBackupStamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-setbackupstamp
     */
    SetBackupStamp(wszBackupStamp) {
        wszBackupStamp := wszBackupStamp is String ? StrPtr(wszBackupStamp) : wszBackupStamp

        result := ComCall(29, this, "ptr", wszBackupStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupStamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getbackupstamp
     */
    GetBackupStamp(pbstrBackupStamp) {
        result := ComCall(30, this, "ptr", pbstrBackupStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupStamp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getpreviousbackupstamp
     */
    GetPreviousBackupStamp(pbstrBackupStamp) {
        result := ComCall(31, this, "ptr", pbstrBackupStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBackupOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getbackupoptions
     */
    GetBackupOptions(pbstrBackupOptions) {
        result := ComCall(32, this, "ptr", pbstrBackupOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRestoreOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getrestoreoptions
     */
    GetRestoreOptions(pbstrRestoreOptions) {
        result := ComCall(33, this, "ptr", pbstrRestoreOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcRestoreSubcomponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getrestoresubcomponentcount
     */
    GetRestoreSubcomponentCount(pcRestoreSubcomponent) {
        pcRestoreSubcomponentMarshal := pcRestoreSubcomponent is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, pcRestoreSubcomponentMarshal, pcRestoreSubcomponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iComponent 
     * @param {Pointer<BSTR>} pbstrLogicalPath 
     * @param {Pointer<BSTR>} pbstrComponentName 
     * @param {Pointer<Boolean>} pbRepair 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getrestoresubcomponent
     */
    GetRestoreSubcomponent(iComponent, pbstrLogicalPath, pbstrComponentName, pbRepair) {
        pbRepairMarshal := pbRepair is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, "uint", iComponent, "ptr", pbstrLogicalPath, "ptr", pbstrComponentName, pbRepairMarshal, pbRepair, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getfilerestorestatus
     */
    GetFileRestoreStatus(pStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pStatusMarshal, pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {BOOL} bRecursive 
     * @param {FILETIME} ftLastModifyTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-adddifferencedfilesbylastmodifytime
     */
    AddDifferencedFilesByLastModifyTime(wszPath, wszFilespec, bRecursive, ftLastModifyTime) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec

        result := ComCall(37, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", ftLastModifyTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszPath 
     * @param {PWSTR} wszFilespec 
     * @param {BOOL} bRecursive 
     * @param {BSTR} bstrLsnString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-adddifferencedfilesbylastmodifylsn
     */
    AddDifferencedFilesByLastModifyLSN(wszPath, wszFilespec, bRecursive, bstrLsnString) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath
        wszFilespec := wszFilespec is String ? StrPtr(wszFilespec) : wszFilespec
        bstrLsnString := bstrLsnString is String ? BSTR.Alloc(bstrLsnString).Value : bstrLsnString

        result := ComCall(38, this, "ptr", wszPath, "ptr", wszFilespec, "int", bRecursive, "ptr", bstrLsnString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcDifferencedFiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getdifferencedfilescount
     */
    GetDifferencedFilesCount(pcDifferencedFiles) {
        pcDifferencedFilesMarshal := pcDifferencedFiles is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, pcDifferencedFilesMarshal, pcDifferencedFiles, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vswriter/nf-vswriter-ivsscomponent-getdifferencedfile
     */
    GetDifferencedFile(iDifferencedFile, pbstrPath, pbstrFilespec, pbRecursive, pbstrLsnString, pftLastModifyTime) {
        result := ComCall(40, this, "uint", iDifferencedFile, "ptr", pbstrPath, "ptr", pbstrFilespec, "ptr", pbRecursive, "ptr", pbstrLsnString, "ptr", pftLastModifyTime, "HRESULT")
        return result
    }
}
