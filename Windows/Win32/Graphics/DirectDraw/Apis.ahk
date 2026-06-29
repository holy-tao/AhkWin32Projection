#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IDirectDraw.ahk" { IDirectDraw }
#Import ".\IDirectDrawClipper.ahk" { IDirectDrawClipper }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */

;@region Functions
/**
 * This function is superseded by the DirectDrawEnumerateEx function. (Unicode)
 * @remarks
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll and then use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access the <b>DirectDrawEnumerate</b> function.
 * @param {Pointer<LPDDENUMCALLBACKW>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbacka">DDEnumCallback</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
 * @param {Pointer<Void>} lpContext Address of an application-defined context to be passed to the enumeration callback function each time that it is called.
 * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
 * 
 * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawenumeratew
 */
export DirectDrawEnumerateW(lpCallback, lpContext) {
    lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DDRAW.dll\DirectDrawEnumerateW", "ptr", lpCallback, lpContextMarshal, lpContext, "HRESULT")
    return result
}

/**
 * This function is superseded by the DirectDrawEnumerateEx function. (ANSI)
 * @remarks
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll and then use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access the <b>DirectDrawEnumerate</b> function.
 * @param {Pointer<LPDDENUMCALLBACKA>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbacka">DDEnumCallback</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
 * @param {Pointer<Void>} lpContext Address of an application-defined context to be passed to the enumeration callback function each time that it is called.
 * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
 * 
 * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawenumeratea
 */
export DirectDrawEnumerateA(lpCallback, lpContext) {
    lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DDRAW.dll\DirectDrawEnumerateA", "ptr", lpCallback, lpContextMarshal, lpContext, "HRESULT")
    return result
}

/**
 * Enumerates all DirectDraw devices that are installed on the computer. The NULL entry always identifies the primary display device that is shared with GDI. (Unicode)
 * @remarks
 * On computers with multiple monitors, <b>DirectDrawEnumerateEx</b> enumerates multiple display devices. 
 * 
 * 
 * 
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll. To retrieve the address of the <b>DirectDrawEnumerateEx</b> function, call the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> Win32 function with the "DirectDrawEnumerateExA" (ANSI) or "DirectDrawEnumerateExW" (Unicode) process name strings.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ddraw.h header defines DirectDrawEnumerateEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<LPDDENUMCALLBACKEXW>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbackexa">DDEnumCallbackEx</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
 * @param {Pointer<Void>} lpContext Address of an application-defined value to be passed to the enumeration callback function each time that it is called.
 * @param {Integer} dwFlags Flags that specify the enumeration scope. This parameter can be 0 or a combination of the following flags. If the value is 0, the function enumerates only the primary display device.
 * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
 * 
 * 
 * 
 * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawenumerateexw
 */
