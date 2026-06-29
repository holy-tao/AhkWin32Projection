#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */

;@region Constants

/**
 * @type {Guid}
 */
export global CATID_ActiveScriptAuthor := Guid("{0aee2a92-bcbb-11d0-8c72-00c04fc2b085}")

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_DEBUGGER_BLOCK := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_DEBUGGER_HALT := 2

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_STEP := 65536

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_NESTED := 131072

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_STEPTYPE_SOURCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_STEPTYPE_BYTECODE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_STEPTYPE_MACHINE := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_STEPTYPE_MASK := 15728640

/**
 * @type {Integer (UInt32)}
 */
export global APPBREAKFLAG_IN_BREAKPOINT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_KEYWORD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_COMMENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_NONSOURCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_OPERATOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_NUMBER := 16

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_STRING := 32

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_FUNCTION_START := 64

/**
 * @type {Integer (UInt32)}
 */
export global TEXT_DOC_ATTR_READONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global TEXT_DOC_ATTR_TYPE_PRIMARY := 2

/**
 * @type {Integer (UInt32)}
 */
export global TEXT_DOC_ATTR_TYPE_WORKER := 4

/**
 * @type {Integer (UInt32)}
 */
export global TEXT_DOC_ATTR_TYPE_SCRIPT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_ISEXPRESSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_RETURNVALUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_NOSIDEEFFECTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_ALLOWBREAKPOINTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_ALLOWERRORREPORT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_EVALUATETOCODECONTEXT := 32

/**
 * @type {Integer (UInt32)}
 */
export global DEBUG_TEXT_ISNONUSERCODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_STATE_RUNNING := 1

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_STATE_SUSPENDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_BLOCKED := 4

/**
 * @type {Integer (UInt32)}
 */
export global THREAD_OUT_OF_CONTEXT := 8

/**
 * @type {Guid}
 */
export global CATID_ActiveScript := Guid("{f0b7a1a1-9847-11cf-8f20-00805f2cd064}")

/**
 * @type {Guid}
 */
export global CATID_ActiveScriptParse := Guid("{f0b7a1a2-9847-11cf-8f20-00805f2cd064}")

/**
 * @type {Guid}
 */
export global CATID_ActiveScriptEncode := Guid("{f0b7a1a3-9847-11cf-8f20-00805f2cd064}")

/**
 * @type {Guid}
 */
export global OID_VBSSIP := Guid("{1629f04e-2799-4db5-8fe5-ace10f17ebab}")

/**
 * @type {Guid}
 */
export global OID_JSSIP := Guid("{06c9e010-38ce-11d4-a2a3-00104bd35090}")

/**
 * @type {Guid}
 */
export global OID_WSFSIP := Guid("{1a610570-38ce-11d4-a2a3-00104bd35090}")

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_ISVISIBLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_ISSOURCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_GLOBALMEMBERS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_ISPERSISTENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_CODEONLY := 512

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTITEM_NOCODE := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTYPELIB_ISCONTROL := 16

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTYPELIB_ISPERSISTENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_DELAYEXECUTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_ISVISIBLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_ISEXPRESSION := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_ISPERSISTENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_HOSTMANAGESSOURCE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_ISXDOMAIN := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTTEXT_ISNONUSERCODE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROC_ISEXPRESSION := 32

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROC_HOSTMANAGESSOURCE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROC_IMPLICIT_THIS := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROC_IMPLICIT_PARENTS := 512

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROC_ISXDOMAIN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTINFO_IUNKNOWN := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTINFO_ITYPEINFO := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTINTERRUPT_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTINTERRUPT_RAISEEXCEPTION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTSTAT_STATEMENT_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTSTAT_INSTRUCTION_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTSTAT_INTSTRUCTION_TIME := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTSTAT_TOTAL_TIME := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_ENCODE_SECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_ENCODE_DEFAULT_LANGUAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_ENCODE_NO_ASP_LANGUAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_NAME := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_MAJORVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_MINORVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_BUILDNUMBER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_DELAYEDEVENTSINKING := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_CATCHEXCEPTION := 4097

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_CONVERSIONLCID := 4098

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_HOSTSTACKREQUIRED := 4099

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_SCRIPTSAREFULLYTRUSTED := 4100

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_DEBUGGER := 4352

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_JITDEBUG := 4353

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_GCCONTROLSOFTCLOSE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_INTEGERMODE := 12288

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_STRINGCOMPAREINSTANCE := 12289

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_INVOKEVERSIONING := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_HACK_FIBERSUPPORT := 1879048192

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_HACK_TRIDENTEVENTSINK := 1879048193

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_ABBREVIATE_GLOBALNAME_RESOLUTION := 1879048194

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPTPROP_HOSTKEEPALIVE := 1879048196

/**
 * @type {Integer (Int32)}
 */
export global SCRIPT_E_RECORDED := -2040119292

/**
 * @type {Integer (Int32)}
 */
export global SCRIPT_E_REPORTED := -2147352319

/**
 * @type {Integer (Int32)}
 */
export global SCRIPT_E_PROPAGATE := -2147352318

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_JsDEBUG := 3527

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_MISMATCHED_RUNTIME := -1916338175

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_UNKNOWN_THREAD := -1916338174

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_OUTSIDE_OF_VM := -1916338172

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_INVALID_MEMORY_ADDRESS := -1916338171

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_SOURCE_LOCATION_NOT_FOUND := -1916338170

/**
 * @type {Integer (Int32)}
 */
export global E_JsDEBUG_RUNTIME_NOT_IN_DEBUG_MODE := -1916338169

/**
 * @type {Integer (Int32)}
 */
export global ACTIVPROF_E_PROFILER_PRESENT := -2147220992

/**
 * @type {Integer (Int32)}
 */
export global ACTIVPROF_E_PROFILER_ABSENT := -2147220991

/**
 * @type {Integer (Int32)}
 */
export global ACTIVPROF_E_UNABLE_TO_APPLY_ACTION := -2147220990

/**
 * @type {Integer (UInt32)}
 */
export global PROFILER_HEAP_OBJECT_NAME_ID_UNAVAILABLE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global fasaPreferInternalHandler := 1

/**
 * @type {Integer (UInt32)}
 */
export global fasaSupportInternalHandler := 2

/**
 * @type {Integer (UInt32)}
 */
export global fasaCaseSensitive := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_NOLIST := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_MEMBERLIST := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_ENUMLIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_PARAMTIP := 4

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_GLOBALLIST := 8

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_ENUM_TRIGGER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_MEMBER_TRIGGER := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_PARAM_TRIGGER := 3

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_CMPL_COMMIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global GETATTRTYPE_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global GETATTRTYPE_DEPSCAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GETATTRFLAG_THIS := 256

/**
 * @type {Integer (UInt32)}
 */
export global GETATTRFLAG_HUMANTEXT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_HUMANTEXT := 32768

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_IDENTIFIER := 256

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_MEMBERLOOKUP := 512

/**
 * @type {Integer (UInt32)}
 */
export global SOURCETEXT_ATTR_THIS := 1024
;@endregion Constants
