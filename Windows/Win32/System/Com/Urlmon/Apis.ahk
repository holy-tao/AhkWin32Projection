#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\uCLSSPEC.ahk" { uCLSSPEC }
#Import "..\IBindStatusCallback.ahk" { IBindStatusCallback }
#Import ".\INTERNETFEATURELIST.ahk" { INTERNETFEATURELIST }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IEObjectType.ahk" { IEObjectType }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\PSUACTION.ahk" { PSUACTION }
#Import "..\FORMATETC.ahk" { FORMATETC }
#Import "..\IServiceProvider.ahk" { IServiceProvider }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PARSEACTION.ahk" { PARSEACTION }
#Import "..\IStream.ahk" { IStream }
#Import ".\IInternetSecurityManager.ahk" { IInternetSecurityManager }
#Import "..\IEnumFORMATETC.ahk" { IEnumFORMATETC }
#Import ".\IInternetSecurityManagerEx2.ahk" { IInternetSecurityManagerEx2 }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import "..\QUERYCONTEXT.ahk" { QUERYCONTEXT }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\IMoniker.ahk" { IMoniker }
#Import ".\SOFTDISTINFO.ahk" { SOFTDISTINFO }
#Import "..\STGMEDIUM.ahk" { STGMEDIUM }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\IUri.ahk" { IUri }
#Import ".\IInternetZoneManager.ahk" { IInternetZoneManager }
#Import ".\IInternetSession.ahk" { IInternetSession }
#Import ".\HIT_LOGGING_INFO.ahk" { HIT_LOGGING_INFO }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\QUERYOPTION.ahk" { QUERYOPTION }
#Import "..\CLSCTX.ahk" { CLSCTX }
#Import "..\BINDINFO.ahk" { BINDINFO }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */

;@region Functions
/**
 * 
 * @param {IMoniker} pMkCtx 
 * @param {PWSTR} szURL 
 * @returns {IMoniker} 
 */
export CreateURLMoniker(pMkCtx, szURL) {
    szURL := szURL is String ? StrPtr(szURL) : szURL

    result := DllCall("urlmon.dll\CreateURLMoniker", "ptr", pMkCtx, "ptr", szURL, "ptr*", &ppmk := 0, "HRESULT")
    return IMoniker(ppmk)
}

/**
 * 
 * @param {IMoniker} pMkCtx 
 * @param {PWSTR} szURL 
 * @param {Integer} dwFlags 
 * @returns {IMoniker} 
 */
export CreateURLMonikerEx(pMkCtx, szURL, dwFlags) {
    szURL := szURL is String ? StrPtr(szURL) : szURL

    result := DllCall("urlmon.dll\CreateURLMonikerEx", "ptr", pMkCtx, "ptr", szURL, "ptr*", &ppmk := 0, UInt32, dwFlags, "HRESULT")
    return IMoniker(ppmk)
}

/**
 * 
 * @param {PWSTR} szURL 
 * @param {Pointer<Guid>} pClsID 
 * @returns {HRESULT} 
 */
export GetClassURL(szURL, pClsID) {
    szURL := szURL is String ? StrPtr(szURL) : szURL

    result := DllCall("urlmon.dll\GetClassURL", "ptr", szURL, Guid.Ptr, pClsID, "HRESULT")
    return result
}

/**
 * Creates an asynchronous bind context for use with asynchronous monikers.
 * @remarks
 * This function automatically registers the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interfaces with the bind context. The client can specify flags from BSCO_OPTION to indicate which callback notifications the client is capable of receiving. If the client does not wish to receive certain notification, it can choose to implement those callback methods as empty function stubs (returning E_NOTIMPL), and they should not be called.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775115(v=vs.85)">RegisterBindStatusCallback</a> function can also be used to register callback interfaces in the bind context.
 * @param {Integer} reserved This parameter is reserved and must be 0.
 * @param {IBindStatusCallback} pBSCb A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775060(v=vs.85)">IBindStatusCallback</a> interface used for receiving data availability and progress notification.
 * @param {IEnumFORMATETC} pEFetc A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> interface that can be used to enumerate formats for format negotiation during binding. This parameter can be <b>NULL</b>, in which case the caller is not interested in format negotiation during binding, and the default format of the object will be bound to.
 * @returns {IBindCtx} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>* pointer variable that receives the interface pointer to the new bind context.
 * @see https://learn.microsoft.com/windows/win32/api/urlmon/nf-urlmon-createasyncbindctx
 * @since windows5.0
 */
export CreateAsyncBindCtx(reserved, pBSCb, pEFetc) {
    result := DllCall("urlmon.dll\CreateAsyncBindCtx", UInt32, reserved, "ptr", pBSCb, "ptr", pEFetc, "ptr*", &ppBC := 0, "HRESULT")
    return IBindCtx(ppBC)
}

/**
 * 
 * @param {IMoniker} pMkCtx 
 * @param {IUri} pUri 
 * @param {Integer} dwFlags 
 * @returns {IMoniker} 
 */
export CreateURLMonikerEx2(pMkCtx, pUri, dwFlags) {
    result := DllCall("urlmon.dll\CreateURLMonikerEx2", "ptr", pMkCtx, "ptr", pUri, "ptr*", &ppmk := 0, UInt32, dwFlags, "HRESULT")
    return IMoniker(ppmk)
}

