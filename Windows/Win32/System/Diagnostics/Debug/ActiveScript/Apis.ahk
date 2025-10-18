#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 * @version v4.0.30319
 */
class ActiveScript {

;@region Constants

    /**
     * @type {String}
     */
    static CATID_ActiveScriptAuthor => "{0aee2a92-bcbb-11d0-8c72-00c04fc2b085}"

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_DEBUGGER_BLOCK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_DEBUGGER_HALT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_STEP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_NESTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_STEPTYPE_SOURCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_STEPTYPE_BYTECODE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_STEPTYPE_MACHINE => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_STEPTYPE_MASK => 15728640

    /**
     * @type {Integer (UInt32)}
     */
    static APPBREAKFLAG_IN_BREAKPOINT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_KEYWORD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_COMMENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_NONSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_OPERATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_NUMBER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_STRING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_FUNCTION_START => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TEXT_DOC_ATTR_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TEXT_DOC_ATTR_TYPE_PRIMARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TEXT_DOC_ATTR_TYPE_WORKER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TEXT_DOC_ATTR_TYPE_SCRIPT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_ISEXPRESSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_RETURNVALUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_NOSIDEEFFECTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_ALLOWBREAKPOINTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_ALLOWERRORREPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_EVALUATETOCODECONTEXT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DEBUG_TEXT_ISNONUSERCODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_STATE_RUNNING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_STATE_SUSPENDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_BLOCKED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_OUT_OF_CONTEXT => 8

    /**
     * @type {String}
     */
    static CATID_ActiveScript => "{f0b7a1a1-9847-11cf-8f20-00805f2cd064}"

    /**
     * @type {String}
     */
    static CATID_ActiveScriptParse => "{f0b7a1a2-9847-11cf-8f20-00805f2cd064}"

    /**
     * @type {String}
     */
    static CATID_ActiveScriptEncode => "{f0b7a1a3-9847-11cf-8f20-00805f2cd064}"

    /**
     * @type {String}
     */
    static OID_VBSSIP => "{1629f04e-2799-4db5-8fe5-ace10f17ebab}"

    /**
     * @type {String}
     */
    static OID_JSSIP => "{06c9e010-38ce-11d4-a2a3-00104bd35090}"

    /**
     * @type {String}
     */
    static OID_WSFSIP => "{1a610570-38ce-11d4-a2a3-00104bd35090}"

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_ISVISIBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_ISSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_GLOBALMEMBERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_ISPERSISTENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_CODEONLY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTITEM_NOCODE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTYPELIB_ISCONTROL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTYPELIB_ISPERSISTENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_DELAYEXECUTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_ISVISIBLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_ISEXPRESSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_ISPERSISTENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_HOSTMANAGESSOURCE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_ISXDOMAIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTTEXT_ISNONUSERCODE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROC_ISEXPRESSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROC_HOSTMANAGESSOURCE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROC_IMPLICIT_THIS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROC_IMPLICIT_PARENTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROC_ISXDOMAIN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTINFO_IUNKNOWN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTINFO_ITYPEINFO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTINTERRUPT_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTINTERRUPT_RAISEEXCEPTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTSTAT_STATEMENT_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTSTAT_INSTRUCTION_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTSTAT_INTSTRUCTION_TIME => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTSTAT_TOTAL_TIME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_ENCODE_SECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_ENCODE_DEFAULT_LANGUAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_ENCODE_NO_ASP_LANGUAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_NAME => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_MAJORVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_MINORVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_BUILDNUMBER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_DELAYEDEVENTSINKING => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_CATCHEXCEPTION => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_CONVERSIONLCID => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_HOSTSTACKREQUIRED => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_SCRIPTSAREFULLYTRUSTED => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_DEBUGGER => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_JITDEBUG => 4353

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_GCCONTROLSOFTCLOSE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_INTEGERMODE => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_STRINGCOMPAREINSTANCE => 12289

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_INVOKEVERSIONING => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_HACK_FIBERSUPPORT => 1879048192

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_HACK_TRIDENTEVENTSINK => 1879048193

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_ABBREVIATE_GLOBALNAME_RESOLUTION => 1879048194

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPTPROP_HOSTKEEPALIVE => 1879048196

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPT_E_RECORDED => -2040119292

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPT_E_REPORTED => -2147352319

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPT_E_PROPAGATE => -2147352318

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_JsDEBUG => 3527

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_MISMATCHED_RUNTIME => -1916338175

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_UNKNOWN_THREAD => -1916338174

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_OUTSIDE_OF_VM => -1916338172

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_INVALID_MEMORY_ADDRESS => -1916338171

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_SOURCE_LOCATION_NOT_FOUND => -1916338170

    /**
     * @type {Integer (Int32)}
     */
    static E_JsDEBUG_RUNTIME_NOT_IN_DEBUG_MODE => -1916338169

    /**
     * @type {Integer (Int32)}
     */
    static ACTIVPROF_E_PROFILER_PRESENT => -2147220992

    /**
     * @type {Integer (Int32)}
     */
    static ACTIVPROF_E_PROFILER_ABSENT => -2147220991

    /**
     * @type {Integer (Int32)}
     */
    static ACTIVPROF_E_UNABLE_TO_APPLY_ACTION => -2147220990

    /**
     * @type {Integer (UInt32)}
     */
    static PROFILER_HEAP_OBJECT_NAME_ID_UNAVAILABLE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static fasaPreferInternalHandler => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fasaSupportInternalHandler => 2

    /**
     * @type {Integer (UInt32)}
     */
    static fasaCaseSensitive => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_NOLIST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_MEMBERLIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_ENUMLIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_PARAMTIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_GLOBALLIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_ENUM_TRIGGER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_MEMBER_TRIGGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_PARAM_TRIGGER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SCRIPT_CMPL_COMMIT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GETATTRTYPE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GETATTRTYPE_DEPSCAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GETATTRFLAG_THIS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GETATTRFLAG_HUMANTEXT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_HUMANTEXT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_IDENTIFIER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_MEMBERLOOKUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SOURCETEXT_ATTR_THIS => 1024
;@endregion Constants

;@region Methods
;@endregion Methods
}
