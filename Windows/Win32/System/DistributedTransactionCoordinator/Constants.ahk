#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global DTCINSTALL_E_CLIENT_ALREADY_INSTALLED := 384

/**
 * @type {Integer (Int32)}
 */
export global DTCINSTALL_E_SERVER_ALREADY_INSTALLED := 385

/**
 * @type {Integer (UInt32)}
 */
export global XA_SWITCH_F_DTC := 1

/**
 * @type {Integer (UInt32)}
 */
export global XA_FMTID_DTC := 4478019

/**
 * @type {Integer (UInt32)}
 */
export global XA_FMTID_DTC_VER1 := 21255235

/**
 * @type {Integer (UInt32)}
 */
export global XIDDATASIZE := 128

/**
 * @type {Integer (UInt32)}
 */
export global MAXGTRIDSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAXBQUALSIZE := 64

/**
 * @type {Integer (UInt32)}
 */
export global RMNAMESZ := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAXINFOSIZE := 256

/**
 * @type {Integer (Int32)}
 */
export global TMNOFLAGS := 0

/**
 * @type {Integer (Int32)}
 */
export global TMREGISTER := 1

/**
 * @type {Integer (Int32)}
 */
export global TMNOMIGRATE := 2

/**
 * @type {Integer (Int32)}
 */
export global TMUSEASYNC := 4

/**
 * @type {Integer (Int32)}
 */
export global TMASYNC := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global TMONEPHASE := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global TMFAIL := 536870912

/**
 * @type {Integer (Int32)}
 */
export global TMNOWAIT := 268435456

/**
 * @type {Integer (Int32)}
 */
export global TMRESUME := 134217728

/**
 * @type {Integer (Int32)}
 */
export global TMSUCCESS := 67108864

/**
 * @type {Integer (Int32)}
 */
export global TMSUSPEND := 33554432

/**
 * @type {Integer (Int32)}
 */
export global TMSTARTRSCAN := 16777216

/**
 * @type {Integer (Int32)}
 */
export global TMENDRSCAN := 8388608

/**
 * @type {Integer (Int32)}
 */
export global TMMULTIPLE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global TMJOIN := 2097152

/**
 * @type {Integer (Int32)}
 */
export global TMMIGRATE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TM_JOIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global TM_RESUME := 1

/**
 * @type {Integer (UInt32)}
 */
export global TM_OK := 0

/**
 * @type {Integer (Int32)}
 */
export global TMER_TMERR := -1

/**
 * @type {Integer (Int32)}
 */
export global TMER_INVAL := -2

/**
 * @type {Integer (Int32)}
 */
export global TMER_PROTO := -3

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBBASE := 100

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBROLLBACK := 100

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBCOMMFAIL := 101

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBDEADLOCK := 102

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBINTEGRITY := 103

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBOTHER := 104

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBPROTO := 105

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBTIMEOUT := 106

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBTRANSIENT := 107

/**
 * @type {Integer (UInt32)}
 */
export global XA_RBEND := 107

/**
 * @type {Integer (UInt32)}
 */
export global XA_NOMIGRATE := 9

/**
 * @type {Integer (UInt32)}
 */
export global XA_HEURHAZ := 8

/**
 * @type {Integer (UInt32)}
 */
export global XA_HEURCOM := 7

/**
 * @type {Integer (UInt32)}
 */
export global XA_HEURRB := 6

/**
 * @type {Integer (UInt32)}
 */
export global XA_HEURMIX := 5

/**
 * @type {Integer (UInt32)}
 */
export global XA_RETRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global XA_RDONLY := 3

/**
 * @type {Integer (UInt32)}
 */
export global XA_OK := 0

/**
 * @type {Integer (Int32)}
 */
export global XAER_ASYNC := -2

/**
 * @type {Integer (Int32)}
 */
export global XAER_RMERR := -3

/**
 * @type {Integer (Int32)}
 */
export global XAER_NOTA := -4

/**
 * @type {Integer (Int32)}
 */
export global XAER_INVAL := -5

/**
 * @type {Integer (Int32)}
 */
export global XAER_PROTO := -6

/**
 * @type {Integer (Int32)}
 */
export global XAER_RMFAIL := -7

/**
 * @type {Integer (Int32)}
 */
export global XAER_DUPID := -8

/**
 * @type {Integer (Int32)}
 */
export global XAER_OUTSIDE := -9

/**
 * @type {Integer (UInt32)}
 */
export global DTC_INSTALL_OVERWRITE_CLIENT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTC_INSTALL_OVERWRITE_SERVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_CONFIG_VERSION_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_CONFIG_VERSION_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_FLAG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_FLAG_NODEMANDSTART := 1

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_FLAG_NOAGILERECOVERY := 2

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_FLAG_QUERY_SERVICE_LOCKSTATUS := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global OLE_TM_FLAG_INTERNAL_TO_TM := 1073741824

/**
 * @type {Guid}
 */
export global CLSID_MSDtcTransactionManager := Guid("{5b18ab61-091d-11d1-97df-00c04fb9618a}")

/**
 * @type {Guid}
 */
export global CLSID_MSDtcTransaction := Guid("{39f8d76b-0928-11d1-97df-00c04fb9618a}")
;@endregion Constants