/**
 * 
 * @param {IBindCtx} pbc 
 * @param {Integer} dwOptions 
 * @param {IBindStatusCallback} pBSCb 
 * @param {IEnumFORMATETC} pEnum 
 * @param {Integer} reserved 
 * @returns {IBindCtx} 
 */
export CreateAsyncBindCtxEx(pbc, dwOptions, pBSCb, pEnum, reserved) {
    result := DllCall("urlmon.dll\CreateAsyncBindCtxEx", "ptr", pbc, UInt32, dwOptions, "ptr", pBSCb, "ptr", pEnum, "ptr*", &ppBC := 0, UInt32, reserved, "HRESULT")
    return IBindCtx(ppBC)
}

/**
 * 
 * @param {IBindCtx} pbc 
 * @param {PWSTR} szDisplayName 
 * @param {Pointer<Integer>} pchEaten 
 * @param {Pointer<IMoniker>} ppmk 
 * @returns {HRESULT} 
 */
export MkParseDisplayNameEx(pbc, szDisplayName, pchEaten, ppmk) {
    szDisplayName := szDisplayName is String ? StrPtr(szDisplayName) : szDisplayName

    pchEatenMarshal := pchEaten is VarRef ? "uint*" : "ptr"

    result := DllCall("urlmon.dll\MkParseDisplayNameEx", "ptr", pbc, "ptr", szDisplayName, pchEatenMarshal, pchEaten, IMoniker.Ptr, ppmk, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {IBindStatusCallback} pBSCb 
 * @param {Integer} dwReserved 
 * @returns {IBindStatusCallback} 
 */
export RegisterBindStatusCallback(pBC, pBSCb, dwReserved) {
    result := DllCall("urlmon.dll\RegisterBindStatusCallback", "ptr", pBC, "ptr", pBSCb, "ptr*", &ppBSCBPrev := 0, UInt32, dwReserved, "HRESULT")
    return IBindStatusCallback(ppBSCBPrev)
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {IBindStatusCallback} pBSCb 
 * @returns {HRESULT} 
 */
export RevokeBindStatusCallback(pBC, pBSCb) {
    result := DllCall("urlmon.dll\RevokeBindStatusCallback", "ptr", pBC, "ptr", pBSCb, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {PWSTR} szFilename 
 * @param {Integer} pBuffer 
 * @param {Integer} cbSize 
 * @param {PWSTR} szMime 
 * @param {Integer} dwReserved 
 * @param {Pointer<Guid>} pclsid 
 * @returns {HRESULT} 
 */
export GetClassFileOrMime(pBC, szFilename, pBuffer, cbSize, szMime, dwReserved, pclsid) {
    szFilename := szFilename is String ? StrPtr(szFilename) : szFilename
    szMime := szMime is String ? StrPtr(szMime) : szMime

    result := DllCall("urlmon.dll\GetClassFileOrMime", "ptr", pBC, "ptr", szFilename, IntPtr, pBuffer, UInt32, cbSize, "ptr", szMime, UInt32, dwReserved, Guid.Ptr, pclsid, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {PWSTR} szURL 
 * @param {Integer} dwReserved 
 * @returns {HRESULT} 
 */
export IsValidURL(pBC, szURL, dwReserved) {
    szURL := szURL is String ? StrPtr(szURL) : szURL

    result := DllCall("urlmon.dll\IsValidURL", "ptr", pBC, "ptr", szURL, UInt32, dwReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} rCLASSID 
 * @param {PWSTR} szCODE 
 * @param {Integer} dwFileVersionMS 
 * @param {Integer} dwFileVersionLS 
 * @param {PWSTR} szTYPE 
 * @param {IBindCtx} pBindCtx 
 * @param {CLSCTX} dwClsContext 
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 */
export CoGetClassObjectFromURL(rCLASSID, szCODE, dwFileVersionMS, dwFileVersionLS, szTYPE, pBindCtx, dwClsContext, riid) {
    static pvReserved := 0 ;Reserved parameters must always be NULL

    szCODE := szCODE is String ? StrPtr(szCODE) : szCODE
    szTYPE := szTYPE is String ? StrPtr(szTYPE) : szTYPE

    result := DllCall("urlmon.dll\CoGetClassObjectFromURL", Guid.Ptr, rCLASSID, "ptr", szCODE, UInt32, dwFileVersionMS, UInt32, dwFileVersionLS, "ptr", szTYPE, "ptr", pBindCtx, CLSCTX, dwClsContext, "ptr", pvReserved, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
    return ppv
}

/**
 * 
 * @returns {Integer} 
 */
export IEInstallScope() {
    result := DllCall("urlmon.dll\IEInstallScope", "uint*", &pdwScope := 0, "HRESULT")
    return pdwScope
}

/**
 * 
 * @param {HWND} _hWnd 
 * @param {Pointer<uCLSSPEC>} pClassSpec 
 * @param {Pointer<QUERYCONTEXT>} pQuery 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export FaultInIEFeature(_hWnd, pClassSpec, pQuery, dwFlags) {
    result := DllCall("urlmon.dll\FaultInIEFeature", HWND, _hWnd, uCLSSPEC.Ptr, pClassSpec, QUERYCONTEXT.Ptr, pQuery, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<uCLSSPEC>} pClassspec 
 * @returns {PSTR} 
 */
export GetComponentIDFromCLSSPEC(pClassspec) {
    result := DllCall("urlmon.dll\GetComponentIDFromCLSSPEC", uCLSSPEC.Ptr, pClassspec, PSTR.Ptr, &ppszComponentID := 0, "HRESULT")
    return ppszComponentID
}

/**
 * 
 * @param {IMoniker} pmk 
 * @returns {HRESULT} 
 */
export IsAsyncMoniker(pmk) {
    result := DllCall("urlmon.dll\IsAsyncMoniker", "ptr", pmk, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} ctypes 
 * @param {Pointer<PSTR>} rgszTypes 
 * @returns {Integer} 
 */
export RegisterMediaTypes(ctypes, rgszTypes) {
    rgszTypesMarshal := rgszTypes is VarRef ? "ptr*" : "ptr"

    result := DllCall("urlmon.dll\RegisterMediaTypes", UInt32, ctypes, rgszTypesMarshal, rgszTypes, "ushort*", &rgcfTypes := 0, "HRESULT")
    return rgcfTypes
}

/**
 * 
 * @param {PSTR} rgszTypes 
 * @returns {Integer} 
 */
export FindMediaType(rgszTypes) {
    rgszTypes := rgszTypes is String ? StrPtr(rgszTypes) : rgszTypes

    result := DllCall("urlmon.dll\FindMediaType", "ptr", rgszTypes, "ushort*", &rgcfTypes := 0, "HRESULT")
    return rgcfTypes
}

/**
 * Creates an object that implements IEnumFORMATETC over a static array of FORMATETC structures.
 * @remarks
 * The <b>CreateFormatEnumerator</b> function creates an enumerator object that implements <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> over a static array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures. The <i>cfmtetc</i> parameter specifies the number of these structures. With the pointer, you can call the standard enumeration methods to enumerate the structures.
 * @param {Integer} cfmtetc Number of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures in the static array specified by the <i>rgfmtetc</i> parameter. The <i>cfmtetc</i> parameter cannot be zero.
 * @param {Pointer<FORMATETC>} rgfmtetc Pointer to a static array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-formatetc">FORMATETC</a> structures.
 * @returns {IEnumFORMATETC} Address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumformatetc">IEnumFORMATETC</a> pointer variable that receives the interface pointer to the enumerator object.
 * @see https://learn.microsoft.com/windows/win32/api/urlmon/nf-urlmon-createformatenumerator
 * @since windows5.0
 */
export CreateFormatEnumerator(cfmtetc, rgfmtetc) {
    result := DllCall("urlmon.dll\CreateFormatEnumerator", UInt32, cfmtetc, FORMATETC.Ptr, rgfmtetc, "ptr*", &ppenumfmtetc := 0, "HRESULT")
    return IEnumFORMATETC(ppenumfmtetc)
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {IEnumFORMATETC} pEFetc 
 * @param {Integer} reserved 
 * @returns {HRESULT} 
 */
export RegisterFormatEnumerator(pBC, pEFetc, reserved) {
    result := DllCall("urlmon.dll\RegisterFormatEnumerator", "ptr", pBC, "ptr", pEFetc, UInt32, reserved, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {IEnumFORMATETC} pEFetc 
 * @returns {HRESULT} 
 */
export RevokeFormatEnumerator(pBC, pEFetc) {
    result := DllCall("urlmon.dll\RevokeFormatEnumerator", "ptr", pBC, "ptr", pEFetc, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {Integer} ctypes 
 * @param {Pointer<PSTR>} rgszTypes 
 * @param {Pointer<Guid>} rgclsID 
 * @param {Integer} reserved 
 * @returns {HRESULT} 
 */
export RegisterMediaTypeClass(pBC, ctypes, rgszTypes, rgclsID, reserved) {
    rgszTypesMarshal := rgszTypes is VarRef ? "ptr*" : "ptr"

    result := DllCall("urlmon.dll\RegisterMediaTypeClass", "ptr", pBC, UInt32, ctypes, rgszTypesMarshal, rgszTypes, Guid.Ptr, rgclsID, UInt32, reserved, "HRESULT")
    return result
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {PSTR} szType 
 * @param {Pointer<Guid>} pclsID 
 * @param {Integer} reserved 
 * @returns {HRESULT} 
 */
export FindMediaTypeClass(pBC, szType, pclsID, reserved) {
    szType := szType is String ? StrPtr(szType) : szType

    result := DllCall("urlmon.dll\FindMediaTypeClass", "ptr", pBC, "ptr", szType, Guid.Ptr, pclsID, UInt32, reserved, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} dwOption 
 * @param {Integer} pBuffer 
 * @param {Integer} dwBufferLength 
 * @returns {HRESULT} 
 */
export UrlMkSetSessionOption(dwOption, pBuffer, dwBufferLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    result := DllCall("urlmon.dll\UrlMkSetSessionOption", UInt32, dwOption, IntPtr, pBuffer, UInt32, dwBufferLength, UInt32, dwReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} dwOption 
 * @param {Integer} pBuffer 
 * @param {Integer} dwBufferLength 
 * @returns {Integer} 
 */
export UrlMkGetSessionOption(dwOption, pBuffer, dwBufferLength) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    result := DllCall("urlmon.dll\UrlMkGetSessionOption", UInt32, dwOption, IntPtr, pBuffer, UInt32, dwBufferLength, "uint*", &pdwBufferLengthOut := 0, UInt32, dwReserved, "HRESULT")
    return pdwBufferLengthOut
}

/**
 * 
 * @param {IBindCtx} pBC 
 * @param {PWSTR} pwzUrl 
 * @param {Integer} pBuffer 
 * @param {Integer} cbSize 
 * @param {PWSTR} pwzMimeProposed 
 * @param {Integer} dwMimeFlags 
 * @returns {PWSTR} 
 */
export FindMimeFromData(pBC, pwzUrl, pBuffer, cbSize, pwzMimeProposed, dwMimeFlags) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl
    pwzMimeProposed := pwzMimeProposed is String ? StrPtr(pwzMimeProposed) : pwzMimeProposed

    result := DllCall("urlmon.dll\FindMimeFromData", "ptr", pBC, "ptr", pwzUrl, IntPtr, pBuffer, UInt32, cbSize, "ptr", pwzMimeProposed, UInt32, dwMimeFlags, PWSTR.Ptr, &ppwzMimeOut := 0, UInt32, dwReserved, "HRESULT")
    return ppwzMimeOut
}

/**
 * 
 * @param {Integer} dwOption 
 * @param {PSTR} pszUAOut 
 * @param {Pointer<Integer>} cbSize 
 * @returns {HRESULT} 
 */
export ObtainUserAgentString(dwOption, pszUAOut, cbSize) {
    pszUAOut := pszUAOut is String ? StrPtr(pszUAOut) : pszUAOut

    cbSizeMarshal := cbSize is VarRef ? "uint*" : "ptr"

    result := DllCall("urlmon.dll\ObtainUserAgentString", UInt32, dwOption, "ptr", pszUAOut, cbSizeMarshal, cbSize, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Integer>} pbSecurityId1 
 * @param {Integer} dwLen1 
 * @param {Pointer<Integer>} pbSecurityId2 
 * @param {Integer} dwLen2 
 * @param {Integer} dwReserved 
 * @returns {HRESULT} 
 */
export CompareSecurityIds(pbSecurityId1, dwLen1, pbSecurityId2, dwLen2, dwReserved) {
    pbSecurityId1Marshal := pbSecurityId1 is VarRef ? "char*" : "ptr"
    pbSecurityId2Marshal := pbSecurityId2 is VarRef ? "char*" : "ptr"

    result := DllCall("urlmon.dll\CompareSecurityIds", pbSecurityId1Marshal, pbSecurityId1, UInt32, dwLen1, pbSecurityId2Marshal, pbSecurityId2, UInt32, dwLen2, UInt32, dwReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} pclsid 
 * @param {Pointer<Integer>} pdwCompatFlags 
 * @param {Pointer<Integer>} pdwMiscStatusFlags 
 * @returns {HRESULT} 
 */
export CompatFlagsFromClsid(pclsid, pdwCompatFlags, pdwMiscStatusFlags) {
    pdwCompatFlagsMarshal := pdwCompatFlags is VarRef ? "uint*" : "ptr"
    pdwMiscStatusFlagsMarshal := pdwMiscStatusFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("urlmon.dll\CompatFlagsFromClsid", Guid.Ptr, pclsid, pdwCompatFlagsMarshal, pdwCompatFlags, pdwMiscStatusFlagsMarshal, pdwMiscStatusFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} hObject 
 * @param {IEObjectType} _ieObjectType 
 * @param {Integer} dwAccessMask 
 * @returns {HRESULT} 
 */
export SetAccessForIEAppContainer(hObject, _ieObjectType, dwAccessMask) {
    result := DllCall("urlmon.dll\SetAccessForIEAppContainer", HANDLE, hObject, IEObjectType, _ieObjectType, UInt32, dwAccessMask, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} szTarget 
 * @param {PWSTR} szLocation 
 * @param {PWSTR} szTargetFrameName 
 * @param {IUnknown} pUnk 
 * @param {IBindCtx} pbc 
 * @param {IBindStatusCallback} param5 
 * @param {Integer} grfHLNF 
 * @param {Integer} dwReserved 
 * @returns {HRESULT} 
 */
export HlinkSimpleNavigateToString(szTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved) {
    szTarget := szTarget is String ? StrPtr(szTarget) : szTarget
    szLocation := szLocation is String ? StrPtr(szLocation) : szLocation
    szTargetFrameName := szTargetFrameName is String ? StrPtr(szTargetFrameName) : szTargetFrameName

    result := DllCall("urlmon.dll\HlinkSimpleNavigateToString", "ptr", szTarget, "ptr", szLocation, "ptr", szTargetFrameName, "ptr", pUnk, "ptr", pbc, "ptr", param5, UInt32, grfHLNF, UInt32, dwReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {IMoniker} pmkTarget 
 * @param {PWSTR} szLocation 
 * @param {PWSTR} szTargetFrameName 
 * @param {IUnknown} pUnk 
 * @param {IBindCtx} pbc 
 * @param {IBindStatusCallback} param5 
 * @param {Integer} grfHLNF 
 * @param {Integer} dwReserved 
 * @returns {HRESULT} 
 */
export HlinkSimpleNavigateToMoniker(pmkTarget, szLocation, szTargetFrameName, pUnk, pbc, param5, grfHLNF, dwReserved) {
    szLocation := szLocation is String ? StrPtr(szLocation) : szLocation
    szTargetFrameName := szTargetFrameName is String ? StrPtr(szTargetFrameName) : szTargetFrameName

    result := DllCall("urlmon.dll\HlinkSimpleNavigateToMoniker", "ptr", pmkTarget, "ptr", szLocation, "ptr", szTargetFrameName, "ptr", pUnk, "ptr", pbc, "ptr", param5, UInt32, grfHLNF, UInt32, dwReserved, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PSTR} param1 
 * @param {Integer} param2 
 * @param {IBindStatusCallback} param3 
 * @returns {HRESULT} 
 */
export URLOpenStreamA(param0, param1, param2, param3) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenStreamA", "ptr", param0, "ptr", param1, UInt32, param2, "ptr", param3, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PWSTR} param1 
 * @param {Integer} param2 
 * @param {IBindStatusCallback} param3 
 * @returns {HRESULT} 
 */
export URLOpenStreamW(param0, param1, param2, param3) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenStreamW", "ptr", param0, "ptr", param1, UInt32, param2, "ptr", param3, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PSTR} param1 
 * @param {Integer} param2 
 * @param {IBindStatusCallback} param3 
 * @returns {HRESULT} 
 */
export URLOpenPullStreamA(param0, param1, param2, param3) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenPullStreamA", "ptr", param0, "ptr", param1, UInt32, param2, "ptr", param3, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PWSTR} param1 
 * @param {Integer} param2 
 * @param {IBindStatusCallback} param3 
 * @returns {HRESULT} 
 */
export URLOpenPullStreamW(param0, param1, param2, param3) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenPullStreamW", "ptr", param0, "ptr", param1, UInt32, param2, "ptr", param3, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PSTR} param1 
 * @param {PSTR} param2 
 * @param {Integer} param3 
 * @param {IBindStatusCallback} param4 
 * @returns {HRESULT} 
 */
export URLDownloadToFileA(param0, param1, param2, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2

    result := DllCall("urlmon.dll\URLDownloadToFileA", "ptr", param0, "ptr", param1, "ptr", param2, UInt32, param3, "ptr", param4, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PWSTR} param1 
 * @param {PWSTR} param2 
 * @param {Integer} param3 
 * @param {IBindStatusCallback} param4 
 * @returns {HRESULT} 
 */
export URLDownloadToFileW(param0, param1, param2, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2

    result := DllCall("urlmon.dll\URLDownloadToFileW", "ptr", param0, "ptr", param1, "ptr", param2, UInt32, param3, "ptr", param4, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PSTR} param1 
 * @param {PSTR} param2 
 * @param {Integer} cchFileName 
 * @param {Integer} param4 
 * @param {IBindStatusCallback} param5 
 * @returns {HRESULT} 
 */
export URLDownloadToCacheFileA(param0, param1, param2, cchFileName, param4, param5) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2

    result := DllCall("urlmon.dll\URLDownloadToCacheFileA", "ptr", param0, "ptr", param1, "ptr", param2, UInt32, cchFileName, UInt32, param4, "ptr", param5, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PWSTR} param1 
 * @param {PWSTR} param2 
 * @param {Integer} cchFileName 
 * @param {Integer} param4 
 * @param {IBindStatusCallback} param5 
 * @returns {HRESULT} 
 */
export URLDownloadToCacheFileW(param0, param1, param2, cchFileName, param4, param5) {
    param1 := param1 is String ? StrPtr(param1) : param1
    param2 := param2 is String ? StrPtr(param2) : param2

    result := DllCall("urlmon.dll\URLDownloadToCacheFileW", "ptr", param0, "ptr", param1, "ptr", param2, UInt32, cchFileName, UInt32, param4, "ptr", param5, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PSTR} param1 
 * @param {Integer} param3 
 * @param {IBindStatusCallback} param4 
 * @returns {IStream} 
 */
export URLOpenBlockingStreamA(param0, param1, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenBlockingStreamA", "ptr", param0, "ptr", param1, "ptr*", &param2 := 0, UInt32, param3, "ptr", param4, "HRESULT")
    return IStream(param2)
}

/**
 * 
 * @param {IUnknown} param0 
 * @param {PWSTR} param1 
 * @param {Integer} param3 
 * @param {IBindStatusCallback} param4 
 * @returns {IStream} 
 */
export URLOpenBlockingStreamW(param0, param1, param3, param4) {
    param1 := param1 is String ? StrPtr(param1) : param1

    result := DllCall("urlmon.dll\URLOpenBlockingStreamW", "ptr", param0, "ptr", param1, "ptr*", &param2 := 0, UInt32, param3, "ptr", param4, "HRESULT")
    return IStream(param2)
}

/**
 * 
 * @param {IUnknown} pUnk 
 * @returns {HRESULT} 
 */
export HlinkGoBack(pUnk) {
    result := DllCall("urlmon.dll\HlinkGoBack", "ptr", pUnk, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} pUnk 
 * @returns {HRESULT} 
 */
export HlinkGoForward(pUnk) {
    result := DllCall("urlmon.dll\HlinkGoForward", "ptr", pUnk, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} pUnk 
 * @param {PWSTR} szTarget 
 * @returns {HRESULT} 
 */
export HlinkNavigateString(pUnk, szTarget) {
    szTarget := szTarget is String ? StrPtr(szTarget) : szTarget

    result := DllCall("urlmon.dll\HlinkNavigateString", "ptr", pUnk, "ptr", szTarget, "HRESULT")
    return result
}

/**
 * 
 * @param {IUnknown} pUnk 
 * @param {IMoniker} pmkTarget 
 * @returns {HRESULT} 
 */
export HlinkNavigateMoniker(pUnk, pmkTarget) {
    result := DllCall("urlmon.dll\HlinkNavigateMoniker", "ptr", pUnk, "ptr", pmkTarget, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pwzUrl 
 * @param {PARSEACTION} _ParseAction 
 * @param {Integer} dwFlags 
 * @param {PWSTR} pszResult 
 * @param {Integer} cchResult 
 * @param {Integer} dwReserved 
 * @returns {Integer} 
 */
export CoInternetParseUrl(pwzUrl, _ParseAction, dwFlags, pszResult, cchResult, dwReserved) {
    pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl
    pszResult := pszResult is String ? StrPtr(pszResult) : pszResult

    result := DllCall("urlmon.dll\CoInternetParseUrl", "ptr", pwzUrl, PARSEACTION, _ParseAction, UInt32, dwFlags, "ptr", pszResult, UInt32, cchResult, "uint*", &pcchResult := 0, UInt32, dwReserved, "HRESULT")
    return pcchResult
}

/**
 * 
 * @param {IUri} pIUri 
 * @param {PARSEACTION} _ParseAction 
 * @param {Integer} dwFlags 
 * @param {PWSTR} pwzResult 
 * @param {Integer} cchResult 
 * @returns {Integer} 
 */
export CoInternetParseIUri(pIUri, _ParseAction, dwFlags, pwzResult, cchResult) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    pwzResult := pwzResult is String ? StrPtr(pwzResult) : pwzResult

    result := DllCall("urlmon.dll\CoInternetParseIUri", "ptr", pIUri, PARSEACTION, _ParseAction, UInt32, dwFlags, "ptr", pwzResult, UInt32, cchResult, "uint*", &pcchResult := 0, IntPtr, dwReserved, "HRESULT")
    return pcchResult
}

/**
 * 
 * @param {PWSTR} pwzBaseUrl 
 * @param {PWSTR} pwzRelativeUrl 
 * @param {Integer} dwCombineFlags 
 * @param {PWSTR} pszResult 
 * @param {Integer} cchResult 
 * @returns {Integer} 
 */
export CoInternetCombineUrl(pwzBaseUrl, pwzRelativeUrl, dwCombineFlags, pszResult, cchResult) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    pwzBaseUrl := pwzBaseUrl is String ? StrPtr(pwzBaseUrl) : pwzBaseUrl
    pwzRelativeUrl := pwzRelativeUrl is String ? StrPtr(pwzRelativeUrl) : pwzRelativeUrl
    pszResult := pszResult is String ? StrPtr(pszResult) : pszResult

    result := DllCall("urlmon.dll\CoInternetCombineUrl", "ptr", pwzBaseUrl, "ptr", pwzRelativeUrl, UInt32, dwCombineFlags, "ptr", pszResult, UInt32, cchResult, "uint*", &pcchResult := 0, UInt32, dwReserved, "HRESULT")
    return pcchResult
}

/**
 * 
 * @param {IUri} pBaseUri 
 * @param {PWSTR} pwzRelativeUrl 
 * @param {Integer} dwCombineFlags 
 * @param {Pointer} dwReserved 
 * @returns {IUri} 
 */
export CoInternetCombineUrlEx(pBaseUri, pwzRelativeUrl, dwCombineFlags, dwReserved) {
    pwzRelativeUrl := pwzRelativeUrl is String ? StrPtr(pwzRelativeUrl) : pwzRelativeUrl

    result := DllCall("urlmon.dll\CoInternetCombineUrlEx", "ptr", pBaseUri, "ptr", pwzRelativeUrl, UInt32, dwCombineFlags, "ptr*", &ppCombinedUri := 0, IntPtr, dwReserved, "HRESULT")
    return IUri(ppCombinedUri)
}

/**
 * 
 * @param {IUri} pBaseUri 
 * @param {IUri} pRelativeUri 
 * @param {Integer} dwCombineFlags 
 * @param {Pointer} dwReserved 
 * @returns {IUri} 
 */
export CoInternetCombineIUri(pBaseUri, pRelativeUri, dwCombineFlags, dwReserved) {
    result := DllCall("urlmon.dll\CoInternetCombineIUri", "ptr", pBaseUri, "ptr", pRelativeUri, UInt32, dwCombineFlags, "ptr*", &ppCombinedUri := 0, IntPtr, dwReserved, "HRESULT")
    return IUri(ppCombinedUri)
}

/**
 * 
 * @param {PWSTR} pwzUrl1 
 * @param {PWSTR} pwzUrl2 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export CoInternetCompareUrl(pwzUrl1, pwzUrl2, dwFlags) {
    pwzUrl1 := pwzUrl1 is String ? StrPtr(pwzUrl1) : pwzUrl1
    pwzUrl2 := pwzUrl2 is String ? StrPtr(pwzUrl2) : pwzUrl2

    result := DllCall("urlmon.dll\CoInternetCompareUrl", "ptr", pwzUrl1, "ptr", pwzUrl2, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} pwzUrl 
 * @param {Integer} dwReserved 
 * @returns {Integer} 
 */
export CoInternetGetProtocolFlags(pwzUrl, dwReserved) {
    pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl

    result := DllCall("urlmon.dll\CoInternetGetProtocolFlags", "ptr", pwzUrl, "uint*", &pdwFlags := 0, UInt32, dwReserved, "HRESULT")
    return pdwFlags
}

/**
 * 
 * @param {PWSTR} pwzUrl 
 * @param {QUERYOPTION} QueryOptions 
 * @param {Integer} dwQueryFlags 
 * @param {Integer} pvBuffer 
 * @param {Integer} cbBuffer 
 * @param {Integer} dwReserved 
 * @returns {Integer} 
 */
export CoInternetQueryInfo(pwzUrl, QueryOptions, dwQueryFlags, pvBuffer, cbBuffer, dwReserved) {
    pwzUrl := pwzUrl is String ? StrPtr(pwzUrl) : pwzUrl

    result := DllCall("urlmon.dll\CoInternetQueryInfo", "ptr", pwzUrl, QUERYOPTION, QueryOptions, UInt32, dwQueryFlags, IntPtr, pvBuffer, UInt32, cbBuffer, "uint*", &pcbBuffer := 0, UInt32, dwReserved, "HRESULT")
    return pcbBuffer
}

/**
 * 
 * @param {Integer} dwSessionMode 
 * @param {Integer} dwReserved 
 * @returns {IInternetSession} 
 */
export CoInternetGetSession(dwSessionMode, dwReserved) {
    result := DllCall("urlmon.dll\CoInternetGetSession", UInt32, dwSessionMode, "ptr*", &ppIInternetSession := 0, UInt32, dwReserved, "HRESULT")
    return IInternetSession(ppIInternetSession)
}

/**
 * 
 * @param {PWSTR} pwszUrl 
 * @param {PSUACTION} _psuAction 
 * @returns {PWSTR} 
 */
export CoInternetGetSecurityUrl(pwszUrl, _psuAction) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    result := DllCall("urlmon.dll\CoInternetGetSecurityUrl", "ptr", pwszUrl, PWSTR.Ptr, &ppwszSecUrl := 0, PSUACTION, _psuAction, UInt32, dwReserved, "HRESULT")
    return ppwszSecUrl
}

/**
 * 
 * @param {IUri} pUri 
 * @param {PSUACTION} _psuAction 
 * @returns {IUri} 
 */
export CoInternetGetSecurityUrlEx(pUri, _psuAction) {
    static dwReserved := 0 ;Reserved parameters must always be NULL

    result := DllCall("urlmon.dll\CoInternetGetSecurityUrlEx", "ptr", pUri, "ptr*", &ppSecUri := 0, PSUACTION, _psuAction, IntPtr, dwReserved, "HRESULT")
    return IUri(ppSecUri)
}

/**
 * 
 * @param {INTERNETFEATURELIST} FeatureEntry 
 * @param {Integer} dwFlags 
 * @param {BOOL} fEnable 
 * @returns {HRESULT} 
 */
export CoInternetSetFeatureEnabled(FeatureEntry, dwFlags, fEnable) {
    result := DllCall("urlmon.dll\CoInternetSetFeatureEnabled", INTERNETFEATURELIST, FeatureEntry, UInt32, dwFlags, BOOL, fEnable, "HRESULT")
    return result
}

/**
 * 
 * @param {INTERNETFEATURELIST} FeatureEntry 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export CoInternetIsFeatureEnabled(FeatureEntry, dwFlags) {
    result := DllCall("urlmon.dll\CoInternetIsFeatureEnabled", INTERNETFEATURELIST, FeatureEntry, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {INTERNETFEATURELIST} FeatureEntry 
 * @param {Integer} dwFlags 
 * @param {PWSTR} szURL 
 * @param {IInternetSecurityManager} pSecMgr 
 * @returns {HRESULT} 
 */
export CoInternetIsFeatureEnabledForUrl(FeatureEntry, dwFlags, szURL, pSecMgr) {
    szURL := szURL is String ? StrPtr(szURL) : szURL

    result := DllCall("urlmon.dll\CoInternetIsFeatureEnabledForUrl", INTERNETFEATURELIST, FeatureEntry, UInt32, dwFlags, "ptr", szURL, "ptr", pSecMgr, "HRESULT")
    return result
}

/**
 * 
 * @param {INTERNETFEATURELIST} FeatureEntry 
 * @param {Integer} dwFlags 
 * @param {IUri} pIUri 
 * @param {IInternetSecurityManagerEx2} pSecMgr 
 * @returns {HRESULT} 
 */
export CoInternetIsFeatureEnabledForIUri(FeatureEntry, dwFlags, pIUri, pSecMgr) {
    result := DllCall("urlmon.dll\CoInternetIsFeatureEnabledForIUri", INTERNETFEATURELIST, FeatureEntry, UInt32, dwFlags, "ptr", pIUri, "ptr", pSecMgr, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} szFromURL 
 * @param {PWSTR} szToURL 
 * @param {IInternetSecurityManager} pSecMgr 
 * @param {Integer} dwFlags 
 * @returns {HRESULT} 
 */
export CoInternetIsFeatureZoneElevationEnabled(szFromURL, szToURL, pSecMgr, dwFlags) {
    szFromURL := szFromURL is String ? StrPtr(szFromURL) : szFromURL
    szToURL := szToURL is String ? StrPtr(szToURL) : szToURL

    result := DllCall("urlmon.dll\CoInternetIsFeatureZoneElevationEnabled", "ptr", szFromURL, "ptr", szToURL, "ptr", pSecMgr, UInt32, dwFlags, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<STGMEDIUM>} pcstgmedSrc 
 * @param {Pointer<STGMEDIUM>} pstgmedDest 
 * @returns {HRESULT} 
 */
export CopyStgMedium(pcstgmedSrc, pstgmedDest) {
    result := DllCall("urlmon.dll\CopyStgMedium", STGMEDIUM.Ptr, pcstgmedSrc, STGMEDIUM.Ptr, pstgmedDest, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<BINDINFO>} pcbiSrc 
 * @param {Pointer<BINDINFO>} pbiDest 
 * @returns {HRESULT} 
 */
export CopyBindInfo(pcbiSrc, pbiDest) {
    result := DllCall("urlmon.dll\CopyBindInfo", BINDINFO.Ptr, pcbiSrc, BINDINFO.Ptr, pbiDest, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<BINDINFO>} pbindinfo 
 * @returns {String} Nothing - always returns an empty string
 */
export ReleaseBindInfo(pbindinfo) {
    DllCall("urlmon.dll\ReleaseBindInfo", BINDINFO.Ptr, pbindinfo)
}

/**
 * 
 * @returns {PWSTR} 
 */
export IEGetUserPrivateNamespaceName() {
    result := DllCall("urlmon.dll\IEGetUserPrivateNamespaceName", PWSTR)
    return result
}

/**
 * 
 * @param {IServiceProvider} pSP 
 * @param {Integer} dwReserved 
 * @returns {IInternetSecurityManager} 
 */
export CoInternetCreateSecurityManager(pSP, dwReserved) {
    result := DllCall("urlmon.dll\CoInternetCreateSecurityManager", "ptr", pSP, "ptr*", &ppSM := 0, UInt32, dwReserved, "HRESULT")
    return IInternetSecurityManager(ppSM)
}

/**
 * 
 * @param {IServiceProvider} pSP 
 * @param {Integer} dwReserved 
 * @returns {IInternetZoneManager} 
 */
export CoInternetCreateZoneManager(pSP, dwReserved) {
    result := DllCall("urlmon.dll\CoInternetCreateZoneManager", "ptr", pSP, "ptr*", &ppZM := 0, UInt32, dwReserved, "HRESULT")
    return IInternetZoneManager(ppZM)
}

/**
 * 
 * @param {PWSTR} szDistUnit 
 * @param {Pointer<SOFTDISTINFO>} psdi 
 * @returns {HRESULT} 
 */
export GetSoftwareUpdateInfo(szDistUnit, psdi) {
    szDistUnit := szDistUnit is String ? StrPtr(szDistUnit) : szDistUnit

    result := DllCall("urlmon.dll\GetSoftwareUpdateInfo", "ptr", szDistUnit, SOFTDISTINFO.Ptr, psdi, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} szDistUnit 
 * @param {Integer} dwAdState 
 * @param {Integer} dwAdvertisedVersionMS 
 * @param {Integer} dwAdvertisedVersionLS 
 * @returns {HRESULT} 
 */
export SetSoftwareUpdateAdvertisementState(szDistUnit, dwAdState, dwAdvertisedVersionMS, dwAdvertisedVersionLS) {
    szDistUnit := szDistUnit is String ? StrPtr(szDistUnit) : szDistUnit

    result := DllCall("urlmon.dll\SetSoftwareUpdateAdvertisementState", "ptr", szDistUnit, UInt32, dwAdState, UInt32, dwAdvertisedVersionMS, UInt32, dwAdvertisedVersionLS, "HRESULT")
    return result
}

/**
 * 
 * @param {PSTR} pszUrl 
 * @returns {BOOL} 
 */
export IsLoggingEnabledA(pszUrl) {
    pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

    result := DllCall("urlmon.dll\IsLoggingEnabledA", "ptr", pszUrl, BOOL)
    return result
}

/**
 * 
 * @param {PWSTR} pwszUrl 
 * @returns {BOOL} 
 */
export IsLoggingEnabledW(pwszUrl) {
    pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

    result := DllCall("urlmon.dll\IsLoggingEnabledW", "ptr", pwszUrl, BOOL)
    return result
}

/**
 * 
 * @param {Pointer<HIT_LOGGING_INFO>} lpLogginginfo 
 * @returns {BOOL} 
 */
export WriteHitLogging(lpLogginginfo) {
    result := DllCall("urlmon.dll\WriteHitLogging", HIT_LOGGING_INFO.Ptr, lpLogginginfo, BOOL)
    return result
}

;@endregion Functions
