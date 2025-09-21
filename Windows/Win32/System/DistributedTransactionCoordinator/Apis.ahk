#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class DistributedTransactionCoordinator {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static DTCINSTALL_E_CLIENT_ALREADY_INSTALLED => 384

    /**
     * @type {Integer (Int32)}
     */
    static DTCINSTALL_E_SERVER_ALREADY_INSTALLED => 385

    /**
     * @type {Integer (UInt32)}
     */
    static XA_SWITCH_F_DTC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XA_FMTID_DTC => 4478019

    /**
     * @type {Integer (UInt32)}
     */
    static XA_FMTID_DTC_VER1 => 21255235

    /**
     * @type {Integer (UInt32)}
     */
    static XIDDATASIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAXGTRIDSIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAXBQUALSIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RMNAMESZ => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAXINFOSIZE => 256

    /**
     * @type {Integer (Int32)}
     */
    static TMNOFLAGS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TMREGISTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TMNOMIGRATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TMUSEASYNC => 4

    /**
     * @type {Integer (Int32)}
     */
    static TMASYNC => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static TMONEPHASE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static TMFAIL => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static TMNOWAIT => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static TMRESUME => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static TMSUCCESS => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static TMSUSPEND => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static TMSTARTRSCAN => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static TMENDRSCAN => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static TMMULTIPLE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static TMJOIN => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static TMMIGRATE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static TM_JOIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TM_RESUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TM_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static TMER_TMERR => -1

    /**
     * @type {Integer (Int32)}
     */
    static TMER_INVAL => -2

    /**
     * @type {Integer (Int32)}
     */
    static TMER_PROTO => -3

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBBASE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBROLLBACK => 100

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBCOMMFAIL => 101

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBDEADLOCK => 102

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBINTEGRITY => 103

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBOTHER => 104

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBPROTO => 105

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBTIMEOUT => 106

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBTRANSIENT => 107

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RBEND => 107

    /**
     * @type {Integer (UInt32)}
     */
    static XA_NOMIGRATE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static XA_HEURHAZ => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XA_HEURCOM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static XA_HEURRB => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XA_HEURMIX => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RETRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XA_RDONLY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XA_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static XAER_ASYNC => -2

    /**
     * @type {Integer (Int32)}
     */
    static XAER_RMERR => -3

    /**
     * @type {Integer (Int32)}
     */
    static XAER_NOTA => -4

    /**
     * @type {Integer (Int32)}
     */
    static XAER_INVAL => -5

    /**
     * @type {Integer (Int32)}
     */
    static XAER_PROTO => -6

    /**
     * @type {Integer (Int32)}
     */
    static XAER_RMFAIL => -7

    /**
     * @type {Integer (Int32)}
     */
    static XAER_DUPID => -8

    /**
     * @type {Integer (Int32)}
     */
    static XAER_OUTSIDE => -9

    /**
     * @type {Integer (UInt32)}
     */
    static DTC_INSTALL_OVERWRITE_CLIENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTC_INSTALL_OVERWRITE_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_CONFIG_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_CONFIG_VERSION_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_FLAG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_FLAG_NODEMANDSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_FLAG_NOAGILERECOVERY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_FLAG_QUERY_SERVICE_LOCKSTATUS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static OLE_TM_FLAG_INTERNAL_TO_TM => 1073741824

    /**
     * @type {String}
     */
    static CLSID_MSDtcTransactionManager => "{5b18ab61-091d-11d1-97df-00c04fb9618a}"

    /**
     * @type {String}
     */
    static CLSID_MSDtcTransaction => "{39f8d76b-0928-11d1-97df-00c04fb9618a}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<Byte>} i_pszHost 
     * @param {Pointer<Byte>} i_pszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_dwReserved1 
     * @param {Integer} i_wcbReserved2 
     * @param {Pointer} i_pvReserved2 
     * @param {Pointer<Void>} o_ppvObject 
     * @returns {HRESULT} 
     */
    static DtcGetTransactionManager(i_pszHost, i_pszTmName, i_riid, i_dwReserved1, i_wcbReserved2, i_pvReserved2, o_ppvObject) {
        i_pszHost := i_pszHost is String? StrPtr(i_pszHost) : i_pszHost
        i_pszTmName := i_pszTmName is String? StrPtr(i_pszTmName) : i_pszTmName

        result := DllCall("XOLEHLP.dll\DtcGetTransactionManager", "ptr", i_pszHost, "ptr", i_pszTmName, "ptr", i_riid, "uint", i_dwReserved1, "ushort", i_wcbReserved2, "ptr", i_pvReserved2, "ptr", o_ppvObject, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} i_pszHost 
     * @param {Pointer<Byte>} i_pszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_dwReserved1 
     * @param {Integer} i_wcbReserved2 
     * @param {Pointer} i_pvReserved2 
     * @param {Pointer<Void>} o_ppvObject 
     * @returns {HRESULT} 
     */
    static DtcGetTransactionManagerC(i_pszHost, i_pszTmName, i_riid, i_dwReserved1, i_wcbReserved2, i_pvReserved2, o_ppvObject) {
        i_pszHost := i_pszHost is String? StrPtr(i_pszHost) : i_pszHost
        i_pszTmName := i_pszTmName is String? StrPtr(i_pszTmName) : i_pszTmName

        result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerC", "ptr", i_pszHost, "ptr", i_pszTmName, "ptr", i_riid, "uint", i_dwReserved1, "ushort", i_wcbReserved2, "ptr", i_pvReserved2, "ptr", o_ppvObject, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} i_pszHost 
     * @param {Pointer<Byte>} i_pszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_grfOptions 
     * @param {Pointer<Void>} i_pvConfigParams 
     * @param {Pointer<Void>} o_ppvObject 
     * @returns {HRESULT} 
     */
    static DtcGetTransactionManagerExA(i_pszHost, i_pszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
        i_pszHost := i_pszHost is String? StrPtr(i_pszHost) : i_pszHost
        i_pszTmName := i_pszTmName is String? StrPtr(i_pszTmName) : i_pszTmName

        result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerExA", "ptr", i_pszHost, "ptr", i_pszTmName, "ptr", i_riid, "uint", i_grfOptions, "ptr", i_pvConfigParams, "ptr", o_ppvObject, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Char>} i_pwszHost 
     * @param {Pointer<Char>} i_pwszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_grfOptions 
     * @param {Pointer<Void>} i_pvConfigParams 
     * @param {Pointer<Void>} o_ppvObject 
     * @returns {HRESULT} 
     */
    static DtcGetTransactionManagerExW(i_pwszHost, i_pwszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
        i_pwszHost := i_pwszHost is String? StrPtr(i_pwszHost) : i_pwszHost
        i_pwszTmName := i_pwszTmName is String? StrPtr(i_pwszTmName) : i_pwszTmName

        result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerExW", "ptr", i_pwszHost, "ptr", i_pwszTmName, "ptr", i_riid, "uint", i_grfOptions, "ptr", i_pvConfigParams, "ptr", o_ppvObject, "CDecl int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
