#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\JET_INDEX_COLUMN.ahk" { JET_INDEX_COLUMN }
#Import ".\JET_SETSYSPARAM_A.ahk" { JET_SETSYSPARAM_A }
#Import ".\JET_TABLECREATE_W.ahk" { JET_TABLECREATE_W }
#Import ".\JET_INSTANCE_INFO_A.ahk" { JET_INSTANCE_INFO_A }
#Import ".\JET_SESID.ahk" { JET_SESID }
#Import ".\JET_CONVERT_W.ahk" { JET_CONVERT_W }
#Import ".\JET_ENUMCOLUMNID.ahk" { JET_ENUMCOLUMNID }
#Import ".\JET_COMMIT_ID.ahk" { JET_COMMIT_ID }
#Import "..\StructuredStorage\JET_TABLEID.ahk" { JET_TABLEID }
#Import ".\JET_LS.ahk" { JET_LS }
#Import ".\JET_INDEXRANGE.ahk" { JET_INDEXRANGE }
#Import ".\JET_INDEX_RANGE.ahk" { JET_INDEX_RANGE }
#Import ".\JET_RETINFO.ahk" { JET_RETINFO }
#Import ".\JET_RECPOS.ahk" { JET_RECPOS }
#Import ".\JET_INDEXCREATE_W.ahk" { JET_INDEXCREATE_W }
#Import ".\JET_OPENTEMPORARYTABLE.ahk" { JET_OPENTEMPORARYTABLE }
#Import ".\JET_INDEXCREATE2_W.ahk" { JET_INDEXCREATE2_W }
#Import ".\JET_TABLECREATE3_A.ahk" { JET_TABLECREATE3_A }
#Import ".\JET_TABLECREATE2_A.ahk" { JET_TABLECREATE2_A }
#Import ".\JET_UNICODEINDEX.ahk" { JET_UNICODEINDEX }
#Import ".\JET_INDEXCREATE3_A.ahk" { JET_INDEXCREATE3_A }
#Import ".\JET_TABLECREATE2_W.ahk" { JET_TABLECREATE2_W }
#Import ".\JET_RECORDLIST.ahk" { JET_RECORDLIST }
#Import ".\JET_RSTINFO_A.ahk" { JET_RSTINFO_A }
#Import ".\JET_INSTANCE.ahk" { JET_INSTANCE }
#Import ".\JET_INDEXCREATE_A.ahk" { JET_INDEXCREATE_A }
#Import ".\JET_RECSIZE.ahk" { JET_RECSIZE }
#Import ".\JET_TABLECREATE3_W.ahk" { JET_TABLECREATE3_W }
#Import ".\JET_OSSNAPID.ahk" { JET_OSSNAPID }
#Import "..\StructuredStorage\JET_HANDLE.ahk" { JET_HANDLE }
#Import ".\JET_RETRIEVECOLUMN.ahk" { JET_RETRIEVECOLUMN }
#Import ".\JET_OPENTEMPORARYTABLE2.ahk" { JET_OPENTEMPORARYTABLE2 }
#Import ".\JET_SETINFO.ahk" { JET_SETINFO }
#Import ".\JET_TABLECREATE4_A.ahk" { JET_TABLECREATE4_A }
#Import ".\JET_COLUMNDEF.ahk" { JET_COLUMNDEF }
#Import ".\JET_RSTINFO_W.ahk" { JET_RSTINFO_W }
#Import ".\JET_INDEXCREATE2_A.ahk" { JET_INDEXCREATE2_A }
#Import ".\JET_LOGINFO_A.ahk" { JET_LOGINFO_A }
#Import ".\JET_INDEXCREATE3_W.ahk" { JET_INDEXCREATE3_W }
#Import ".\JET_CONVERT_A.ahk" { JET_CONVERT_A }
#Import ".\JET_SETCOLUMN.ahk" { JET_SETCOLUMN }
#Import ".\JET_INDEXID.ahk" { JET_INDEXID }
#Import ".\JET_SETSYSPARAM_W.ahk" { JET_SETSYSPARAM_W }
#Import ".\JET_LOGINFO_W.ahk" { JET_LOGINFO_W }
#Import "..\StructuredStorage\JET_API_PTR.ahk" { JET_API_PTR }
#Import ".\JET_RSTMAP_A.ahk" { JET_RSTMAP_A }
#Import ".\JET_TABLECREATE_A.ahk" { JET_TABLECREATE_A }
#Import ".\JET_RSTMAP_W.ahk" { JET_RSTMAP_W }
#Import ".\JET_ENUMCOLUMN.ahk" { JET_ENUMCOLUMN }
#Import ".\JET_INSTANCE_INFO_W.ahk" { JET_INSTANCE_INFO_W }
#Import ".\JET_RECSIZE2.ahk" { JET_RECSIZE2 }
#Import ".\JET_TABLECREATE4_W.ahk" { JET_TABLECREATE4_W }

/**
 * @namespace Windows.Win32.Storage.Jet
 */

;@region Functions
/**
 * Learn more about: JetInit Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit-function
 */
export JetInit(pinstance) {
    result := DllCall("ESENT.dll\JetInit", JET_INSTANCE.Ptr, pinstance, Int32)
    return result
}

/**
 * Learn more about: JetInit2 Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit2-function
 */
