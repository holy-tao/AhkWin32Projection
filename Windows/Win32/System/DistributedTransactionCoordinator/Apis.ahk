#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */

;@region Functions
/**
 * 
 * @param {PSTR} i_pszHost 
 * @param {PSTR} i_pszTmName 
 * @param {Pointer<Guid>} i_riid 
 * @param {Integer} i_dwReserved1 
 * @param {Integer} i_wcbReserved2 
 * @param {Integer} i_pvReserved2 
 * @param {Pointer<Pointer<Void>>} o_ppvObject 
 * @returns {HRESULT} 
 */
export DtcGetTransactionManager(i_pszHost, i_pszTmName, i_riid, i_dwReserved1, i_wcbReserved2, i_pvReserved2, o_ppvObject) {
    i_pszHost := i_pszHost is String ? StrPtr(i_pszHost) : i_pszHost
    i_pszTmName := i_pszTmName is String ? StrPtr(i_pszTmName) : i_pszTmName

    o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("XOLEHLP.dll\DtcGetTransactionManager", "ptr", i_pszHost, "ptr", i_pszTmName, Guid.Ptr, i_riid, "uint", i_dwReserved1, "ushort", i_wcbReserved2, "ptr", i_pvReserved2, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} i_pszHost 
 * @param {PSTR} i_pszTmName 
 * @param {Pointer<Guid>} i_riid 
 * @param {Integer} i_dwReserved1 
 * @param {Integer} i_wcbReserved2 
 * @param {Integer} i_pvReserved2 
 * @param {Pointer<Pointer<Void>>} o_ppvObject 
 * @returns {HRESULT} 
 */
export DtcGetTransactionManagerC(i_pszHost, i_pszTmName, i_riid, i_dwReserved1, i_wcbReserved2, i_pvReserved2, o_ppvObject) {
    i_pszHost := i_pszHost is String ? StrPtr(i_pszHost) : i_pszHost
    i_pszTmName := i_pszTmName is String ? StrPtr(i_pszTmName) : i_pszTmName

    o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerC", "ptr", i_pszHost, "ptr", i_pszTmName, Guid.Ptr, i_riid, "uint", i_dwReserved1, "ushort", i_wcbReserved2, "ptr", i_pvReserved2, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} i_pszHost 
 * @param {PSTR} i_pszTmName 
 * @param {Pointer<Guid>} i_riid 
 * @param {Integer} i_grfOptions 
 * @param {Pointer<Void>} i_pvConfigParams 
 * @param {Pointer<Pointer<Void>>} o_ppvObject 
 * @returns {HRESULT} 
 */
export DtcGetTransactionManagerExA(i_pszHost, i_pszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
    i_pszHost := i_pszHost is String ? StrPtr(i_pszHost) : i_pszHost
    i_pszTmName := i_pszTmName is String ? StrPtr(i_pszTmName) : i_pszTmName

    i_pvConfigParamsMarshal := i_pvConfigParams is VarRef ? "ptr" : "ptr"
    o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerExA", "ptr", i_pszHost, "ptr", i_pszTmName, Guid.Ptr, i_riid, "uint", i_grfOptions, i_pvConfigParamsMarshal, i_pvConfigParams, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} i_pwszHost 
 * @param {PWSTR} i_pwszTmName 
 * @param {Pointer<Guid>} i_riid 
 * @param {Integer} i_grfOptions 
 * @param {Pointer<Void>} i_pvConfigParams 
 * @param {Pointer<Pointer<Void>>} o_ppvObject 
 * @returns {HRESULT} 
 */
export DtcGetTransactionManagerExW(i_pwszHost, i_pwszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
    i_pwszHost := i_pwszHost is String ? StrPtr(i_pwszHost) : i_pwszHost
    i_pwszTmName := i_pwszTmName is String ? StrPtr(i_pwszTmName) : i_pwszTmName

    i_pvConfigParamsMarshal := i_pvConfigParams is VarRef ? "ptr" : "ptr"
    o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

    result := DllCall("XOLEHLP.dll\DtcGetTransactionManagerExW", "ptr", i_pwszHost, "ptr", i_pwszTmName, Guid.Ptr, i_riid, "uint", i_grfOptions, i_pvConfigParamsMarshal, i_pvConfigParams, o_ppvObjectMarshal, o_ppvObject, "HRESULT")
    return result
}

;@endregion Functions