export DirectDrawEnumerateExW(lpCallback, lpContext, dwFlags) {
    lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DDRAW.dll\DirectDrawEnumerateExW", "ptr", lpCallback, lpContextMarshal, lpContext, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Enumerates all DirectDraw devices that are installed on the computer. The NULL entry always identifies the primary display device that is shared with GDI. (ANSI)
 * @remarks
 * On computers with multiple monitors, <b>DirectDrawEnumerateEx</b> enumerates multiple display devices. 
 * 
 * 
 * 
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll. To retrieve the address of the <b>DirectDrawEnumerateEx</b> function, call the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> Win32 function with the "DirectDrawEnumerateExA" (ANSI) or "DirectDrawEnumerateExW" (Unicode) process name strings.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ddraw.h header defines DirectDrawEnumerateEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {Pointer<LPDDENUMCALLBACKEXA>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbackexa">DDEnumCallbackEx</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
 * @param {Pointer<Void>} lpContext Address of an application-defined value to be passed to the enumeration callback function each time that it is called.
 * @param {Integer} dwFlags Flags that specify the enumeration scope. This parameter can be 0 or a combination of the following flags. If the value is 0, the function enumerates only the primary display device.
 * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
 * 
 * 
 * 
 * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawenumerateexa
 */
export DirectDrawEnumerateExA(lpCallback, lpContext, dwFlags) {
    lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

    result := DllCall("DDRAW.dll\DirectDrawEnumerateExA", "ptr", lpCallback, lpContextMarshal, lpContext, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Creates an instance of a DirectDraw object.
 * @remarks
 * This function attempts to initialize a DirectDraw object, and then sets a pointer to the object if the call succeeds.
 * 
 * On computers with multiple monitors, if you specify NULL for <i>lpGUID</i>, the DirectDraw object runs in emulation mode when the normal cooperative level is set. To make use of hardware acceleration on these computers, specify the device's GUID.
 * 
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll and then use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access the <b>DirectDrawCreate</b> function.
 * @param {Pointer<Guid>} lpGUID A pointer to the globally unique identifier (GUID) that represents the driver to be created. This can be NULL to indicate the active display driver, or you can pass one of the following flags to restrict the active display driver's behavior for debugging purposes:
 * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Presently, however, this function returns an error if this parameter is anything but NULL.
 * @returns {IDirectDraw} A pointer to a variable to be set to a valid <b>IDirectDraw</b> interface pointer if the call succeeds.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawcreate
 */
export DirectDrawCreate(lpGUID, pUnkOuter) {
    result := DllCall("DDRAW.dll\DirectDrawCreate", Guid.Ptr, lpGUID, "ptr*", &lplpDD := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectDraw(lplpDD)
}

/**
 * Creates an instance of a DirectDraw object that supports the set of Direct3D interfaces in DirectX 7.0. To use the features of Direct3D in DirectX 7.0, create a DirectDraw object with this function.
 * @remarks
 * This function attempts to initialize a DirectDraw object, and then sets a pointer to the object if the call succeeds.
 * 
 * On computers with multiple monitors, if you specify NULL for <i>lpGUID</i>, the DirectDraw object runs in emulation mode when the normal cooperative level is set. To make use of hardware acceleration on these computers, specify the device's GUID.
 * 
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll and then use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access the <b>DirectDrawCreateEx</b> function.
 * @param {Pointer<Guid>} lpGuid A pointer to the globally unique identifier (GUID) that represents the driver to be created. This can be NULL to indicate the active display driver, or you can pass one of the following flags to restrict the active display driver's behavior for debugging purposes:
 * @param {Pointer<Pointer<Void>>} lplpDD A pointer to a variable to be set to a valid <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdraw7">IDirectDraw7</a> interface pointer if the call succeeds.
 * @param {Pointer<Guid>} iid This parameter must be set to IID_IDirectDraw7. This function fails and returns DDERR_INVALIDPARAMS if any other interface is specified.
 * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Currently, this function returns an error if this parameter is not NULL.
 * @returns {HRESULT} If the function succeeds, the return value is DD_OK.
 * 
 * 
 * 
 * If it fails, the function can return one of the following error values:
 * 
 * <ul>
 * <li>DDERR_DIRECTDRAWALREADYCREATED</li>
 * <li>DDERR_GENERIC</li>
 * <li>DDERR_INVALIDDIRECTDRAWGUID</li>
 * <li>DDERR_INVALIDPARAMS</li>
 * <li>DDERR_NODIRECTDRAWHW</li>
 * <li>DDERR_OUTOFMEMORY</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawcreateex
 */
export DirectDrawCreateEx(lpGuid, lplpDD, iid, pUnkOuter) {
    lplpDDMarshal := lplpDD is VarRef ? "ptr*" : "ptr"

    result := DllCall("DDRAW.dll\DirectDrawCreateEx", Guid.Ptr, lpGuid, lplpDDMarshal, lplpDD, Guid.Ptr, iid, "ptr", pUnkOuter, "HRESULT")
    return result
}

/**
 * Creates an instance of a DirectDrawClipper object that is not associated with a DirectDraw object.
 * @remarks
 * You can call <b>DirectDrawCreateClipper</b> before any DirectDraw objects are created. Because these DirectDrawClipper objects are not owned by any DirectDraw object, they are not automatically released when an application's objects are released. If the application does not explicitly release the DirectDrawClipper objects, DirectDraw releases them when the application terminates.
 * 
 * To create a DirectDrawClipper object that is owned by a specific DirectDraw object, use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createclipper">IDirectDraw7::CreateClipper</a> method.
 * 
 * 
 * 
 * You must use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> to explicitly link to Ddraw.dll and then use <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to access the <b>DirectDrawCreateClipper</b> function.
 * @param {Integer} dwFlags Currently not used and must be set to 0.
 * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Currently, this function returns an error if this parameter is not NULL.
 * @returns {IDirectDrawClipper} Address of a pointer to be filled with the address of the new DirectDrawClipper object.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-directdrawcreateclipper
 */
export DirectDrawCreateClipper(dwFlags, pUnkOuter) {
    result := DllCall("DDRAW.dll\DirectDrawCreateClipper", "uint", dwFlags, "ptr*", &lplpDDClipper := 0, "ptr", pUnkOuter, "HRESULT")
    return IDirectDrawClipper(lplpDDClipper)
}

;@endregion Functions