export JetInit2(pinstance, grbit) {
    result := DllCall("ESENT.dll\JetInit2", JET_INSTANCE.Ptr, pinstance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetInit3 Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<JET_RSTINFO_A>} prstInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit3-function
 */
export JetInit3A(pinstance, prstInfo, grbit) {
    result := DllCall("ESENT.dll\JetInit3A", JET_INSTANCE.Ptr, pinstance, JET_RSTINFO_A.Ptr, prstInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetInit3 Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<JET_RSTINFO_W>} prstInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetinit3-function
 */
export JetInit3W(pinstance, prstInfo, grbit) {
    result := DllCall("ESENT.dll\JetInit3W", JET_INSTANCE.Ptr, pinstance, JET_RSTINFO_W.Ptr, prstInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateInstance Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<Integer>} szInstanceName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance-function
 */
export JetCreateInstanceA(pinstance, szInstanceName) {
    szInstanceNameMarshal := szInstanceName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateInstanceA", JET_INSTANCE.Ptr, pinstance, szInstanceNameMarshal, szInstanceName, Int32)
    return result
}

/**
 * Learn more about: JetCreateInstance Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<Integer>} szInstanceName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance-function
 */
export JetCreateInstanceW(pinstance, szInstanceName) {
    szInstanceNameMarshal := szInstanceName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateInstanceW", JET_INSTANCE.Ptr, pinstance, szInstanceNameMarshal, szInstanceName, Int32)
    return result
}

/**
 * Learn more about: JetCreateInstance2 Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<Integer>} szInstanceName 
 * @param {Pointer<Integer>} szDisplayName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance2-function
 */
export JetCreateInstance2A(pinstance, szInstanceName, szDisplayName, grbit) {
    szInstanceNameMarshal := szInstanceName is VarRef ? "char*" : "ptr"
    szDisplayNameMarshal := szDisplayName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateInstance2A", JET_INSTANCE.Ptr, pinstance, szInstanceNameMarshal, szInstanceName, szDisplayNameMarshal, szDisplayName, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateInstance2 Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {Pointer<Integer>} szInstanceName 
 * @param {Pointer<Integer>} szDisplayName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateinstance2-function
 */
export JetCreateInstance2W(pinstance, szInstanceName, szDisplayName, grbit) {
    szInstanceNameMarshal := szInstanceName is VarRef ? "ushort*" : "ptr"
    szDisplayNameMarshal := szDisplayName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateInstance2W", JET_INSTANCE.Ptr, pinstance, szInstanceNameMarshal, szInstanceName, szDisplayNameMarshal, szDisplayName, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetInstanceMiscInfo Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstancemiscinfo-function
 */
export JetGetInstanceMiscInfo(instance, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetInstanceMiscInfo", JET_INSTANCE, instance, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetTerm Function
 * @param {JET_INSTANCE} instance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetterm-function
 */
export JetTerm(instance) {
    result := DllCall("ESENT.dll\JetTerm", JET_INSTANCE, instance, Int32)
    return result
}

/**
 * Learn more about: JetTerm2 Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetterm2-function
 */
export JetTerm2(instance, grbit) {
    result := DllCall("ESENT.dll\JetTerm2", JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetStopService Function
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopservice-function
 */
export JetStopService() {
    result := DllCall("ESENT.dll\JetStopService", Int32)
    return result
}

/**
 * Learn more about: JetStopServiceInstance Function
 * @param {JET_INSTANCE} instance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopserviceinstance-function
 */
export JetStopServiceInstance(instance) {
    result := DllCall("ESENT.dll\JetStopServiceInstance", JET_INSTANCE, instance, Int32)
    return result
}

/**
 * Learn more about: JetStopServiceInstance2 Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopserviceinstance2-function
 */
export JetStopServiceInstance2(instance, grbit) {
    result := DllCall("ESENT.dll\JetStopServiceInstance2", JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetStopBackup Function
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopbackup-function
 */
export JetStopBackup() {
    result := DllCall("ESENT.dll\JetStopBackup", Int32)
    return result
}

/**
 * Learn more about: JetStopBackupInstance Function
 * @param {JET_INSTANCE} instance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetstopbackupinstance-function
 */
export JetStopBackupInstance(instance) {
    result := DllCall("ESENT.dll\JetStopBackupInstance", JET_INSTANCE, instance, Int32)
    return result
}

/**
 * Learn more about: JetSetSystemParameter Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {JET_SESID} sesid 
 * @param {Integer} paramid 
 * @param {JET_API_PTR} _lParam 
 * @param {Pointer<Integer>} szParam 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsystemparameter-function
 */
export JetSetSystemParameterA(pinstance, sesid, paramid, _lParam, szParam) {
    szParamMarshal := szParam is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetSystemParameterA", JET_INSTANCE.Ptr, pinstance, JET_SESID, sesid, "uint", paramid, JET_API_PTR, _lParam, szParamMarshal, szParam, Int32)
    return result
}

/**
 * Learn more about: JetSetSystemParameter Function
 * @param {Pointer<JET_INSTANCE>} pinstance 
 * @param {JET_SESID} sesid 
 * @param {Integer} paramid 
 * @param {JET_API_PTR} _lParam 
 * @param {Pointer<Integer>} szParam 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsystemparameter-function
 */
export JetSetSystemParameterW(pinstance, sesid, paramid, _lParam, szParam) {
    szParamMarshal := szParam is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetSystemParameterW", JET_INSTANCE.Ptr, pinstance, JET_SESID, sesid, "uint", paramid, JET_API_PTR, _lParam, szParamMarshal, szParam, Int32)
    return result
}

/**
 * Learn more about: JetGetSystemParameter Function
 * @param {JET_INSTANCE} instance 
 * @param {JET_SESID} sesid 
 * @param {Integer} paramid 
 * @param {Pointer<JET_API_PTR>} plParam 
 * @param {Integer} szParam 
 * @param {Integer} cbMax 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsystemparameter-function
 */
export JetGetSystemParameterA(instance, sesid, paramid, plParam, szParam, cbMax) {
    result := DllCall("ESENT.dll\JetGetSystemParameterA", JET_INSTANCE, instance, JET_SESID, sesid, "uint", paramid, JET_API_PTR.Ptr, plParam, "ptr", szParam, "uint", cbMax, Int32)
    return result
}

/**
 * Learn more about: JetGetSystemParameter Function
 * @param {JET_INSTANCE} instance 
 * @param {JET_SESID} sesid 
 * @param {Integer} paramid 
 * @param {Pointer<JET_API_PTR>} plParam 
 * @param {Integer} szParam 
 * @param {Integer} cbMax 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsystemparameter-function
 */
export JetGetSystemParameterW(instance, sesid, paramid, plParam, szParam, cbMax) {
    result := DllCall("ESENT.dll\JetGetSystemParameterW", JET_INSTANCE, instance, JET_SESID, sesid, "uint", paramid, JET_API_PTR.Ptr, plParam, "ptr", szParam, "uint", cbMax, Int32)
    return result
}

/**
 * Learn more about: JetEnableMultiInstance Function
 * @param {Pointer<JET_SETSYSPARAM_A>} psetsysparam 
 * @param {Integer} csetsysparam 
 * @param {Pointer<Integer>} pcsetsucceed 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenablemultiinstance-function
 */
export JetEnableMultiInstanceA(psetsysparam, csetsysparam, pcsetsucceed) {
    pcsetsucceedMarshal := pcsetsucceed is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetEnableMultiInstanceA", JET_SETSYSPARAM_A.Ptr, psetsysparam, "uint", csetsysparam, pcsetsucceedMarshal, pcsetsucceed, Int32)
    return result
}

/**
 * Learn more about: JetEnableMultiInstance Function
 * @param {Pointer<JET_SETSYSPARAM_W>} psetsysparam 
 * @param {Integer} csetsysparam 
 * @param {Pointer<Integer>} pcsetsucceed 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenablemultiinstance-function
 */
export JetEnableMultiInstanceW(psetsysparam, csetsysparam, pcsetsucceed) {
    pcsetsucceedMarshal := pcsetsucceed is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetEnableMultiInstanceW", JET_SETSYSPARAM_W.Ptr, psetsysparam, "uint", csetsysparam, pcsetsucceedMarshal, pcsetsucceed, Int32)
    return result
}

/**
 * Learn more about: JetGetThreadStats Function
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetthreadstats-function
 */
export JetGetThreadStats(pvResult, cbMax) {
    result := DllCall("ESENT.dll\JetGetThreadStats", "ptr", pvResult, "uint", cbMax, Int32)
    return result
}

/**
 * Learn more about: JetBeginSession Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<JET_SESID>} psesid 
 * @param {Pointer<Integer>} szUserName 
 * @param {Pointer<Integer>} szPassword 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginsession-function
 */
export JetBeginSessionA(instance, psesid, szUserName, szPassword) {
    szUserNameMarshal := szUserName is VarRef ? "char*" : "ptr"
    szPasswordMarshal := szPassword is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetBeginSessionA", JET_INSTANCE, instance, JET_SESID.Ptr, psesid, szUserNameMarshal, szUserName, szPasswordMarshal, szPassword, Int32)
    return result
}

/**
 * Learn more about: JetBeginSession Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<JET_SESID>} psesid 
 * @param {Pointer<Integer>} szUserName 
 * @param {Pointer<Integer>} szPassword 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginsession-function
 */
export JetBeginSessionW(instance, psesid, szUserName, szPassword) {
    szUserNameMarshal := szUserName is VarRef ? "ushort*" : "ptr"
    szPasswordMarshal := szPassword is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetBeginSessionW", JET_INSTANCE, instance, JET_SESID.Ptr, psesid, szUserNameMarshal, szUserName, szPasswordMarshal, szPassword, Int32)
    return result
}

/**
 * Learn more about: JetDupSession Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_SESID>} psesid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdupsession-function
 */
export JetDupSession(sesid, psesid) {
    result := DllCall("ESENT.dll\JetDupSession", JET_SESID, sesid, JET_SESID.Ptr, psesid, Int32)
    return result
}

/**
 * Learn more about: JetEndSession Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendsession-function
 */
export JetEndSession(sesid, grbit) {
    result := DllCall("ESENT.dll\JetEndSession", JET_SESID, sesid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetVersion Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} pwVersion 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetversion-function
 */
export JetGetVersion(sesid, pwVersion) {
    pwVersionMarshal := pwVersion is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetVersion", JET_SESID, sesid, pwVersionMarshal, pwVersion, Int32)
    return result
}

/**
 * Learn more about: JetIdle Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetidle-function
 */
export JetIdle(sesid, grbit) {
    result := DllCall("ESENT.dll\JetIdle", JET_SESID, sesid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Pointer<Integer>} szConnect 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase-function
 */
export JetCreateDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"
    szConnectMarshal := szConnect is VarRef ? "char*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateDatabaseA", JET_SESID, sesid, szFilenameMarshal, szFilename, szConnectMarshal, szConnect, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Pointer<Integer>} szConnect 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase-function
 */
export JetCreateDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"
    szConnectMarshal := szConnect is VarRef ? "ushort*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateDatabaseW", JET_SESID, sesid, szFilenameMarshal, szFilename, szConnectMarshal, szConnect, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} cpgDatabaseSizeMax 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase2-function
 */
export JetCreateDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateDatabase2A", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", cpgDatabaseSizeMax, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCreateDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} cpgDatabaseSizeMax 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatedatabase2-function
 */
export JetCreateDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateDatabase2W", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", cpgDatabaseSizeMax, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetAttachDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase-function
 */
export JetAttachDatabaseA(sesid, szFilename, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetAttachDatabaseA", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetAttachDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase-function
 */
export JetAttachDatabaseW(sesid, szFilename, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetAttachDatabaseW", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetAttachDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} cpgDatabaseSizeMax 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase2-function
 */
export JetAttachDatabase2A(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetAttachDatabase2A", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetAttachDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} cpgDatabaseSizeMax 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetattachdatabase2-function
 */
export JetAttachDatabase2W(sesid, szFilename, cpgDatabaseSizeMax, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetAttachDatabase2W", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", cpgDatabaseSizeMax, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDetachDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase-function
 */
export JetDetachDatabaseA(sesid, szFilename) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDetachDatabaseA", JET_SESID, sesid, szFilenameMarshal, szFilename, Int32)
    return result
}

/**
 * Learn more about: JetDetachDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase-function
 */
export JetDetachDatabaseW(sesid, szFilename) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDetachDatabaseW", JET_SESID, sesid, szFilenameMarshal, szFilename, Int32)
    return result
}

/**
 * Learn more about: JetDetachDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase2-function
 */
export JetDetachDatabase2A(sesid, szFilename, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDetachDatabase2A", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDetachDatabase2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdetachdatabase2-function
 */
export JetDetachDatabase2W(sesid, szFilename, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDetachDatabase2W", JET_SESID, sesid, szFilenameMarshal, szFilename, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetObjectInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} objtyp 
 * @param {Pointer<Integer>} szContainerName 
 * @param {Pointer<Integer>} szObjectName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetobjectinfo-function
 */
export JetGetObjectInfoA(sesid, _dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
    szContainerNameMarshal := szContainerName is VarRef ? "char*" : "ptr"
    szObjectNameMarshal := szObjectName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetObjectInfoA", JET_SESID, sesid, "uint", _dbid, "uint", objtyp, szContainerNameMarshal, szContainerName, szObjectNameMarshal, szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetObjectInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} objtyp 
 * @param {Pointer<Integer>} szContainerName 
 * @param {Pointer<Integer>} szObjectName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetobjectinfo-function
 */
export JetGetObjectInfoW(sesid, _dbid, objtyp, szContainerName, szObjectName, pvResult, cbMax, InfoLevel) {
    szContainerNameMarshal := szContainerName is VarRef ? "ushort*" : "ptr"
    szObjectNameMarshal := szObjectName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetObjectInfoW", JET_SESID, sesid, "uint", _dbid, "uint", objtyp, szContainerNameMarshal, szContainerName, szObjectNameMarshal, szObjectName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetTableInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableinfo-function
 */
export JetGetTableInfoA(sesid, tableid, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetTableInfoA", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetTableInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableinfo-function
 */
export JetGetTableInfoW(sesid, tableid, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetTableInfoW", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetCreateTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} lPages 
 * @param {Integer} lDensity 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetable-function
 */
export JetCreateTableA(sesid, _dbid, szTableName, lPages, lDensity, ptableid) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateTableA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, "uint", lPages, "uint", lDensity, JET_TABLEID.Ptr, ptableid, Int32)
    return result
}

/**
 * Learn more about: JetCreateTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} lPages 
 * @param {Integer} lDensity 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetable-function
 */
export JetCreateTableW(sesid, _dbid, szTableName, lPages, lDensity, ptableid) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateTableW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, "uint", lPages, "uint", lDensity, JET_TABLEID.Ptr, ptableid, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE_A>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex-function
 */
export JetCreateTableColumnIndexA(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndexA", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE_A.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE_W>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex-function
 */
export JetCreateTableColumnIndexW(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndexW", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE_W.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE2_A>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex2-function
 */
export JetCreateTableColumnIndex2A(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex2A", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE2_A.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE2_W>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex2-function
 */
export JetCreateTableColumnIndex2W(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex2W", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE2_W.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE3_A>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex3-function
 */
export JetCreateTableColumnIndex3A(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex3A", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE3_A.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE3_W>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex3-function
 */
export JetCreateTableColumnIndex3W(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex3W", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE3_W.Ptr, ptablecreate, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE4_A>} ptablecreate 
 * @returns {Integer} 
 */
export JetCreateTableColumnIndex4A(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex4A", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE4_A.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateTableColumnIndex4W Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<JET_TABLECREATE4_W>} ptablecreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreatetablecolumnindex4w-function
 */
export JetCreateTableColumnIndex4W(sesid, _dbid, ptablecreate) {
    result := DllCall("ESENT.dll\JetCreateTableColumnIndex4W", JET_SESID, sesid, "uint", _dbid, JET_TABLECREATE4_W.Ptr, ptablecreate, Int32)
    return result
}

/**
 * Learn more about: JetDeleteTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletetable-function
 */
export JetDeleteTableA(sesid, _dbid, szTableName) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteTableA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, Int32)
    return result
}

/**
 * Learn more about: JetDeleteTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletetable-function
 */
export JetDeleteTableW(sesid, _dbid, szTableName) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteTableW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, Int32)
    return result
}

/**
 * Learn more about: JetRenameTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szName 
 * @param {Pointer<Integer>} szNameNew 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrenametable-function
 */
export JetRenameTableA(sesid, _dbid, szName, szNameNew) {
    szNameMarshal := szName is VarRef ? "char*" : "ptr"
    szNameNewMarshal := szNameNew is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetRenameTableA", JET_SESID, sesid, "uint", _dbid, szNameMarshal, szName, szNameNewMarshal, szNameNew, Int32)
    return result
}

/**
 * Learn more about: JetRenameTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szName 
 * @param {Pointer<Integer>} szNameNew 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrenametable-function
 */
export JetRenameTableW(sesid, _dbid, szName, szNameNew) {
    szNameMarshal := szName is VarRef ? "ushort*" : "ptr"
    szNameNewMarshal := szNameNew is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetRenameTableW", JET_SESID, sesid, "uint", _dbid, szNameMarshal, szName, szNameNewMarshal, szNameNew, Int32)
    return result
}

/**
 * Learn more about: JetGetTableColumnInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettablecolumninfo-function
 */
export JetGetTableColumnInfoA(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTableColumnInfoA", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetTableColumnInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettablecolumninfo-function
 */
export JetGetTableColumnInfoW(sesid, tableid, szColumnName, pvResult, cbMax, InfoLevel) {
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTableColumnInfoW", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetColumnInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pColumnNameOrId 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcolumninfo-function
 */
export JetGetColumnInfoA(sesid, _dbid, szTableName, pColumnNameOrId, pvResult, cbMax, InfoLevel) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    pColumnNameOrIdMarshal := pColumnNameOrId is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetColumnInfoA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pColumnNameOrIdMarshal, pColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetColumnInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pwColumnNameOrId 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcolumninfo-function
 */
export JetGetColumnInfoW(sesid, _dbid, szTableName, pwColumnNameOrId, pvResult, cbMax, InfoLevel) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    pwColumnNameOrIdMarshal := pwColumnNameOrId is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetColumnInfoW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pwColumnNameOrIdMarshal, pwColumnNameOrId, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetAddColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
 * @param {Integer} pvDefault 
 * @param {Integer} cbDefault 
 * @param {Pointer<Integer>} pcolumnid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetaddcolumn-function
 */
export JetAddColumnA(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"
    pcolumnidMarshal := pcolumnid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetAddColumnA", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, JET_COLUMNDEF.Ptr, pcolumndef, "ptr", pvDefault, "uint", cbDefault, pcolumnidMarshal, pcolumnid, Int32)
    return result
}

/**
 * Learn more about: JetAddColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Pointer<JET_COLUMNDEF>} pcolumndef 
 * @param {Integer} pvDefault 
 * @param {Integer} cbDefault 
 * @param {Pointer<Integer>} pcolumnid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetaddcolumn-function
 */
export JetAddColumnW(sesid, tableid, szColumnName, pcolumndef, pvDefault, cbDefault, pcolumnid) {
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"
    pcolumnidMarshal := pcolumnid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetAddColumnW", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, JET_COLUMNDEF.Ptr, pcolumndef, "ptr", pvDefault, "uint", cbDefault, pcolumnidMarshal, pcolumnid, Int32)
    return result
}

/**
 * Learn more about: JetDeleteColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn-function
 */
export JetDeleteColumnA(sesid, tableid, szColumnName) {
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteColumnA", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, Int32)
    return result
}

/**
 * Learn more about: JetDeleteColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn-function
 */
export JetDeleteColumnW(sesid, tableid, szColumnName) {
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteColumnW", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, Int32)
    return result
}

/**
 * Learn more about: JetDeleteColumn2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn2-function
 */
export JetDeleteColumn2A(sesid, tableid, szColumnName, grbit) {
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteColumn2A", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDeleteColumn2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeletecolumn2-function
 */
export JetDeleteColumn2W(sesid, tableid, szColumnName, grbit) {
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteColumn2W", JET_SESID, sesid, JET_TABLEID, tableid, szColumnNameMarshal, szColumnName, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szName 
 * @param {Pointer<Integer>} szNameNew 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetRenameColumnA(sesid, tableid, szName, szNameNew, grbit) {
    szNameMarshal := szName is VarRef ? "char*" : "ptr"
    szNameNewMarshal := szNameNew is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetRenameColumnA", JET_SESID, sesid, JET_TABLEID, tableid, szNameMarshal, szName, szNameNewMarshal, szNameNew, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szName 
 * @param {Pointer<Integer>} szNameNew 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetRenameColumnW(sesid, tableid, szName, szNameNew, grbit) {
    szNameMarshal := szName is VarRef ? "ushort*" : "ptr"
    szNameNewMarshal := szNameNew is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetRenameColumnW", JET_SESID, sesid, JET_TABLEID, tableid, szNameMarshal, szName, szNameNewMarshal, szNameNew, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} pvData 
 * @param {Integer} cbData 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetSetColumnDefaultValueA(sesid, _dbid, szTableName, szColumnName, pvData, cbData, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetColumnDefaultValueA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, szColumnNameMarshal, szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} szColumnName 
 * @param {Integer} pvData 
 * @param {Integer} cbData 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetSetColumnDefaultValueW(sesid, _dbid, szTableName, szColumnName, pvData, cbData, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    szColumnNameMarshal := szColumnName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetColumnDefaultValueW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, szColumnNameMarshal, szColumnName, "ptr", pvData, "uint", cbData, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetTableIndexInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} pvResult 
 * @param {Integer} cbResult 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableindexinfo-function
 */
export JetGetTableIndexInfoA(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTableIndexInfoA", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetTableIndexInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} pvResult 
 * @param {Integer} cbResult 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettableindexinfo-function
 */
export JetGetTableIndexInfoW(sesid, tableid, szIndexName, pvResult, cbResult, InfoLevel) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTableIndexInfoW", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetIndexInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} pvResult 
 * @param {Integer} cbResult 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetindexinfo-function
 */
export JetGetIndexInfoA(sesid, _dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetIndexInfoA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, szIndexNameMarshal, szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetIndexInfo Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} pvResult 
 * @param {Integer} cbResult 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetindexinfo-function
 */
export JetGetIndexInfoW(sesid, _dbid, szTableName, szIndexName, pvResult, cbResult, InfoLevel) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetIndexInfoW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, szIndexNameMarshal, szIndexName, "ptr", pvResult, "uint", cbResult, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @param {Integer} szKey 
 * @param {Integer} cbKey 
 * @param {Integer} lDensity 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex-function
 */
export JetCreateIndexA(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateIndexA", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @param {Integer} szKey 
 * @param {Integer} cbKey 
 * @param {Integer} lDensity 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex-function
 */
export JetCreateIndexW(sesid, tableid, szIndexName, grbit, szKey, cbKey, lDensity) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetCreateIndexW", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, "ptr", szKey, "uint", cbKey, "uint", lDensity, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE_A>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex2-function
 */
export JetCreateIndex2A(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex2A", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE_A.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE_W>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex2-function
 */
export JetCreateIndex2W(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex2W", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE_W.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE2_A>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex3-function
 */
export JetCreateIndex3A(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex3A", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE2_A.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE2_W>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex3-function
 */
export JetCreateIndex3W(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex3W", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE2_W.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE3_A>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 */
export JetCreateIndex4A(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex4A", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE3_A.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * Learn more about: JetCreateIndex4W Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEXCREATE3_W>} pindexcreate 
 * @param {Integer} cIndexCreate 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcreateindex4w-function
 */
export JetCreateIndex4W(sesid, tableid, pindexcreate, cIndexCreate) {
    result := DllCall("ESENT.dll\JetCreateIndex4W", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEXCREATE3_W.Ptr, pindexcreate, "uint", cIndexCreate, Int32)
    return result
}

/**
 * Learn more about: JetDeleteIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeleteindex-function
 */
export JetDeleteIndexA(sesid, tableid, szIndexName) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteIndexA", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, Int32)
    return result
}

/**
 * Learn more about: JetDeleteIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdeleteindex-function
 */
export JetDeleteIndexW(sesid, tableid, szIndexName) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetDeleteIndexW", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, Int32)
    return result
}

/**
 * Learn more about: JetBeginTransaction Function
 * @param {JET_SESID} sesid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction-function
 */
export JetBeginTransaction(sesid) {
    result := DllCall("ESENT.dll\JetBeginTransaction", JET_SESID, sesid, Int32)
    return result
}

/**
 * Learn more about: JetBeginTransaction2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction2-function
 */
export JetBeginTransaction2(sesid, grbit) {
    result := DllCall("ESENT.dll\JetBeginTransaction2", JET_SESID, sesid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetBeginTransaction3 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} trxid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbegintransaction3-function
 */
export JetBeginTransaction3(sesid, trxid, grbit) {
    result := DllCall("ESENT.dll\JetBeginTransaction3", JET_SESID, sesid, "int64", trxid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCommitTransaction Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcommittransaction-function
 */
export JetCommitTransaction(sesid, grbit) {
    result := DllCall("ESENT.dll\JetCommitTransaction", JET_SESID, sesid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCommitTransaction2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @param {Integer} cmsecDurableCommit 
 * @param {Pointer<JET_COMMIT_ID>} pCommitId 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcommittransaction2-function
 */
export JetCommitTransaction2(sesid, grbit, cmsecDurableCommit, pCommitId) {
    result := DllCall("ESENT.dll\JetCommitTransaction2", JET_SESID, sesid, "uint", grbit, "uint", cmsecDurableCommit, JET_COMMIT_ID.Ptr, pCommitId, Int32)
    return result
}

/**
 * Learn more about: JetRollback Function
 * @param {JET_SESID} sesid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrollback-function
 */
export JetRollback(sesid, grbit) {
    result := DllCall("ESENT.dll\JetRollback", JET_SESID, sesid, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 */
export JetGetDatabaseInfoA(sesid, _dbid, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetDatabaseInfoA", JET_SESID, sesid, "uint", _dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 */
export JetGetDatabaseInfoW(sesid, _dbid, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetDatabaseInfoW", JET_SESID, sesid, "uint", _dbid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetDatabaseFileInfo Function
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetdatabasefileinfo-function
 */
export JetGetDatabaseFileInfoA(szDatabaseName, pvResult, cbMax, InfoLevel) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetGetDatabaseFileInfoA", szDatabaseNameMarshal, szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetGetDatabaseFileInfo Function
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetdatabasefileinfo-function
 */
export JetGetDatabaseFileInfoW(szDatabaseName, pvResult, cbMax, InfoLevel) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetGetDatabaseFileInfoW", szDatabaseNameMarshal, szDatabaseName, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetOpenDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Pointer<Integer>} szConnect 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopendatabase-function
 */
export JetOpenDatabaseA(sesid, szFilename, szConnect, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "char*" : "ptr"
    szConnectMarshal := szConnect is VarRef ? "char*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenDatabaseA", JET_SESID, sesid, szFilenameMarshal, szFilename, szConnectMarshal, szConnect, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOpenDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szFilename 
 * @param {Pointer<Integer>} szConnect 
 * @param {Pointer<Integer>} pdbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopendatabase-function
 */
export JetOpenDatabaseW(sesid, szFilename, szConnect, pdbid, grbit) {
    szFilenameMarshal := szFilename is VarRef ? "ushort*" : "ptr"
    szConnectMarshal := szConnect is VarRef ? "ushort*" : "ptr"
    pdbidMarshal := pdbid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenDatabaseW", JET_SESID, sesid, szFilenameMarshal, szFilename, szConnectMarshal, szConnect, pdbidMarshal, pdbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCloseDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosedatabase-function
 */
export JetCloseDatabase(sesid, _dbid, grbit) {
    result := DllCall("ESENT.dll\JetCloseDatabase", JET_SESID, sesid, "uint", _dbid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOpenTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} pvParameters 
 * @param {Integer} cbParameters 
 * @param {Integer} grbit 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentable-function
 */
export JetOpenTableA(sesid, _dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenTableA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, JET_TABLEID.Ptr, ptableid, Int32)
    return result
}

/**
 * Learn more about: JetOpenTable Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Integer} pvParameters 
 * @param {Integer} cbParameters 
 * @param {Integer} grbit 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentable-function
 */
export JetOpenTableW(sesid, _dbid, szTableName, pvParameters, cbParameters, grbit, ptableid) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenTableW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, "ptr", pvParameters, "uint", cbParameters, "uint", grbit, JET_TABLEID.Ptr, ptableid, Int32)
    return result
}

/**
 * Learn more about: JetSetTableSequential Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsettablesequential-function
 */
export JetSetTableSequential(sesid, tableid, grbit) {
    result := DllCall("ESENT.dll\JetSetTableSequential", JET_SESID, sesid, JET_TABLEID, tableid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetResetTableSequential Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresettablesequential-function
 */
export JetResetTableSequential(sesid, tableid, grbit) {
    result := DllCall("ESENT.dll\JetResetTableSequential", JET_SESID, sesid, JET_TABLEID, tableid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCloseTable Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosetable-function
 */
export JetCloseTable(sesid, tableid) {
    result := DllCall("ESENT.dll\JetCloseTable", JET_SESID, sesid, JET_TABLEID, tableid, Int32)
    return result
}

/**
 * Learn more about: JetDelete Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdelete-function
 */
export JetDelete(sesid, tableid) {
    result := DllCall("ESENT.dll\JetDelete", JET_SESID, sesid, JET_TABLEID, tableid, Int32)
    return result
}

/**
 * Learn more about: JetUpdate Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvBookmark 
 * @param {Integer} cbBookmark 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetupdate-function
 */
export JetUpdate(sesid, tableid, pvBookmark, cbBookmark, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetUpdate", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvBookmark, "uint", cbBookmark, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetUpdate2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvBookmark 
 * @param {Integer} cbBookmark 
 * @param {Pointer<Integer>} pcbActual 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetupdate2-function
 */
export JetUpdate2(sesid, tableid, pvBookmark, cbBookmark, pcbActual, grbit) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetUpdate2", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvBookmark, "uint", cbBookmark, pcbActualMarshal, pcbActual, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetEscrowUpdate Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} columnid 
 * @param {Integer} pv 
 * @param {Integer} cbMax 
 * @param {Integer} pvOld 
 * @param {Integer} cbOldMax 
 * @param {Pointer<Integer>} pcbOldActual 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetescrowupdate-function
 */
export JetEscrowUpdate(sesid, tableid, columnid, pv, cbMax, pvOld, cbOldMax, pcbOldActual, grbit) {
    pcbOldActualMarshal := pcbOldActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetEscrowUpdate", JET_SESID, sesid, JET_TABLEID, tableid, "uint", columnid, "ptr", pv, "uint", cbMax, "ptr", pvOld, "uint", cbOldMax, pcbOldActualMarshal, pcbOldActual, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetRetrieveColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} columnid 
 * @param {Integer} pvData 
 * @param {Integer} cbData 
 * @param {Pointer<Integer>} pcbActual 
 * @param {Integer} grbit 
 * @param {Pointer<JET_RETINFO>} pretinfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievecolumn-function
 */
export JetRetrieveColumn(sesid, tableid, columnid, pvData, cbData, pcbActual, grbit, pretinfo) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetRetrieveColumn", JET_SESID, sesid, JET_TABLEID, tableid, "uint", columnid, "ptr", pvData, "uint", cbData, pcbActualMarshal, pcbActual, "uint", grbit, JET_RETINFO.Ptr, pretinfo, Int32)
    return result
}

/**
 * Learn more about: JetRetrieveColumns Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_RETRIEVECOLUMN>} pretrievecolumn 
 * @param {Integer} cretrievecolumn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievecolumns-function
 */
export JetRetrieveColumns(sesid, tableid, pretrievecolumn, cretrievecolumn) {
    result := DllCall("ESENT.dll\JetRetrieveColumns", JET_SESID, sesid, JET_TABLEID, tableid, JET_RETRIEVECOLUMN.Ptr, pretrievecolumn, "uint", cretrievecolumn, Int32)
    return result
}

/**
 * Describes the JetEnumerateColumns function and provides the function's parameters, return value, remarks, and requirements.
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} cEnumColumnId 
 * @param {Pointer<JET_ENUMCOLUMNID>} rgEnumColumnId 
 * @param {Pointer<Integer>} pcEnumColumn 
 * @param {Pointer<Pointer<JET_ENUMCOLUMN>>} prgEnumColumn 
 * @param {Pointer<JET_PFNREALLOC>} pfnRealloc 
 * @param {Pointer<Void>} pvReallocContext 
 * @param {Integer} cbDataMost 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetenumeratecolumns-function
 */
export JetEnumerateColumns(sesid, tableid, cEnumColumnId, rgEnumColumnId, pcEnumColumn, prgEnumColumn, pfnRealloc, pvReallocContext, cbDataMost, grbit) {
    pcEnumColumnMarshal := pcEnumColumn is VarRef ? "uint*" : "ptr"
    prgEnumColumnMarshal := prgEnumColumn is VarRef ? "ptr*" : "ptr"
    pvReallocContextMarshal := pvReallocContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ESENT.dll\JetEnumerateColumns", JET_SESID, sesid, JET_TABLEID, tableid, "uint", cEnumColumnId, JET_ENUMCOLUMNID.Ptr, rgEnumColumnId, pcEnumColumnMarshal, pcEnumColumn, prgEnumColumnMarshal, prgEnumColumn, "ptr", pfnRealloc, pvReallocContextMarshal, pvReallocContext, "uint", cbDataMost, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetRecordSize Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_RECSIZE>} precsize 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordsize-function
 */
export JetGetRecordSize(sesid, tableid, precsize, grbit) {
    result := DllCall("ESENT.dll\JetGetRecordSize", JET_SESID, sesid, JET_TABLEID, tableid, JET_RECSIZE.Ptr, precsize, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetRecordSize2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_RECSIZE2>} precsize 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordsize2-function
 */
export JetGetRecordSize2(sesid, tableid, precsize, grbit) {
    result := DllCall("ESENT.dll\JetGetRecordSize2", JET_SESID, sesid, JET_TABLEID, tableid, JET_RECSIZE2.Ptr, precsize, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetColumn Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} columnid 
 * @param {Integer} pvData 
 * @param {Integer} cbData 
 * @param {Integer} grbit 
 * @param {Pointer<JET_SETINFO>} psetinfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcolumn-function
 */
export JetSetColumn(sesid, tableid, columnid, pvData, cbData, grbit, psetinfo) {
    result := DllCall("ESENT.dll\JetSetColumn", JET_SESID, sesid, JET_TABLEID, tableid, "uint", columnid, "ptr", pvData, "uint", cbData, "uint", grbit, JET_SETINFO.Ptr, psetinfo, Int32)
    return result
}

/**
 * Learn more about: JetSetColumns Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_SETCOLUMN>} psetcolumn 
 * @param {Integer} csetcolumn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcolumns-function
 */
export JetSetColumns(sesid, tableid, psetcolumn, csetcolumn) {
    result := DllCall("ESENT.dll\JetSetColumns", JET_SESID, sesid, JET_TABLEID, tableid, JET_SETCOLUMN.Ptr, psetcolumn, "uint", csetcolumn, Int32)
    return result
}

/**
 * Learn more about: JetPrepareUpdate Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} prep 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprepareupdate-function
 */
export JetPrepareUpdate(sesid, tableid, prep) {
    result := DllCall("ESENT.dll\JetPrepareUpdate", JET_SESID, sesid, JET_TABLEID, tableid, "uint", prep, Int32)
    return result
}

/**
 * Learn more about: JetGetRecordPosition Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} precpos 
 * @param {Integer} cbRecpos 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetrecordposition-function
 */
export JetGetRecordPosition(sesid, tableid, precpos, cbRecpos) {
    result := DllCall("ESENT.dll\JetGetRecordPosition", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", precpos, "uint", cbRecpos, Int32)
    return result
}

/**
 * Learn more about: JetGotoPosition Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_RECPOS>} precpos 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotoposition-function
 */
export JetGotoPosition(sesid, tableid, precpos) {
    result := DllCall("ESENT.dll\JetGotoPosition", JET_SESID, sesid, JET_TABLEID, tableid, JET_RECPOS.Ptr, precpos, Int32)
    return result
}

/**
 * Learn more about: JetGetCursorInfo Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcursorinfo-function
 */
export JetGetCursorInfo(sesid, tableid, pvResult, cbMax, InfoLevel) {
    result := DllCall("ESENT.dll\JetGetCursorInfo", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, Int32)
    return result
}

/**
 * Learn more about: JetDupCursor Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdupcursor-function
 */
export JetDupCursor(sesid, tableid, ptableid, grbit) {
    result := DllCall("ESENT.dll\JetDupCursor", JET_SESID, sesid, JET_TABLEID, tableid, JET_TABLEID.Ptr, ptableid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetCurrentIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} szIndexName 
 * @param {Integer} cbIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcurrentindex-function
 */
export JetGetCurrentIndexA(sesid, tableid, szIndexName, cbIndexName) {
    result := DllCall("ESENT.dll\JetGetCurrentIndexA", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", szIndexName, "uint", cbIndexName, Int32)
    return result
}

/**
 * Learn more about: JetGetCurrentIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} szIndexName 
 * @param {Integer} cbIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetcurrentindex-function
 */
export JetGetCurrentIndexW(sesid, tableid, szIndexName, cbIndexName) {
    result := DllCall("ESENT.dll\JetGetCurrentIndexW", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", szIndexName, "uint", cbIndexName, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex-function
 */
export JetSetCurrentIndexA(sesid, tableid, szIndexName) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndexA", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex-function
 */
export JetSetCurrentIndexW(sesid, tableid, szIndexName) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndexW", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex2-function
 */
export JetSetCurrentIndex2A(sesid, tableid, szIndexName, grbit) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex2A", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex2 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex2-function
 */
export JetSetCurrentIndex2W(sesid, tableid, szIndexName, grbit) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex2W", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @param {Integer} itagSequence 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex3-function
 */
export JetSetCurrentIndex3A(sesid, tableid, szIndexName, grbit, itagSequence) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex3A", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, "uint", itagSequence, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex3 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Integer} grbit 
 * @param {Integer} itagSequence 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex3-function
 */
export JetSetCurrentIndex3W(sesid, tableid, szIndexName, grbit, itagSequence) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex3W", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, "uint", grbit, "uint", itagSequence, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex4 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Pointer<JET_INDEXID>} pindexid 
 * @param {Integer} grbit 
 * @param {Integer} itagSequence 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex4-function
 */
export JetSetCurrentIndex4A(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
    szIndexNameMarshal := szIndexName is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex4A", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, JET_INDEXID.Ptr, pindexid, "uint", grbit, "uint", itagSequence, Int32)
    return result
}

/**
 * Learn more about: JetSetCurrentIndex4 Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} szIndexName 
 * @param {Pointer<JET_INDEXID>} pindexid 
 * @param {Integer} grbit 
 * @param {Integer} itagSequence 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcurrentindex4-function
 */
export JetSetCurrentIndex4W(sesid, tableid, szIndexName, pindexid, grbit, itagSequence) {
    szIndexNameMarshal := szIndexName is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetSetCurrentIndex4W", JET_SESID, sesid, JET_TABLEID, tableid, szIndexNameMarshal, szIndexName, JET_INDEXID.Ptr, pindexid, "uint", grbit, "uint", itagSequence, Int32)
    return result
}

/**
 * Learn more about: JetMove Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} cRow 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetmove-function
 */
export JetMove(sesid, tableid, cRow, grbit) {
    result := DllCall("ESENT.dll\JetMove", JET_SESID, sesid, JET_TABLEID, tableid, "int", cRow, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetCursorFilter Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEX_COLUMN>} rgColumnFilters 
 * @param {Integer} cColumnFilters 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetcursorfilter-function
 */
export JetSetCursorFilter(sesid, tableid, rgColumnFilters, cColumnFilters, grbit) {
    result := DllCall("ESENT.dll\JetSetCursorFilter", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEX_COLUMN.Ptr, rgColumnFilters, "uint", cColumnFilters, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetLock Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetlock-function
 */
export JetGetLock(sesid, tableid, grbit) {
    result := DllCall("ESENT.dll\JetGetLock", JET_SESID, sesid, JET_TABLEID, tableid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetMakeKey Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvData 
 * @param {Integer} cbData 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetmakekey-function
 */
export JetMakeKey(sesid, tableid, pvData, cbData, grbit) {
    result := DllCall("ESENT.dll\JetMakeKey", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvData, "uint", cbData, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSeek Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetseek-function
 */
export JetSeek(sesid, tableid, grbit) {
    result := DllCall("ESENT.dll\JetSeek", JET_SESID, sesid, JET_TABLEID, tableid, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetPrereadKeys Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Pointer<Void>>} rgpvKeys 
 * @param {Pointer<Integer>} rgcbKeys 
 * @param {Integer} ckeys 
 * @param {Pointer<Integer>} pckeysPreread 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprereadkeys-function
 */
export JetPrereadKeys(sesid, tableid, rgpvKeys, rgcbKeys, ckeys, pckeysPreread, grbit) {
    rgpvKeysMarshal := rgpvKeys is VarRef ? "ptr*" : "ptr"
    rgcbKeysMarshal := rgcbKeys is VarRef ? "uint*" : "ptr"
    pckeysPrereadMarshal := pckeysPreread is VarRef ? "int*" : "ptr"

    result := DllCall("ESENT.dll\JetPrereadKeys", JET_SESID, sesid, JET_TABLEID, tableid, rgpvKeysMarshal, rgpvKeys, rgcbKeysMarshal, rgcbKeys, "int", ckeys, pckeysPrereadMarshal, pckeysPreread, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetPrereadIndexRanges Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_INDEX_RANGE>} rgIndexRanges 
 * @param {Integer} cIndexRanges 
 * @param {Pointer<Integer>} pcRangesPreread 
 * @param {Pointer<Integer>} rgcolumnidPreread 
 * @param {Integer} ccolumnidPreread 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetprereadindexranges-function
 */
export JetPrereadIndexRanges(sesid, tableid, rgIndexRanges, cIndexRanges, pcRangesPreread, rgcolumnidPreread, ccolumnidPreread, grbit) {
    pcRangesPrereadMarshal := pcRangesPreread is VarRef ? "uint*" : "ptr"
    rgcolumnidPrereadMarshal := rgcolumnidPreread is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetPrereadIndexRanges", JET_SESID, sesid, JET_TABLEID, tableid, JET_INDEX_RANGE.Ptr, rgIndexRanges, "uint", cIndexRanges, pcRangesPrereadMarshal, pcRangesPreread, rgcolumnidPrereadMarshal, rgcolumnidPreread, "uint", ccolumnidPreread, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetBookmark Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvBookmark 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetbookmark-function
 */
export JetGetBookmark(sesid, tableid, pvBookmark, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetBookmark", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvBookmark, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetSecondaryIndexBookmark Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvSecondaryKey 
 * @param {Integer} cbSecondaryKeyMax 
 * @param {Pointer<Integer>} pcbSecondaryKeyActual 
 * @param {Integer} pvPrimaryBookmark 
 * @param {Integer} cbPrimaryBookmarkMax 
 * @param {Pointer<Integer>} pcbPrimaryBookmarkActual 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsecondaryindexbookmark-function
 */
export JetGetSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKeyMax, pcbSecondaryKeyActual, pvPrimaryBookmark, cbPrimaryBookmarkMax, pcbPrimaryBookmarkActual, grbit) {
    pcbSecondaryKeyActualMarshal := pcbSecondaryKeyActual is VarRef ? "uint*" : "ptr"
    pcbPrimaryBookmarkActualMarshal := pcbPrimaryBookmarkActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetSecondaryIndexBookmark", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKeyMax, pcbSecondaryKeyActualMarshal, pcbSecondaryKeyActual, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmarkMax, pcbPrimaryBookmarkActualMarshal, pcbPrimaryBookmarkActual, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCompact Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseSrc 
 * @param {Pointer<Integer>} szDatabaseDest 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @param {Pointer<JET_CONVERT_A>} pconvert 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcompact-function
 */
export JetCompactA(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
    szDatabaseSrcMarshal := szDatabaseSrc is VarRef ? "char*" : "ptr"
    szDatabaseDestMarshal := szDatabaseDest is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetCompactA", JET_SESID, sesid, szDatabaseSrcMarshal, szDatabaseSrc, szDatabaseDestMarshal, szDatabaseDest, "ptr", pfnStatus, JET_CONVERT_A.Ptr, pconvert, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetCompact Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseSrc 
 * @param {Pointer<Integer>} szDatabaseDest 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @param {Pointer<JET_CONVERT_W>} pconvert 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcompact-function
 */
export JetCompactW(sesid, szDatabaseSrc, szDatabaseDest, pfnStatus, pconvert, grbit) {
    szDatabaseSrcMarshal := szDatabaseSrc is VarRef ? "ushort*" : "ptr"
    szDatabaseDestMarshal := szDatabaseDest is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetCompactW", JET_SESID, sesid, szDatabaseSrcMarshal, szDatabaseSrc, szDatabaseDestMarshal, szDatabaseDest, "ptr", pfnStatus, JET_CONVERT_W.Ptr, pconvert, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDefragment Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment-function
 */
export JetDefragmentA(sesid, _dbid, szTableName, pcPasses, pcSeconds, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetDefragmentA", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDefragment Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment-function
 */
export JetDefragmentW(sesid, _dbid, szTableName, pcPasses, pcSeconds, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetDefragmentW", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDefragment2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Pointer<JET_CALLBACK>} callback 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment2-function
 */
export JetDefragment2A(sesid, _dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetDefragment2A", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "ptr", callback, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetDefragment2 Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Pointer<JET_CALLBACK>} callback 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetdefragment2-function
 */
export JetDefragment2W(sesid, _dbid, szTableName, pcPasses, pcSeconds, callback, grbit) {
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetDefragment2W", JET_SESID, sesid, "uint", _dbid, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "ptr", callback, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Pointer<JET_CALLBACK>} callback 
 * @param {Pointer<Void>} pvContext 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetDefragment3A(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "char*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "char*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"
    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ESENT.dll\JetDefragment3A", JET_SESID, sesid, szDatabaseNameMarshal, szDatabaseName, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "ptr", callback, pvContextMarshal, pvContext, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Pointer<Integer>} szTableName 
 * @param {Pointer<Integer>} pcPasses 
 * @param {Pointer<Integer>} pcSeconds 
 * @param {Pointer<JET_CALLBACK>} callback 
 * @param {Pointer<Void>} pvContext 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetDefragment3W(sesid, szDatabaseName, szTableName, pcPasses, pcSeconds, callback, pvContext, grbit) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "ushort*" : "ptr"
    szTableNameMarshal := szTableName is VarRef ? "ushort*" : "ptr"
    pcPassesMarshal := pcPasses is VarRef ? "uint*" : "ptr"
    pcSecondsMarshal := pcSeconds is VarRef ? "uint*" : "ptr"
    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ESENT.dll\JetDefragment3W", JET_SESID, sesid, szDatabaseNameMarshal, szDatabaseName, szTableNameMarshal, szTableName, pcPassesMarshal, pcPasses, pcSecondsMarshal, pcSeconds, "ptr", callback, pvContextMarshal, pvContext, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetDatabaseSize Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Integer} cpg 
 * @param {Pointer<Integer>} pcpgReal 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetdatabasesize-function
 */
export JetSetDatabaseSizeA(sesid, szDatabaseName, cpg, pcpgReal) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "char*" : "ptr"
    pcpgRealMarshal := pcpgReal is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetSetDatabaseSizeA", JET_SESID, sesid, szDatabaseNameMarshal, szDatabaseName, "uint", cpg, pcpgRealMarshal, pcpgReal, Int32)
    return result
}

/**
 * Learn more about: JetSetDatabaseSize Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<Integer>} szDatabaseName 
 * @param {Integer} cpg 
 * @param {Pointer<Integer>} pcpgReal 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetdatabasesize-function
 */
export JetSetDatabaseSizeW(sesid, szDatabaseName, cpg, pcpgReal) {
    szDatabaseNameMarshal := szDatabaseName is VarRef ? "ushort*" : "ptr"
    pcpgRealMarshal := pcpgReal is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetSetDatabaseSizeW", JET_SESID, sesid, szDatabaseNameMarshal, szDatabaseName, "uint", cpg, pcpgRealMarshal, pcpgReal, Int32)
    return result
}

/**
 * Learn more about: JetGrowDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} cpg 
 * @param {Pointer<Integer>} pcpgReal 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgrowdatabase-function
 */
export JetGrowDatabase(sesid, _dbid, cpg, pcpgReal) {
    pcpgRealMarshal := pcpgReal is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGrowDatabase", JET_SESID, sesid, "uint", _dbid, "uint", cpg, pcpgRealMarshal, pcpgReal, Int32)
    return result
}

/**
 * Learn more about: JetResizeDatabase Function
 * @param {JET_SESID} sesid 
 * @param {Integer} _dbid 
 * @param {Integer} cpgTarget 
 * @param {Pointer<Integer>} pcpgActual 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresizedatabase-function
 */
export JetResizeDatabase(sesid, _dbid, cpgTarget, pcpgActual, grbit) {
    pcpgActualMarshal := pcpgActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetResizeDatabase", JET_SESID, sesid, "uint", _dbid, "uint", cpgTarget, pcpgActualMarshal, pcpgActual, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetSessionContext Function
 * @param {JET_SESID} sesid 
 * @param {JET_API_PTR} ulContext 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsessioncontext-function
 */
export JetSetSessionContext(sesid, ulContext) {
    result := DllCall("ESENT.dll\JetSetSessionContext", JET_SESID, sesid, JET_API_PTR, ulContext, Int32)
    return result
}

/**
 * Learn more about: JetResetSessionContext Function
 * @param {JET_SESID} sesid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetresetsessioncontext-function
 */
export JetResetSessionContext(sesid) {
    result := DllCall("ESENT.dll\JetResetSessionContext", JET_SESID, sesid, Int32)
    return result
}

/**
 * Learn more about: JetGotoBookmark Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvBookmark 
 * @param {Integer} cbBookmark 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotobookmark-function
 */
export JetGotoBookmark(sesid, tableid, pvBookmark, cbBookmark) {
    result := DllCall("ESENT.dll\JetGotoBookmark", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvBookmark, "uint", cbBookmark, Int32)
    return result
}

/**
 * Learn more about: JetGotoSecondaryIndexBookmark Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvSecondaryKey 
 * @param {Integer} cbSecondaryKey 
 * @param {Integer} pvPrimaryBookmark 
 * @param {Integer} cbPrimaryBookmark 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgotosecondaryindexbookmark-function
 */
export JetGotoSecondaryIndexBookmark(sesid, tableid, pvSecondaryKey, cbSecondaryKey, pvPrimaryBookmark, cbPrimaryBookmark, grbit) {
    result := DllCall("ESENT.dll\JetGotoSecondaryIndexBookmark", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvSecondaryKey, "uint", cbSecondaryKey, "ptr", pvPrimaryBookmark, "uint", cbPrimaryBookmark, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetIntersectIndexes Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_INDEXRANGE>} rgindexrange 
 * @param {Integer} cindexrange 
 * @param {Pointer<JET_RECORDLIST>} precordlist 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetintersectindexes-function
 */
export JetIntersectIndexes(sesid, rgindexrange, cindexrange, precordlist, grbit) {
    result := DllCall("ESENT.dll\JetIntersectIndexes", JET_SESID, sesid, JET_INDEXRANGE.Ptr, rgindexrange, "uint", cindexrange, JET_RECORDLIST.Ptr, precordlist, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetComputeStats Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetcomputestats-function
 */
export JetComputeStats(sesid, tableid) {
    result := DllCall("ESENT.dll\JetComputeStats", JET_SESID, sesid, JET_TABLEID, tableid, Int32)
    return result
}

/**
 * Learn more about: JetOpenTempTable Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
 * @param {Integer} ccolumn 
 * @param {Integer} grbit 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @param {Pointer<Integer>} prgcolumnid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable-function
 */
export JetOpenTempTable(sesid, prgcolumndef, ccolumn, grbit, ptableid, prgcolumnid) {
    prgcolumnidMarshal := prgcolumnid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenTempTable", JET_SESID, sesid, JET_COLUMNDEF.Ptr, prgcolumndef, "uint", ccolumn, "uint", grbit, JET_TABLEID.Ptr, ptableid, prgcolumnidMarshal, prgcolumnid, Int32)
    return result
}

/**
 * Learn more about: JetOpenTempTable2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
 * @param {Integer} ccolumn 
 * @param {Integer} lcid 
 * @param {Integer} grbit 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @param {Pointer<Integer>} prgcolumnid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable2-function
 */
export JetOpenTempTable2(sesid, prgcolumndef, ccolumn, lcid, grbit, ptableid, prgcolumnid) {
    prgcolumnidMarshal := prgcolumnid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenTempTable2", JET_SESID, sesid, JET_COLUMNDEF.Ptr, prgcolumndef, "uint", ccolumn, "uint", lcid, "uint", grbit, JET_TABLEID.Ptr, ptableid, prgcolumnidMarshal, prgcolumnid, Int32)
    return result
}

/**
 * Learn more about: JetOpenTempTable3 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_COLUMNDEF>} prgcolumndef 
 * @param {Integer} ccolumn 
 * @param {Pointer<JET_UNICODEINDEX>} pidxunicode 
 * @param {Integer} grbit 
 * @param {Pointer<JET_TABLEID>} ptableid 
 * @param {Pointer<Integer>} prgcolumnid 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemptable3-function
 */
export JetOpenTempTable3(sesid, prgcolumndef, ccolumn, pidxunicode, grbit, ptableid, prgcolumnid) {
    prgcolumnidMarshal := prgcolumnid is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenTempTable3", JET_SESID, sesid, JET_COLUMNDEF.Ptr, prgcolumndef, "uint", ccolumn, JET_UNICODEINDEX.Ptr, pidxunicode, "uint", grbit, JET_TABLEID.Ptr, ptableid, prgcolumnidMarshal, prgcolumnid, Int32)
    return result
}

/**
 * Learn more about: JetOpenTemporaryTable Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_OPENTEMPORARYTABLE>} popentemporarytable 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemporarytable-function
 */
export JetOpenTemporaryTable(sesid, popentemporarytable) {
    result := DllCall("ESENT.dll\JetOpenTemporaryTable", JET_SESID, sesid, JET_OPENTEMPORARYTABLE.Ptr, popentemporarytable, Int32)
    return result
}

/**
 * Learn more about: JetOpenTemporaryTable2 Function
 * @param {JET_SESID} sesid 
 * @param {Pointer<JET_OPENTEMPORARYTABLE2>} popentemporarytable 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopentemporarytable2-function
 */
export JetOpenTemporaryTable2(sesid, popentemporarytable) {
    result := DllCall("ESENT.dll\JetOpenTemporaryTable2", JET_SESID, sesid, JET_OPENTEMPORARYTABLE2.Ptr, popentemporarytable, Int32)
    return result
}

/**
 * Learn more about: JetBackup Function
 * @param {Pointer<Integer>} szBackupPath 
 * @param {Integer} grbit 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackup-function
 */
export JetBackupA(szBackupPath, grbit, pfnStatus) {
    szBackupPathMarshal := szBackupPath is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetBackupA", szBackupPathMarshal, szBackupPath, "uint", grbit, "ptr", pfnStatus, Int32)
    return result
}

/**
 * Learn more about: JetBackup Function
 * @param {Pointer<Integer>} szBackupPath 
 * @param {Integer} grbit 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackup-function
 */
export JetBackupW(szBackupPath, grbit, pfnStatus) {
    szBackupPathMarshal := szBackupPath is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetBackupW", szBackupPathMarshal, szBackupPath, "uint", grbit, "ptr", pfnStatus, Int32)
    return result
}

/**
 * Learn more about: JetBackupInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} szBackupPath 
 * @param {Integer} grbit 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackupinstance-function
 */
export JetBackupInstanceA(instance, szBackupPath, grbit, pfnStatus) {
    szBackupPathMarshal := szBackupPath is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetBackupInstanceA", JET_INSTANCE, instance, szBackupPathMarshal, szBackupPath, "uint", grbit, "ptr", pfnStatus, Int32)
    return result
}

/**
 * Learn more about: JetBackupInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} szBackupPath 
 * @param {Integer} grbit 
 * @param {Pointer<JET_PFNSTATUS>} pfnStatus 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbackupinstance-function
 */
export JetBackupInstanceW(instance, szBackupPath, grbit, pfnStatus) {
    szBackupPathMarshal := szBackupPath is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetBackupInstanceW", JET_INSTANCE, instance, szBackupPathMarshal, szBackupPath, "uint", grbit, "ptr", pfnStatus, Int32)
    return result
}

/**
 * Learn more about: JetRestore Function
 * @param {Pointer<Integer>} szSource 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore-function
 */
export JetRestoreA(szSource, _pfn) {
    szSourceMarshal := szSource is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetRestoreA", szSourceMarshal, szSource, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRestore Function
 * @param {Pointer<Integer>} szSource 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore-function
 */
export JetRestoreW(szSource, _pfn) {
    szSourceMarshal := szSource is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetRestoreW", szSourceMarshal, szSource, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRestore2 Function
 * @param {Pointer<Integer>} sz 
 * @param {Pointer<Integer>} szDest 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore2-function
 */
export JetRestore2A(sz, szDest, _pfn) {
    szMarshal := sz is VarRef ? "char*" : "ptr"
    szDestMarshal := szDest is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetRestore2A", szMarshal, sz, szDestMarshal, szDest, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRestore2 Function
 * @param {Pointer<Integer>} sz 
 * @param {Pointer<Integer>} szDest 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestore2-function
 */
export JetRestore2W(sz, szDest, _pfn) {
    szMarshal := sz is VarRef ? "ushort*" : "ptr"
    szDestMarshal := szDest is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetRestore2W", szMarshal, sz, szDestMarshal, szDest, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRestoreInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} sz 
 * @param {Pointer<Integer>} szDest 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestoreinstance-function
 */
export JetRestoreInstanceA(instance, sz, szDest, _pfn) {
    szMarshal := sz is VarRef ? "char*" : "ptr"
    szDestMarshal := szDest is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetRestoreInstanceA", JET_INSTANCE, instance, szMarshal, sz, szDestMarshal, szDest, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRestoreInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} sz 
 * @param {Pointer<Integer>} szDest 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetrestoreinstance-function
 */
export JetRestoreInstanceW(instance, sz, szDest, _pfn) {
    szMarshal := sz is VarRef ? "ushort*" : "ptr"
    szDestMarshal := szDest is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetRestoreInstanceW", JET_INSTANCE, instance, szMarshal, sz, szDestMarshal, szDest, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetSetIndexRange Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableidSrc 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetindexrange-function
 */
export JetSetIndexRange(sesid, tableidSrc, grbit) {
    result := DllCall("ESENT.dll\JetSetIndexRange", JET_SESID, sesid, JET_TABLEID, tableidSrc, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetIndexRecordCount Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<Integer>} pcrec 
 * @param {Integer} crecMax 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetindexrecordcount-function
 */
export JetIndexRecordCount(sesid, tableid, pcrec, crecMax) {
    pcrecMarshal := pcrec is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetIndexRecordCount", JET_SESID, sesid, JET_TABLEID, tableid, pcrecMarshal, pcrec, "uint", crecMax, Int32)
    return result
}

/**
 * Learn more about: JetRetrieveKey Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} pvKey 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetretrievekey-function
 */
export JetRetrieveKey(sesid, tableid, pvKey, cbMax, pcbActual, grbit) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetRetrieveKey", JET_SESID, sesid, JET_TABLEID, tableid, "ptr", pvKey, "uint", cbMax, pcbActualMarshal, pcbActual, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetBeginExternalBackup Function
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginexternalbackup-function
 */
export JetBeginExternalBackup(grbit) {
    result := DllCall("ESENT.dll\JetBeginExternalBackup", "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetBeginExternalBackupInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetbeginexternalbackupinstance-function
 */
export JetBeginExternalBackupInstance(instance, grbit) {
    result := DllCall("ESENT.dll\JetBeginExternalBackupInstance", JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetAttachInfo Function
 * @param {Integer} szzDatabases 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfo-function
 */
export JetGetAttachInfoA(szzDatabases, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetAttachInfoA", "ptr", szzDatabases, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetAttachInfo Function
 * @param {Integer} wszzDatabases 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfo-function
 */
export JetGetAttachInfoW(wszzDatabases, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetAttachInfoW", "ptr", wszzDatabases, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetAttachInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} szzDatabases 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfoinstance-function
 */
export JetGetAttachInfoInstanceA(instance, szzDatabases, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetAttachInfoInstanceA", JET_INSTANCE, instance, "ptr", szzDatabases, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetAttachInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} szzDatabases 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetattachinfoinstance-function
 */
export JetGetAttachInfoInstanceW(instance, szzDatabases, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetAttachInfoInstanceW", JET_INSTANCE, instance, "ptr", szzDatabases, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetOpenFile Function
 * @param {Pointer<Integer>} szFileName 
 * @param {Pointer<JET_HANDLE>} phfFile 
 * @param {Pointer<Integer>} pulFileSizeLow 
 * @param {Pointer<Integer>} pulFileSizeHigh 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfile-function
 */
export JetOpenFileA(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
    szFileNameMarshal := szFileName is VarRef ? "char*" : "ptr"
    pulFileSizeLowMarshal := pulFileSizeLow is VarRef ? "uint*" : "ptr"
    pulFileSizeHighMarshal := pulFileSizeHigh is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenFileA", szFileNameMarshal, szFileName, JET_HANDLE.Ptr, phfFile, pulFileSizeLowMarshal, pulFileSizeLow, pulFileSizeHighMarshal, pulFileSizeHigh, Int32)
    return result
}

/**
 * Learn more about: JetOpenFile Function
 * @param {Pointer<Integer>} szFileName 
 * @param {Pointer<JET_HANDLE>} phfFile 
 * @param {Pointer<Integer>} pulFileSizeLow 
 * @param {Pointer<Integer>} pulFileSizeHigh 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfile-function
 */
export JetOpenFileW(szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
    szFileNameMarshal := szFileName is VarRef ? "ushort*" : "ptr"
    pulFileSizeLowMarshal := pulFileSizeLow is VarRef ? "uint*" : "ptr"
    pulFileSizeHighMarshal := pulFileSizeHigh is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenFileW", szFileNameMarshal, szFileName, JET_HANDLE.Ptr, phfFile, pulFileSizeLowMarshal, pulFileSizeLow, pulFileSizeHighMarshal, pulFileSizeHigh, Int32)
    return result
}

/**
 * Learn more about: JetOpenFileInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} szFileName 
 * @param {Pointer<JET_HANDLE>} phfFile 
 * @param {Pointer<Integer>} pulFileSizeLow 
 * @param {Pointer<Integer>} pulFileSizeHigh 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfileinstance-function
 */
export JetOpenFileInstanceA(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
    szFileNameMarshal := szFileName is VarRef ? "char*" : "ptr"
    pulFileSizeLowMarshal := pulFileSizeLow is VarRef ? "uint*" : "ptr"
    pulFileSizeHighMarshal := pulFileSizeHigh is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenFileInstanceA", JET_INSTANCE, instance, szFileNameMarshal, szFileName, JET_HANDLE.Ptr, phfFile, pulFileSizeLowMarshal, pulFileSizeLow, pulFileSizeHighMarshal, pulFileSizeHigh, Int32)
    return result
}

/**
 * Learn more about: JetOpenFileInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Pointer<Integer>} szFileName 
 * @param {Pointer<JET_HANDLE>} phfFile 
 * @param {Pointer<Integer>} pulFileSizeLow 
 * @param {Pointer<Integer>} pulFileSizeHigh 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetopenfileinstance-function
 */
export JetOpenFileInstanceW(instance, szFileName, phfFile, pulFileSizeLow, pulFileSizeHigh) {
    szFileNameMarshal := szFileName is VarRef ? "ushort*" : "ptr"
    pulFileSizeLowMarshal := pulFileSizeLow is VarRef ? "uint*" : "ptr"
    pulFileSizeHighMarshal := pulFileSizeHigh is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetOpenFileInstanceW", JET_INSTANCE, instance, szFileNameMarshal, szFileName, JET_HANDLE.Ptr, phfFile, pulFileSizeLowMarshal, pulFileSizeLow, pulFileSizeHighMarshal, pulFileSizeHigh, Int32)
    return result
}

/**
 * Learn more about: JetReadFile Function
 * @param {JET_HANDLE} hfFile 
 * @param {Integer} pv 
 * @param {Integer} cb 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetreadfile-function
 */
export JetReadFile(hfFile, pv, cb, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetReadFile", JET_HANDLE, hfFile, "ptr", pv, "uint", cb, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetReadFileInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {JET_HANDLE} hfFile 
 * @param {Integer} pv 
 * @param {Integer} cb 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetreadfileinstance-function
 */
export JetReadFileInstance(instance, hfFile, pv, cb, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetReadFileInstance", JET_INSTANCE, instance, JET_HANDLE, hfFile, "ptr", pv, "uint", cb, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetCloseFile Function
 * @param {JET_HANDLE} hfFile 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosefile-function
 */
export JetCloseFile(hfFile) {
    result := DllCall("ESENT.dll\JetCloseFile", JET_HANDLE, hfFile, Int32)
    return result
}

/**
 * Learn more about: JetCloseFileInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {JET_HANDLE} hfFile 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetclosefileinstance-function
 */
export JetCloseFileInstance(instance, hfFile) {
    result := DllCall("ESENT.dll\JetCloseFileInstance", JET_INSTANCE, instance, JET_HANDLE, hfFile, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfo Function
 * @param {Integer} szzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfo-function
 */
export JetGetLogInfoA(szzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoA", "ptr", szzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfo Function
 * @param {Integer} szzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfo-function
 */
export JetGetLogInfoW(szzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoW", "ptr", szzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} szzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance-function
 */
export JetGetLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoInstanceA", JET_INSTANCE, instance, "ptr", szzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} wszzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance-function
 */
export JetGetLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoInstanceW", JET_INSTANCE, instance, "ptr", wszzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfoInstance2 Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} szzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @param {Pointer<JET_LOGINFO_A>} pLogInfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance2-function
 */
export JetGetLogInfoInstance2A(instance, szzLogs, cbMax, pcbActual, pLogInfo) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoInstance2A", JET_INSTANCE, instance, "ptr", szzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, JET_LOGINFO_A.Ptr, pLogInfo, Int32)
    return result
}

/**
 * Learn more about: JetGetLogInfoInstance2 Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} wszzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @param {Pointer<JET_LOGINFO_W>} pLogInfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetloginfoinstance2-function
 */
export JetGetLogInfoInstance2W(instance, wszzLogs, cbMax, pcbActual, pLogInfo) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetLogInfoInstance2W", JET_INSTANCE, instance, "ptr", wszzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, JET_LOGINFO_W.Ptr, pLogInfo, Int32)
    return result
}

/**
 * Learn more about: JetGetTruncateLogInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} szzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettruncateloginfoinstance-function
 */
export JetGetTruncateLogInfoInstanceA(instance, szzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceA", JET_INSTANCE, instance, "ptr", szzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetGetTruncateLogInfoInstance Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} wszzLogs 
 * @param {Integer} cbMax 
 * @param {Pointer<Integer>} pcbActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgettruncateloginfoinstance-function
 */
export JetGetTruncateLogInfoInstanceW(instance, wszzLogs, cbMax, pcbActual) {
    pcbActualMarshal := pcbActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetTruncateLogInfoInstanceW", JET_INSTANCE, instance, "ptr", wszzLogs, "uint", cbMax, pcbActualMarshal, pcbActual, Int32)
    return result
}

/**
 * Learn more about: JetTruncateLog Function
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jettruncatelog-function
 */
export JetTruncateLog() {
    result := DllCall("ESENT.dll\JetTruncateLog", Int32)
    return result
}

/**
 * Learn more about: JetTruncateLogInstance Function
 * @param {JET_INSTANCE} instance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jettruncateloginstance-function
 */
export JetTruncateLogInstance(instance) {
    result := DllCall("ESENT.dll\JetTruncateLogInstance", JET_INSTANCE, instance, Int32)
    return result
}

/**
 * Learn more about: JetEndExternalBackup Function
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackup-function
 */
export JetEndExternalBackup() {
    result := DllCall("ESENT.dll\JetEndExternalBackup", Int32)
    return result
}

/**
 * Learn more about: JetEndExternalBackupInstance Function
 * @param {JET_INSTANCE} instance 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackupinstance-function
 */
export JetEndExternalBackupInstance(instance) {
    result := DllCall("ESENT.dll\JetEndExternalBackupInstance", JET_INSTANCE, instance, Int32)
    return result
}

/**
 * Learn more about: JetEndExternalBackupInstance2 Function
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetendexternalbackupinstance2-function
 */
export JetEndExternalBackupInstance2(instance, grbit) {
    result := DllCall("ESENT.dll\JetEndExternalBackupInstance2", JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetExternalRestore Function
 * @param {Pointer<Integer>} szCheckpointFilePath 
 * @param {Pointer<Integer>} szLogPath 
 * @param {Pointer<JET_RSTMAP_A>} rgrstmap 
 * @param {Integer} crstfilemap 
 * @param {Pointer<Integer>} szBackupLogPath 
 * @param {Integer} genLow 
 * @param {Integer} genHigh 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore-function
 */
export JetExternalRestoreA(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, _pfn) {
    szCheckpointFilePathMarshal := szCheckpointFilePath is VarRef ? "char*" : "ptr"
    szLogPathMarshal := szLogPath is VarRef ? "char*" : "ptr"
    szBackupLogPathMarshal := szBackupLogPath is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetExternalRestoreA", szCheckpointFilePathMarshal, szCheckpointFilePath, szLogPathMarshal, szLogPath, JET_RSTMAP_A.Ptr, rgrstmap, "int", crstfilemap, szBackupLogPathMarshal, szBackupLogPath, "int", genLow, "int", genHigh, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetExternalRestore Function
 * @param {Pointer<Integer>} szCheckpointFilePath 
 * @param {Pointer<Integer>} szLogPath 
 * @param {Pointer<JET_RSTMAP_W>} rgrstmap 
 * @param {Integer} crstfilemap 
 * @param {Pointer<Integer>} szBackupLogPath 
 * @param {Integer} genLow 
 * @param {Integer} genHigh 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore-function
 */
export JetExternalRestoreW(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, genLow, genHigh, _pfn) {
    szCheckpointFilePathMarshal := szCheckpointFilePath is VarRef ? "ushort*" : "ptr"
    szLogPathMarshal := szLogPath is VarRef ? "ushort*" : "ptr"
    szBackupLogPathMarshal := szBackupLogPath is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetExternalRestoreW", szCheckpointFilePathMarshal, szCheckpointFilePath, szLogPathMarshal, szLogPath, JET_RSTMAP_W.Ptr, rgrstmap, "int", crstfilemap, szBackupLogPathMarshal, szBackupLogPath, "int", genLow, "int", genHigh, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetExternalRestore2 Function
 * @param {Pointer<Integer>} szCheckpointFilePath 
 * @param {Pointer<Integer>} szLogPath 
 * @param {Pointer<JET_RSTMAP_A>} rgrstmap 
 * @param {Integer} crstfilemap 
 * @param {Pointer<Integer>} szBackupLogPath 
 * @param {Pointer<JET_LOGINFO_A>} pLogInfo 
 * @param {Pointer<Integer>} szTargetInstanceName 
 * @param {Pointer<Integer>} szTargetInstanceLogPath 
 * @param {Pointer<Integer>} szTargetInstanceCheckpointPath 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore2-function
 */
export JetExternalRestore2A(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, _pfn) {
    szCheckpointFilePathMarshal := szCheckpointFilePath is VarRef ? "char*" : "ptr"
    szLogPathMarshal := szLogPath is VarRef ? "char*" : "ptr"
    szBackupLogPathMarshal := szBackupLogPath is VarRef ? "char*" : "ptr"
    szTargetInstanceNameMarshal := szTargetInstanceName is VarRef ? "char*" : "ptr"
    szTargetInstanceLogPathMarshal := szTargetInstanceLogPath is VarRef ? "char*" : "ptr"
    szTargetInstanceCheckpointPathMarshal := szTargetInstanceCheckpointPath is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetExternalRestore2A", szCheckpointFilePathMarshal, szCheckpointFilePath, szLogPathMarshal, szLogPath, JET_RSTMAP_A.Ptr, rgrstmap, "int", crstfilemap, szBackupLogPathMarshal, szBackupLogPath, JET_LOGINFO_A.Ptr, pLogInfo, szTargetInstanceNameMarshal, szTargetInstanceName, szTargetInstanceLogPathMarshal, szTargetInstanceLogPath, szTargetInstanceCheckpointPathMarshal, szTargetInstanceCheckpointPath, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetExternalRestore2 Function
 * @param {Pointer<Integer>} szCheckpointFilePath 
 * @param {Pointer<Integer>} szLogPath 
 * @param {Pointer<JET_RSTMAP_W>} rgrstmap 
 * @param {Integer} crstfilemap 
 * @param {Pointer<Integer>} szBackupLogPath 
 * @param {Pointer<JET_LOGINFO_W>} pLogInfo 
 * @param {Pointer<Integer>} szTargetInstanceName 
 * @param {Pointer<Integer>} szTargetInstanceLogPath 
 * @param {Pointer<Integer>} szTargetInstanceCheckpointPath 
 * @param {Pointer<JET_PFNSTATUS>} _pfn 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetexternalrestore2-function
 */
export JetExternalRestore2W(szCheckpointFilePath, szLogPath, rgrstmap, crstfilemap, szBackupLogPath, pLogInfo, szTargetInstanceName, szTargetInstanceLogPath, szTargetInstanceCheckpointPath, _pfn) {
    szCheckpointFilePathMarshal := szCheckpointFilePath is VarRef ? "ushort*" : "ptr"
    szLogPathMarshal := szLogPath is VarRef ? "ushort*" : "ptr"
    szBackupLogPathMarshal := szBackupLogPath is VarRef ? "ushort*" : "ptr"
    szTargetInstanceNameMarshal := szTargetInstanceName is VarRef ? "ushort*" : "ptr"
    szTargetInstanceLogPathMarshal := szTargetInstanceLogPath is VarRef ? "ushort*" : "ptr"
    szTargetInstanceCheckpointPathMarshal := szTargetInstanceCheckpointPath is VarRef ? "ushort*" : "ptr"

    result := DllCall("ESENT.dll\JetExternalRestore2W", szCheckpointFilePathMarshal, szCheckpointFilePath, szLogPathMarshal, szLogPath, JET_RSTMAP_W.Ptr, rgrstmap, "int", crstfilemap, szBackupLogPathMarshal, szBackupLogPath, JET_LOGINFO_W.Ptr, pLogInfo, szTargetInstanceNameMarshal, szTargetInstanceName, szTargetInstanceLogPathMarshal, szTargetInstanceLogPath, szTargetInstanceCheckpointPathMarshal, szTargetInstanceCheckpointPath, "ptr", _pfn, Int32)
    return result
}

/**
 * Learn more about: JetRegisterCallback Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} cbtyp 
 * @param {Pointer<JET_CALLBACK>} pCallback 
 * @param {Pointer<Void>} pvContext 
 * @param {Pointer<JET_HANDLE>} phCallbackId 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetregistercallback-function
 */
export JetRegisterCallback(sesid, tableid, cbtyp, pCallback, pvContext, phCallbackId) {
    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ESENT.dll\JetRegisterCallback", JET_SESID, sesid, JET_TABLEID, tableid, "uint", cbtyp, "ptr", pCallback, pvContextMarshal, pvContext, JET_HANDLE.Ptr, phCallbackId, Int32)
    return result
}

/**
 * Learn more about: JetUnregisterCallback Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Integer} cbtyp 
 * @param {JET_HANDLE} hCallbackId 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetunregistercallback-function
 */
export JetUnregisterCallback(sesid, tableid, cbtyp, hCallbackId) {
    result := DllCall("ESENT.dll\JetUnregisterCallback", JET_SESID, sesid, JET_TABLEID, tableid, "uint", cbtyp, JET_HANDLE, hCallbackId, Int32)
    return result
}

/**
 * Learn more about: JetGetInstanceInfo Function
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_A>>} paInstanceInfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstanceinfo-function
 */
export JetGetInstanceInfoA(pcInstanceInfo, paInstanceInfo) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetGetInstanceInfoA", pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, Int32)
    return result
}

/**
 * Learn more about: JetGetInstanceInfo Function
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_W>>} paInstanceInfo 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetinstanceinfo-function
 */
export JetGetInstanceInfoW(pcInstanceInfo, paInstanceInfo) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetGetInstanceInfoW", pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, Int32)
    return result
}

/**
 * Learn more about: JetFreeBuffer Function
 * @param {Pointer<Integer>} pbBuf 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetfreebuffer-function
 */
export JetFreeBuffer(pbBuf) {
    pbBufMarshal := pbBuf is VarRef ? "char*" : "ptr"

    result := DllCall("ESENT.dll\JetFreeBuffer", pbBufMarshal, pbBuf, Int32)
    return result
}

/**
 * Learn more about: JetSetLS Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {JET_LS} ls 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetls-function
 */
export JetSetLS(sesid, tableid, ls, grbit) {
    result := DllCall("ESENT.dll\JetSetLS", JET_SESID, sesid, JET_TABLEID, tableid, JET_LS, ls, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetLS Function
 * @param {JET_SESID} sesid 
 * @param {JET_TABLEID} tableid 
 * @param {Pointer<JET_LS>} pls 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetls-function
 */
export JetGetLS(sesid, tableid, pls, grbit) {
    result := DllCall("ESENT.dll\JetGetLS", JET_SESID, sesid, JET_TABLEID, tableid, JET_LS.Ptr, pls, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotPrepare Function
 * @param {Pointer<JET_OSSNAPID>} psnapId 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotprepare-function
 */
export JetOSSnapshotPrepare(psnapId, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotPrepare", JET_OSSNAPID.Ptr, psnapId, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotPrepareInstance Function
 * @param {JET_OSSNAPID} snapId 
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotprepareinstance-function
 */
export JetOSSnapshotPrepareInstance(snapId, instance, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotPrepareInstance", JET_OSSNAPID, snapId, JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotFreeze Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_A>>} paInstanceInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotfreeze-function
 */
export JetOSSnapshotFreezeA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetOSSnapshotFreezeA", JET_OSSNAPID, snapId, pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotFreeze Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_W>>} paInstanceInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotfreeze-function
 */
export JetOSSnapshotFreezeW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetOSSnapshotFreezeW", JET_OSSNAPID, snapId, pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotThaw Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotthaw-function
 */
export JetOSSnapshotThaw(snapId, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotThaw", JET_OSSNAPID, snapId, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotAbort Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotabort-function
 */
export JetOSSnapshotAbort(snapId, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotAbort", JET_OSSNAPID, snapId, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotTruncateLog Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshottruncatelog-function
 */
export JetOSSnapshotTruncateLog(snapId, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotTruncateLog", JET_OSSNAPID, snapId, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotTruncateLogInstance Function
 * @param {JET_OSSNAPID} snapId 
 * @param {JET_INSTANCE} instance 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshottruncateloginstance-function
 */
export JetOSSnapshotTruncateLogInstance(snapId, instance, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotTruncateLogInstance", JET_OSSNAPID, snapId, JET_INSTANCE, instance, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotGetFreezeInfo Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_A>>} paInstanceInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotgetfreezeinfo-function
 */
export JetOSSnapshotGetFreezeInfoA(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoA", JET_OSSNAPID, snapId, pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotGetFreezeInfo Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Pointer<Integer>} pcInstanceInfo 
 * @param {Pointer<Pointer<JET_INSTANCE_INFO_W>>} paInstanceInfo 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotgetfreezeinfo-function
 */
export JetOSSnapshotGetFreezeInfoW(snapId, pcInstanceInfo, paInstanceInfo, grbit) {
    pcInstanceInfoMarshal := pcInstanceInfo is VarRef ? "uint*" : "ptr"
    paInstanceInfoMarshal := paInstanceInfo is VarRef ? "ptr*" : "ptr"

    result := DllCall("ESENT.dll\JetOSSnapshotGetFreezeInfoW", JET_OSSNAPID, snapId, pcInstanceInfoMarshal, pcInstanceInfo, paInstanceInfoMarshal, paInstanceInfo, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetOSSnapshotEnd Function
 * @param {JET_OSSNAPID} snapId 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetossnapshotend-function
 */
export JetOSSnapshotEnd(snapId, grbit) {
    result := DllCall("ESENT.dll\JetOSSnapshotEnd", JET_OSSNAPID, snapId, "uint", grbit, Int32)
    return result
}

/**
 * 
 * @param {Integer} grbit 
 * @returns {Integer} 
 */
export JetConfigureProcessForCrashDump(grbit) {
    result := DllCall("ESENT.dll\JetConfigureProcessForCrashDump", "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetGetErrorInfoW Function
 * @param {Pointer<Void>} pvContext 
 * @param {Integer} pvResult 
 * @param {Integer} cbMax 
 * @param {Integer} InfoLevel 
 * @param {Integer} grbit 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgeterrorinfow-function
 */
export JetGetErrorInfoW(pvContext, pvResult, cbMax, InfoLevel, grbit) {
    pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

    result := DllCall("ESENT.dll\JetGetErrorInfoW", pvContextMarshal, pvContext, "ptr", pvResult, "uint", cbMax, "uint", InfoLevel, "uint", grbit, Int32)
    return result
}

/**
 * Learn more about: JetSetSessionParameter Function
 * @param {JET_SESID} sesid 
 * @param {Integer} sesparamid 
 * @param {Integer} pvParam 
 * @param {Integer} cbParam 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetsetsessionparameter-function
 */
export JetSetSessionParameter(sesid, sesparamid, pvParam, cbParam) {
    result := DllCall("ESENT.dll\JetSetSessionParameter", JET_SESID, sesid, "uint", sesparamid, "ptr", pvParam, "uint", cbParam, Int32)
    return result
}

/**
 * Learn more about: JetGetSessionParameter Function
 * @param {JET_SESID} sesid 
 * @param {Integer} sesparamid 
 * @param {Pointer<Void>} pvParam 
 * @param {Integer} cbParamMax 
 * @param {Pointer<Integer>} pcbParamActual 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jetgetsessionparameter-function
 */
export JetGetSessionParameter(sesid, sesparamid, pvParam, cbParamMax, pcbParamActual) {
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"
    pcbParamActualMarshal := pcbParamActual is VarRef ? "uint*" : "ptr"

    result := DllCall("ESENT.dll\JetGetSessionParameter", JET_SESID, sesid, "uint", sesparamid, pvParamMarshal, pvParam, "uint", cbParamMax, pcbParamActualMarshal, pcbParamActual, Int32)
    return result
}

;@endregion Functions
