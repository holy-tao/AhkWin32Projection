#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Graphics\Direct3D9\IDirect3DDevice9.ahk" { IDirect3DDevice9 }
#Import ".\DHSURF.ahk" { DHSURF }
#Import ".\QUERY_DISPLAY_CONFIG_FLAGS.ahk" { QUERY_DISPLAY_CONFIG_FLAGS }
#Import ".\FONTINFO.ahk" { FONTINFO }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import ".\EMFINFO.ahk" { EMFINFO }
#Import ".\MC_TIMING_REPORT.ahk" { MC_TIMING_REPORT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\CLIPLINE.ahk" { CLIPLINE }
#Import ".\SET_DISPLAY_CONFIG_FLAGS.ahk" { SET_DISPLAY_CONFIG_FLAGS }
#Import ".\POINTQF.ahk" { POINTQF }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\BLENDOBJ.ahk" { BLENDOBJ }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HSEMAPHORE.ahk" { HSEMAPHORE }
#Import ".\MC_DISPLAY_TECHNOLOGY_TYPE.ahk" { MC_DISPLAY_TECHNOLOGY_TYPE }
#Import "..\..\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }
#Import ".\FD_GLYPHSET.ahk" { FD_GLYPHSET }
#Import ".\PHYSICAL_MONITOR.ahk" { PHYSICAL_MONITOR }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\ORIENTATION_PREFERENCE.ahk" { ORIENTATION_PREFERENCE }
#Import ".\MC_POSITION_TYPE.ahk" { MC_POSITION_TYPE }
#Import "..\..\Foundation\WIN32_ERROR.ahk" { WIN32_ERROR }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\RECTFX.ahk" { RECTFX }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\GLYPHPOS.ahk" { GLYPHPOS }
#Import ".\IFIMETRICS.ahk" { IFIMETRICS }
#Import ".\STROBJ.ahk" { STROBJ }
#Import ".\XFORML.ahk" { XFORML }
#Import ".\DISPLAYCONFIG_TOPOLOGY_ID.ahk" { DISPLAYCONFIG_TOPOLOGY_ID }
#Import ".\MC_SIZE_TYPE.ahk" { MC_SIZE_TYPE }
#Import ".\LINEATTRS.ahk" { LINEATTRS }
#Import ".\MC_GAIN_TYPE.ahk" { MC_GAIN_TYPE }
#Import ".\MC_DRIVE_TYPE.ahk" { MC_DRIVE_TYPE }
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\POINTFIX.ahk" { POINTFIX }
#Import ".\DISPLAYCONFIG_PATH_INFO.ahk" { DISPLAYCONFIG_PATH_INFO }
#Import ".\PATHDATA.ahk" { PATHDATA }
#Import ".\XFORMOBJ.ahk" { XFORMOBJ }
#Import ".\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk" { DISPLAYCONFIG_DEVICE_INFO_HEADER }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\ENG_TIME_FIELDS.ahk" { ENG_TIME_FIELDS }
#Import "..\..\Graphics\Gdi\TRIVERTEX.ahk" { TRIVERTEX }
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import ".\HSURF.ahk" { HSURF }
#Import ".\MC_COLOR_TEMPERATURE.ahk" { MC_COLOR_TEMPERATURE }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\FD_GLYPHATTR.ahk" { FD_GLYPHATTR }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import ".\DISPLAYCONFIG_MODE_INFO.ahk" { DISPLAYCONFIG_MODE_INFO }
#Import ".\AR_STATE.ahk" { AR_STATE }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }
#Import "..\..\Graphics\Gdi\COLORADJUSTMENT.ahk" { COLORADJUSTMENT }
#Import ".\PATHOBJ.ahk" { PATHOBJ }
#Import ".\HDEV.ahk" { HDEV }
#Import ".\MC_VCP_CODE_TYPE.ahk" { MC_VCP_CODE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Display
 */

;@region Functions
/**
 * Retrieves the number of physical monitors associated with an HMONITOR monitor handle.
 * @param {HMONITOR} _hMonitor A monitor handle. Monitor handles are returned by several Multiple Display Monitor functions, including <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-monitorfromwindow">MonitorFromWindow</a>, which are part of the graphics device interface (GDI).
 * @param {Pointer<Integer>} pdwNumberOfPhysicalMonitors Receives the number of physical monitors associated with the monitor handle.
 * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getnumberofphysicalmonitorsfromhmonitor
 * @since windows6.0.6000
 */
export GetNumberOfPhysicalMonitorsFromHMONITOR(_hMonitor, pdwNumberOfPhysicalMonitors) {
    pdwNumberOfPhysicalMonitorsMarshal := pdwNumberOfPhysicalMonitors is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetNumberOfPhysicalMonitorsFromHMONITOR", HMONITOR, _hMonitor, pdwNumberOfPhysicalMonitorsMarshal, pdwNumberOfPhysicalMonitors, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the number of physical monitors associated with a Direct3D device.
 * @param {IDirect3DDevice9} pDirect3DDevice9 Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface of the Direct3D device.
 * @returns {Integer} Receives the number of physical monitors associated with the Direct3D device.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getnumberofphysicalmonitorsfromidirect3ddevice9
 * @since windows6.0.6000
 */
export GetNumberOfPhysicalMonitorsFromIDirect3DDevice9(pDirect3DDevice9) {
    result := DllCall("dxva2.dll\GetNumberOfPhysicalMonitorsFromIDirect3DDevice9", "ptr", pDirect3DDevice9, "uint*", &pdwNumberOfPhysicalMonitors := 0, "HRESULT")
    return pdwNumberOfPhysicalMonitors
}

/**
 * Retrieves the physical monitors associated with an HMONITOR monitor handle.
 * @remarks
 * A single <b>HMONITOR</b> handle can be associated with more than one physical monitor. This function returns a handle and a text description for each physical monitor.
 *       
 * 
 * When you are done using the monitor handles, close them by passing the <i>pPhysicalMonitorArray</i> array to the <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-destroyphysicalmonitors">DestroyPhysicalMonitors</a> function.
 * @param {HMONITOR} _hMonitor A monitor handle. Monitor handles are returned by several Multiple Display Monitor functions, including <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-monitorfromwindow">MonitorFromWindow</a>, which are part of the graphics device interface (GDI).
 * @param {Integer} dwPhysicalMonitorArraySize Number of elements in <i>pPhysicalMonitorArray</i>. To get the required size of the array, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getnumberofphysicalmonitorsfromhmonitor">GetNumberOfPhysicalMonitorsFromHMONITOR</a>.
 * @param {Pointer<PHYSICAL_MONITOR>} pPhysicalMonitorArray Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor">PHYSICAL_MONITOR</a> structures. The caller must allocate the array.
 * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor
 * @since windows6.0.6000
 */
export GetPhysicalMonitorsFromHMONITOR(_hMonitor, dwPhysicalMonitorArraySize, pPhysicalMonitorArray) {
    A_LastError := 0

    result := DllCall("dxva2.dll\GetPhysicalMonitorsFromHMONITOR", HMONITOR, _hMonitor, "uint", dwPhysicalMonitorArraySize, PHYSICAL_MONITOR.Ptr, pPhysicalMonitorArray, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the physical monitors associated with a Direct3D device.
 * @remarks
 * A single Direct3D device can be associated with more than one physical monitor. This function returns a handle and a text description for each physical monitor.
 *       
 * 
 * When you are done using the monitor handles, close them by passing the <i>pPhysicalMonitorArray</i> array to the <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-destroyphysicalmonitors">DestroyPhysicalMonitors</a> function.
 * @param {IDirect3DDevice9} pDirect3DDevice9 Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> interface of the Direct3D device.
 * @param {Integer} dwPhysicalMonitorArraySize Number of elements in <i>pPhysicalMonitorArray</i>. To get the required size of the array, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getnumberofphysicalmonitorsfromidirect3ddevice9">GetNumberOfPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<PHYSICAL_MONITOR>} pPhysicalMonitorArray Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor">PHYSICAL_MONITOR</a> structures. The caller must allocate the array.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9
 * @since windows6.0.6000
 */
export GetPhysicalMonitorsFromIDirect3DDevice9(pDirect3DDevice9, dwPhysicalMonitorArraySize, pPhysicalMonitorArray) {
    result := DllCall("dxva2.dll\GetPhysicalMonitorsFromIDirect3DDevice9", "ptr", pDirect3DDevice9, "uint", dwPhysicalMonitorArraySize, PHYSICAL_MONITOR.Ptr, pPhysicalMonitorArray, "HRESULT")
    return result
}

/**
 * Closes a handle to a physical monitor.
 * @param {HANDLE} _hMonitor Handle to a physical monitor.
 * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-destroyphysicalmonitor
 * @since windows6.0.6000
 */
export DestroyPhysicalMonitor(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\DestroyPhysicalMonitor", HANDLE, _hMonitor, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Closes an array of physical monitor handles.
 * @param {Integer} dwPhysicalMonitorArraySize Number of elements in the <i>pPhysicalMonitorArray</i> array.
 * @param {Pointer<PHYSICAL_MONITOR>} pPhysicalMonitorArray Pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/ns-physicalmonitorenumerationapi-physical_monitor">PHYSICAL_MONITOR</a> structures.
 * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-destroyphysicalmonitors
 * @since windows6.0.6000
 */
export DestroyPhysicalMonitors(dwPhysicalMonitorArraySize, pPhysicalMonitorArray) {
    A_LastError := 0

    result := DllCall("dxva2.dll\DestroyPhysicalMonitors", "uint", dwPhysicalMonitorArraySize, PHYSICAL_MONITOR.Ptr, pPhysicalMonitorArray, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the current value, maximum value, and code type of a Virtual Control Panel (VCP) code for a monitor.
 * @remarks
 * This function corresponds to the "Get VCP Feature &amp; VCP Feature Reply" command from the Display Data Channel Command Interface (DDC/CI) standard. Vendor-specific VCP codes can be used with this function.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Integer} bVCPCode VCP code to query. The VCP codes are Include the VESA Monitor Control Command Set (MCCS) standard, versions 1.0 and 2.0. This parameter must specify a continuous or non-continuous VCP, or a vendor-specific code. It should not be a table control code.
 * @param {Pointer<MC_VCP_CODE_TYPE>} pvct Receives the VCP code type, as a member of the <a href="https://docs.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ne-lowlevelmonitorconfigurationapi-mc_vcp_code_type">MC_VCP_CODE_TYPE</a> enumeration. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pdwCurrentValue Receives the current value of the VCP code. This parameter can be <b>NULL</b>.
 * @param {Pointer<Integer>} pdwMaximumValue If <i>bVCPCode</i> specifies a continuous VCP code, this parameter receives the maximum value of the VCP code. If <i>bVCPCode</i> specifies a non-continuous VCP code, the value received in this parameter is undefined. This parameter can be <b>NULL</b>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getvcpfeatureandvcpfeaturereply
 * @since windows6.0.6000
 */
export GetVCPFeatureAndVCPFeatureReply(_hMonitor, bVCPCode, pvct, pdwCurrentValue, pdwMaximumValue) {
    pvctMarshal := pvct is VarRef ? "int*" : "ptr"
    pdwCurrentValueMarshal := pdwCurrentValue is VarRef ? "uint*" : "ptr"
    pdwMaximumValueMarshal := pdwMaximumValue is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetVCPFeatureAndVCPFeatureReply", HANDLE, _hMonitor, "char", bVCPCode, pvctMarshal, pvct, pdwCurrentValueMarshal, pdwCurrentValue, pdwMaximumValueMarshal, pdwMaximumValue, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the value of a Virtual Control Panel (VCP) code for a monitor.
 * @remarks
 * This function corresponds to the "Set VCP Feature" command from the Display Data Channel Command Interface (DDC/CI) standard.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Integer} bVCPCode VCP code to set. The VCP codes are defined in the VESA Monitor Control Command Set (MCCS) standard, version 1.0 and 2.0. This parameter must specify a continuous or non-continuous VCP, or a vendor-specific code. It should not be a table control code.
 * @param {Integer} dwNewValue Value of the VCP code.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call GetLastError.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-setvcpfeature
 * @since windows6.0.6000
 */
export SetVCPFeature(_hMonitor, bVCPCode, dwNewValue) {
    result := DllCall("dxva2.dll\SetVCPFeature", HANDLE, _hMonitor, "char", bVCPCode, "uint", dwNewValue, Int32)
    return result
}

/**
 * Saves the current monitor settings to the display's nonvolatile storage. (SaveCurrentSettings)
 * @remarks
 * This function corresponds to the "Save Current Settings" function from the Display Data Channel Command Interface (DDC/CI) standard.
 *       
 * 
 * This function takes about 200 milliseconds to return.
 *       
 * 
 * This low-level function is identical to the high-level function <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-savecurrentmonitorsettings">SaveCurrentMonitorSettings</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-savecurrentsettings
 * @since windows6.0.6000
 */
export SaveCurrentSettings(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SaveCurrentSettings", HANDLE, _hMonitor, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the length of a monitor's capabilities string.
 * @remarks
 * This function usually returns quickly, but sometimes it can take several seconds to complete.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<Integer>} pdwCapabilitiesStringLengthInCharacters Receives the length of the capabilities string, in characters, including the terminating null character.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
 * @since windows6.0.6000
 */
export GetCapabilitiesStringLength(_hMonitor, pdwCapabilitiesStringLengthInCharacters) {
    pdwCapabilitiesStringLengthInCharactersMarshal := pdwCapabilitiesStringLengthInCharacters is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetCapabilitiesStringLength", HANDLE, _hMonitor, pdwCapabilitiesStringLengthInCharactersMarshal, pdwCapabilitiesStringLengthInCharacters, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a string describing a monitor's capabilities.
 * @remarks
 * This function corresponds to the "Capabilities Request &amp; Capabilities Reply" command from the Display Data Channel Command Interface (DDC/CI) standard. For more information about the capabilities string, refer to the DDC/CI standard.
 *       
 * 
 * This function usually returns quickly, but sometimes it can take several seconds to complete.
 *       
 * 
 * You can update a monitor's capabilities string by adding an <i>AddReg</i> directive to the monitor's INF file. Add a registry key named "CapabilitiesString" to the monitor's driver key. The value of the registry key is the capabilities string. The registry data type is REG_SZ.
 * 
 * 
 * ``` syntax
 * HKR,,"CapabilitiesString",0x00000000,"updated capabilities string"
 * 
 * ```
 * 
 * <div class="alert"><b>Warning</b>  Do not modify a monitor's INF file unless you are familiar with the layout of INF files and also understand the DDC/CI standard.</div>
 * <div> </div>
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {PSTR} pszASCIICapabilitiesString Pointer to a buffer that receives the monitor's capabilities string. The caller must allocate this buffer. To get the size of the string, call <a href="https://docs.microsoft.com/windows/desktop/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength">GetCapabilitiesStringLength</a>. The capabilities string is always an ASCII string. The buffer must include space for the terminating null character.
 * @param {Integer} dwCapabilitiesStringLengthInCharacters Size of <i>pszASCIICapabilitiesString</i> in characters, including the terminating null character.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-capabilitiesrequestandcapabilitiesreply
 * @since windows6.0.6000
 */
export CapabilitiesRequestAndCapabilitiesReply(_hMonitor, pszASCIICapabilitiesString, dwCapabilitiesStringLengthInCharacters) {
    pszASCIICapabilitiesString := pszASCIICapabilitiesString is String ? StrPtr(pszASCIICapabilitiesString) : pszASCIICapabilitiesString

    A_LastError := 0

    result := DllCall("dxva2.dll\CapabilitiesRequestAndCapabilitiesReply", HANDLE, _hMonitor, "ptr", pszASCIICapabilitiesString, "uint", dwCapabilitiesStringLengthInCharacters, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's horizontal and vertical synchronization frequencies.
 * @remarks
 * This function corresponds to the "Get Timing Report &amp; Timing Message" command from the Display Data Channel Command Interface (DDC/CI) standard. For more information about the timing information, refer to the DDC/CI standard.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<MC_TIMING_REPORT>} pmtrMonitorTimingReport Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/ns-lowlevelmonitorconfigurationapi-mc_timing_report">MC_TIMING_REPORT</a> structure that receives the timing information.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-gettimingreport
 * @since windows6.0.6000
 */
export GetTimingReport(_hMonitor, pmtrMonitorTimingReport) {
    A_LastError := 0

    result := DllCall("dxva2.dll\GetTimingReport", HANDLE, _hMonitor, MC_TIMING_REPORT.Ptr, pmtrMonitorTimingReport, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the configuration capabilities of a monitor. Call this function to find out which high-level monitor configuration functions are supported by the monitor.
 * @remarks
 * The capabilities flags returned in <i>pdwMonitorCapabilities</i> specify which high-level monitor configuration functions are supported by the monitor. They also specify how certain functions behave. The following capabilities flags are defined.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_BRIGHTNESS</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness">GetMonitorBrightness</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorbrightness">SetMonitorBrightness</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_COLOR_TEMPERATURE</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcolortemperature">GetMonitorColorTemperature</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorcolortemperature">SetMonitorColorTemperature</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_CONTRAST</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcontrast">GetMonitorContrast</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorcontrast">SetMonitorContrast</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_DEGAUSS</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-degaussmonitor">DegaussMonitor</a> function.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_DISPLAY_AREA_POSITION</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareaposition">GetMonitorDisplayAreaPosition</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitordisplayareaposition">SetMonitorDisplayAreaPosition</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_DISPLAY_AREA_SIZE</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareasize">GetMonitorDisplayAreaSize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitordisplayareasize">SetMonitorDisplayAreaSize</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_MONITOR_TECHNOLOGY_TYPE</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitortechnologytype">GetMonitorTechnologyType</a> function.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_NONE</b></td>
 * <td>The monitor does not support any monitor settings.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_RED_GREEN_BLUE_DRIVE</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluedrive">GetMonitorRedGreenOrBlueDrive</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorredgreenorbluedrive">SetMonitorRedGreenOrBlueDrive</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_RED_GREEN_BLUE_GAIN</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluegain">GetMonitorRedGreenOrBlueGain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorredgreenorbluegain">SetMonitorRedGreenOrBlueGain</a> functions.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_RESTORE_FACTORY_COLOR_DEFAULTS</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-restoremonitorfactorycolordefaults">RestoreMonitorFactoryColorDefaults</a> function.</td>
 * </tr>
 * <tr>
 * <td><b>MC_CAPS_RESTORE_FACTORY_DEFAULTS</b></td>
 * <td>The monitor supports the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-restoremonitorfactorydefaults">RestoreMonitorFactoryDefaults</a> function.</td>
 * </tr>
 * <tr>
 * <td><b>MC_RESTORE_FACTORY_DEFAULTS_ENABLES_MONITOR_SETTINGS</b></td>
 * <td>If this flag is present, calling the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-restoremonitorfactorydefaults">RestoreMonitorFactoryDefaults</a> function enables all of the monitor settings used by the high-level monitor configuration functions. For more information, see the Remarks section in <b>RestoreMonitorFactoryDefaults</b>.</td>
 * </tr>
 * </table>
 *  
 * 
 * The color temperature flags returned in <i>pdwSupportedColorTemperatures</i> specify which color temperatures are supported by the monitor. The following color temperature flags are defined.
 * 
 * <table>
 * <tr>
 * <th>Value
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_NONE</b></td>
 * <td>No color temperatures are supported.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_4000K</b></td>
 * <td>The monitor supports 4,000 kelvins (K) color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_5000K</b></td>
 * <td>The monitor supports 5,000 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_6500K</b></td>
 * <td>The monitor supports 6,500 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_7500K</b></td>
 * <td>The monitor supports 7,500 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_8200K</b></td>
 * <td>The monitor supports 8,200 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_9300K</b></td>
 * <td>The monitor supports 9,300 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_10000K</b></td>
 * <td>The monitor supports 10,000 K color temperature.</td>
 * </tr>
 * <tr>
 * <td><b>MC_SUPPORTED_COLOR_TEMPERATURE_11500K</b></td>
 * <td>The monitor supports 11,500 K color temperature.</td>
 * </tr>
 * </table>
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<Integer>} pdwMonitorCapabilities Receives a bitwise <b>OR</b> of capabilities flags. See Remarks.
 * @param {Pointer<Integer>} pdwSupportedColorTemperatures Receives a bitwise <b>OR</b> of color temperature flags. See Remarks.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <b>GetLastError</b>.
 * 
 * The function fails if the monitor does not support DDC/CI.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities
 * @since windows6.0.6000
 */
export GetMonitorCapabilities(_hMonitor, pdwMonitorCapabilities, pdwSupportedColorTemperatures) {
    pdwMonitorCapabilitiesMarshal := pdwMonitorCapabilities is VarRef ? "uint*" : "ptr"
    pdwSupportedColorTemperaturesMarshal := pdwSupportedColorTemperatures is VarRef ? "uint*" : "ptr"

    result := DllCall("dxva2.dll\GetMonitorCapabilities", HANDLE, _hMonitor, pdwMonitorCapabilitiesMarshal, pdwMonitorCapabilities, pdwSupportedColorTemperaturesMarshal, pdwSupportedColorTemperatures, Int32)
    return result
}

/**
 * Saves the current monitor settings to the display's nonvolatile storage. (SaveCurrentMonitorSettings)
 * @remarks
 * This function takes about 200 milliseconds to return.
 *       
 * 
 * This high-level function is identical to the low-level function <a href="https://docs.microsoft.com/windows/desktop/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-savecurrentsettings">SaveCurrentSettings</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-savecurrentmonitorsettings
 * @since windows6.0.6000
 */
export SaveCurrentMonitorSettings(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SaveCurrentMonitorSettings", HANDLE, _hMonitor, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves the type of technology used by a monitor.
 * @remarks
 * This function does not support every display technology. If a monitor uses a display technology that is supported by this function, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DISPLAY_TECHNOLOGY_TYPE flag. If that flag is absent, the <b>GetMonitorTechnologyType</b> function fails.
 *       
 * 
 * Some monitor technologies do not support certain monitor configuration functions. For example, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-degaussmonitor">DegaussMonitor</a> function is supported only for cathode ray tube (CRT) monitors. To find out whether a specific function is supported, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<MC_DISPLAY_TECHNOLOGY_TYPE>} pdtyDisplayTechnologyType Receives the technology type, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_display_technology_type">MC_DISPLAY_TECHNOLOGY_TYPE</a> enumeration.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitortechnologytype
 * @since windows6.0.6000
 */
export GetMonitorTechnologyType(_hMonitor, pdtyDisplayTechnologyType) {
    pdtyDisplayTechnologyTypeMarshal := pdtyDisplayTechnologyType is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorTechnologyType", HANDLE, _hMonitor, pdtyDisplayTechnologyTypeMarshal, pdtyDisplayTechnologyType, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's minimum, maximum, and current brightness settings.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<Integer>} pdwMinimumBrightness Receives the monitor's minimum brightness.
 * @param {Pointer<Integer>} pdwCurrentBrightness Receives the monitor's current brightness.
 * @param {Pointer<Integer>} pdwMaximumBrightness Receives the monitor's maximum brightness.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness
 * @since windows6.0.6000
 */
export GetMonitorBrightness(_hMonitor, pdwMinimumBrightness, pdwCurrentBrightness, pdwMaximumBrightness) {
    pdwMinimumBrightnessMarshal := pdwMinimumBrightness is VarRef ? "uint*" : "ptr"
    pdwCurrentBrightnessMarshal := pdwCurrentBrightness is VarRef ? "uint*" : "ptr"
    pdwMaximumBrightnessMarshal := pdwMaximumBrightness is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorBrightness", HANDLE, _hMonitor, pdwMinimumBrightnessMarshal, pdwMinimumBrightness, pdwCurrentBrightnessMarshal, pdwCurrentBrightness, pdwMaximumBrightnessMarshal, pdwMaximumBrightness, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's minimum, maximum, and current contrast settings.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_CONTRAST flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<Integer>} pdwMinimumContrast Receives the monitor's minimum contrast.
 * @param {Pointer<Integer>} pdwCurrentContrast Receives the monitor's current contrast.
 * @param {Pointer<Integer>} pdwMaximumContrast Receives the monitor's maximum contrast.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcontrast
 * @since windows6.0.6000
 */
export GetMonitorContrast(_hMonitor, pdwMinimumContrast, pdwCurrentContrast, pdwMaximumContrast) {
    pdwMinimumContrastMarshal := pdwMinimumContrast is VarRef ? "uint*" : "ptr"
    pdwCurrentContrastMarshal := pdwCurrentContrast is VarRef ? "uint*" : "ptr"
    pdwMaximumContrastMarshal := pdwMaximumContrast is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorContrast", HANDLE, _hMonitor, pdwMinimumContrastMarshal, pdwMinimumContrast, pdwCurrentContrastMarshal, pdwCurrentContrast, pdwMaximumContrastMarshal, pdwMaximumContrast, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's current color temperature.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_COLOR_TEMPERATURE flag.
 *       
 * 
 * This function takes between 0 and 80 milliseconds to return.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Pointer<MC_COLOR_TEMPERATURE>} pctCurrentColorTemperature Receives the monitor's current color temperature, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_color_temperature">MC_COLOR_TEMPERATURE</a> enumeration.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcolortemperature
 * @since windows6.0.6000
 */
export GetMonitorColorTemperature(_hMonitor, pctCurrentColorTemperature) {
    pctCurrentColorTemperatureMarshal := pctCurrentColorTemperature is VarRef ? "int*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorColorTemperature", HANDLE, _hMonitor, pctCurrentColorTemperatureMarshal, pctCurrentColorTemperature, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's red, green, or blue drive value.
 * @remarks
 * Drive settings are generally used to adjust the monitor's white point. <i>Drive</i> and <i>black level</i> are different names for the same monitor setting. If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RED_GREEN_BLUE_DRIVE flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The drive settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_DRIVE_TYPE} dtDriveType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_drive_type">MC_DRIVE_TYPE</a> enumeration, specifying whether to retrieve the red, green, or blue drive value.
 * @param {Pointer<Integer>} pdwMinimumDrive Receives the minimum red, green, or blue drive value.
 * @param {Pointer<Integer>} pdwCurrentDrive Receives the current red, green, or blue drive value.
 * @param {Pointer<Integer>} pdwMaximumDrive Receives the maximum red, green, or blue drive value.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluedrive
 * @since windows6.0.6000
 */
export GetMonitorRedGreenOrBlueDrive(_hMonitor, dtDriveType, pdwMinimumDrive, pdwCurrentDrive, pdwMaximumDrive) {
    pdwMinimumDriveMarshal := pdwMinimumDrive is VarRef ? "uint*" : "ptr"
    pdwCurrentDriveMarshal := pdwCurrentDrive is VarRef ? "uint*" : "ptr"
    pdwMaximumDriveMarshal := pdwMaximumDrive is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorRedGreenOrBlueDrive", HANDLE, _hMonitor, MC_DRIVE_TYPE, dtDriveType, pdwMinimumDriveMarshal, pdwMinimumDrive, pdwCurrentDriveMarshal, pdwCurrentDrive, pdwMaximumDriveMarshal, pdwMaximumDrive, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's red, green, or blue gain value.
 * @remarks
 * Gain settings are generally used to adjust the monitor's white point.
 *       
 * 
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RED_GREEN_BLUE_GAIN flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The gain settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_GAIN_TYPE} gtGainType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_gain_type">MC_GAIN_TYPE</a> enumeration, specifying whether to retrieve the red, green, or blue gain value.
 * @param {Pointer<Integer>} pdwMinimumGain Receives the minimum red, green, or blue gain value.
 * @param {Pointer<Integer>} pdwCurrentGain Receives the current red, green, or blue gain value.
 * @param {Pointer<Integer>} pdwMaximumGain Receives the maximum red, green, or blue gain value.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluegain
 * @since windows6.0.6000
 */
export GetMonitorRedGreenOrBlueGain(_hMonitor, gtGainType, pdwMinimumGain, pdwCurrentGain, pdwMaximumGain) {
    pdwMinimumGainMarshal := pdwMinimumGain is VarRef ? "uint*" : "ptr"
    pdwCurrentGainMarshal := pdwCurrentGain is VarRef ? "uint*" : "ptr"
    pdwMaximumGainMarshal := pdwMaximumGain is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorRedGreenOrBlueGain", HANDLE, _hMonitor, MC_GAIN_TYPE, gtGainType, pdwMinimumGainMarshal, pdwMinimumGain, pdwCurrentGainMarshal, pdwCurrentGain, pdwMaximumGainMarshal, pdwMaximumGain, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a monitor's brightness value.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_BRIGHTNESS flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Integer} dwNewBrightness Brightness value. To get the monitor's minimum and maximum brightness values, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorbrightness">GetMonitorBrightness</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorbrightness
 * @since windows6.0.6000
 */
export SetMonitorBrightness(_hMonitor, dwNewBrightness) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SetMonitorBrightness", HANDLE, _hMonitor, "uint", dwNewBrightness, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a monitor's contrast value.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_CONTRAST flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * The brightness setting is a continuous monitor setting. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {Integer} dwNewContrast Contrast value. To get the monitor's minimum and maximum contrast values, call, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcontrast">GetMonitorContrast</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorcontrast
 * @since windows6.0.6000
 */
export SetMonitorContrast(_hMonitor, dwNewContrast) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SetMonitorContrast", HANDLE, _hMonitor, "uint", dwNewContrast, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a monitor's color temperature.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_COLOR_TEMPERATURE flag. The <b>GetMonitorCapabilities</b> function also returns the range of color temperatures that the monitor supports. The <i>ctCurrentColorTemperature</i> parameter must correspond to one of these values.
 *       
 * 
 * Changing the color temperature changes the monitor's white point. It can also change the current drive and gain settings. To get the new drive and gain settings, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluedrive">GetMonitorRedGreenOrBlueDrive</a> and <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluegain">GetMonitorRedGreenOrBlueGain</a>, respectively.
 *       
 * 
 * This function takes from 50 to 90 milliseconds to return.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_COLOR_TEMPERATURE} ctCurrentColorTemperature Color temperature, specified as a member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_color_temperature">MC_COLOR_TEMPERATURE</a> enumeration.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorcolortemperature
 * @since windows6.0.6000
 */
export SetMonitorColorTemperature(_hMonitor, ctCurrentColorTemperature) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SetMonitorColorTemperature", HANDLE, _hMonitor, MC_COLOR_TEMPERATURE, ctCurrentColorTemperature, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets a monitor's red, green, or blue drive value.
 * @remarks
 * Drive settings are generally used to adjust the monitor's white point. <i>Drive</i> and <i>black level</i> are different names for the same monitor setting.
 *       
 * 
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RED_GREEN_BLUE_DRIVE flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * Changing the drive settings can change the color temperature. To get the new color temperature, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcolortemperature">GetMonitorColorTemperature</a>.
 *       
 * 
 * The drive settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_DRIVE_TYPE} dtDriveType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_drive_type">MC_DRIVE_TYPE</a> enumeration, specifying whether to set the red, green, or blue drive value.
 * @param {Integer} dwNewDrive Red, green, or blue drive value. To get the monitor's minimum and maximum drive values, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluedrive">GetMonitorRedGreenOrBlueDrive</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call GetLastError.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorredgreenorbluedrive
 * @since windows6.0.6000
 */
export SetMonitorRedGreenOrBlueDrive(_hMonitor, dtDriveType, dwNewDrive) {
    result := DllCall("dxva2.dll\SetMonitorRedGreenOrBlueDrive", HANDLE, _hMonitor, MC_DRIVE_TYPE, dtDriveType, "uint", dwNewDrive, Int32)
    return result
}

/**
 * Sets a monitor's red, green, or blue gain value.
 * @remarks
 * Gain settings are generally used to adjust the monitor's white point.
 *       
 * 
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RED_GREEN_BLUE_GAIN flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * Changing the gain settings can change the color temperature. To get the new color temperature, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcolortemperature">GetMonitorColorTemperature</a>.
 *       
 * 
 * The gain settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_GAIN_TYPE} gtGainType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_gain_type">MC_GAIN_TYPE</a> enumeration, specifying whether to set the red, green, or blue gain.
 * @param {Integer} dwNewGain Red, green, or blue gain value. To get the monitor's minimum and maximum gain values, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorredgreenorbluegain">GetMonitorRedGreenOrBlueGain</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call GetLastError.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitorredgreenorbluegain
 * @since windows6.0.6000
 */
export SetMonitorRedGreenOrBlueGain(_hMonitor, gtGainType, dwNewGain) {
    result := DllCall("dxva2.dll\SetMonitorRedGreenOrBlueGain", HANDLE, _hMonitor, MC_GAIN_TYPE, gtGainType, "uint", dwNewGain, Int32)
    return result
}

/**
 * Degausses a monitor.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DEGAUSS flag. Degaussing is supported only by cathode ray tube (CRT) monitors.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * This function should not be called frequently, because calling it frequently will not noticeably improve the monitor's image quality or color fidelity.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-degaussmonitor
 * @since windows6.0.6000
 */
export DegaussMonitor(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\DegaussMonitor", HANDLE, _hMonitor, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's minimum, maximum, and current width or height.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DISPLAY_AREA_SIZE flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The width and height settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_SIZE_TYPE} stSizeType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_size_type">MC_SIZE_TYPE</a> enumeration, specifying whether to retrieve the width or the height.
 * @param {Pointer<Integer>} pdwMinimumWidthOrHeight Receives the minimum width or height.
 * @param {Pointer<Integer>} pdwCurrentWidthOrHeight Receives the current width or height.
 * @param {Pointer<Integer>} pdwMaximumWidthOrHeight Receives the maximum width or height.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareasize
 * @since windows6.0.6000
 */
export GetMonitorDisplayAreaSize(_hMonitor, stSizeType, pdwMinimumWidthOrHeight, pdwCurrentWidthOrHeight, pdwMaximumWidthOrHeight) {
    pdwMinimumWidthOrHeightMarshal := pdwMinimumWidthOrHeight is VarRef ? "uint*" : "ptr"
    pdwCurrentWidthOrHeightMarshal := pdwCurrentWidthOrHeight is VarRef ? "uint*" : "ptr"
    pdwMaximumWidthOrHeightMarshal := pdwMaximumWidthOrHeight is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorDisplayAreaSize", HANDLE, _hMonitor, MC_SIZE_TYPE, stSizeType, pdwMinimumWidthOrHeightMarshal, pdwMinimumWidthOrHeight, pdwCurrentWidthOrHeightMarshal, pdwCurrentWidthOrHeight, pdwMaximumWidthOrHeightMarshal, pdwMaximumWidthOrHeight, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves a monitor's minimum, maximum, and current horizontal or vertical position.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DISPLAY_AREA_POSITION flag.
 *       
 * 
 * This function takes about 40 milliseconds to return.
 *       
 * 
 * The horizontal and vertical position are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_POSITION_TYPE} ptPositionType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_position_type">MC_POSITION_TYPE</a> enumeration, specifying whether to retrieve the horizontal position or the vertical position.
 * @param {Pointer<Integer>} pdwMinimumPosition Receives the minimum horizontal or vertical position.
 * @param {Pointer<Integer>} pdwCurrentPosition Receives the current horizontal or vertical position.
 * @param {Pointer<Integer>} pdwMaximumPosition Receives the maximum horizontal or vertical position.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareaposition
 * @since windows6.0.6000
 */
export GetMonitorDisplayAreaPosition(_hMonitor, ptPositionType, pdwMinimumPosition, pdwCurrentPosition, pdwMaximumPosition) {
    pdwMinimumPositionMarshal := pdwMinimumPosition is VarRef ? "uint*" : "ptr"
    pdwCurrentPositionMarshal := pdwCurrentPosition is VarRef ? "uint*" : "ptr"
    pdwMaximumPositionMarshal := pdwMaximumPosition is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("dxva2.dll\GetMonitorDisplayAreaPosition", HANDLE, _hMonitor, MC_POSITION_TYPE, ptPositionType, pdwMinimumPositionMarshal, pdwMinimumPosition, pdwCurrentPositionMarshal, pdwCurrentPosition, pdwMaximumPositionMarshal, pdwMaximumPosition, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the width or height of a monitor's display area.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DISPLAY_AREA_SIZE flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * The width and height settings are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_SIZE_TYPE} stSizeType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_size_type">MC_SIZE_TYPE</a> enumeration, specifying whether to set the width or the height.
 * @param {Integer} dwNewDisplayAreaWidthOrHeight Display area width or height. To get the minimum and maximum width and height, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareasize">GetMonitorDisplayAreaSize</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitordisplayareasize
 * @since windows6.0.6000
 */
export SetMonitorDisplayAreaSize(_hMonitor, stSizeType, dwNewDisplayAreaWidthOrHeight) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SetMonitorDisplayAreaSize", HANDLE, _hMonitor, MC_SIZE_TYPE, stSizeType, "uint", dwNewDisplayAreaWidthOrHeight, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets the horizontal or vertical position of a monitor's display area.
 * @remarks
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_DISPLAY_AREA_POSITION flag.
 *       
 * 
 * This function takes about 50 milliseconds to return.
 *       
 * 
 * The horizontal and vertical position are continuous monitor settings. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Monitor/using-the-high-level-monitor-configuration-functions">Using the High-Level Monitor Configuration Functions</a>.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @param {MC_POSITION_TYPE} ptPositionType A member of the <a href="https://docs.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/ne-highlevelmonitorconfigurationapi-mc_position_type">MC_POSITION_TYPE</a> enumeration, specifying whether to set the horizontal position or the vertical position.
 * @param {Integer} dwNewPosition Horizontal or vertical position. To get the minimum and maximum position, call <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitordisplayareaposition">GetMonitorDisplayAreaPosition</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-setmonitordisplayareaposition
 * @since windows6.0.6000
 */
export SetMonitorDisplayAreaPosition(_hMonitor, ptPositionType, dwNewPosition) {
    A_LastError := 0

    result := DllCall("dxva2.dll\SetMonitorDisplayAreaPosition", HANDLE, _hMonitor, MC_POSITION_TYPE, ptPositionType, "uint", dwNewPosition, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Restores a monitor's color settings to their factory defaults.
 * @remarks
 * This function potentially changes the current value of the monitor's brightness, contrast, color temperature, drive, and gain. The current value of each setting is changed to its factory default. The default settings depend on the manufacturer. This function can also change the range of supported values for each of these settings. The function does not enable any monitor settings that were disabled.
 *       
 * 
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RESTORE_FACTORY_COLOR_DEFAULTS flag. This function takes about 5 seconds to return.
 *       
 * 
 * This function might reset monitor settings that are not accessible through the high-level monitor configuration functions. Whether this occurs depends on the specific model of monitor.
 *       
 * 
 * The following settings are not affected by this function:
 * 
 * <ul>
 * <li>Display area size</li>
 * <li>Display area position</li>
 * <li>Capabilities flags</li>
 * </ul>
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-restoremonitorfactorycolordefaults
 * @since windows6.0.6000
 */
export RestoreMonitorFactoryColorDefaults(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\RestoreMonitorFactoryColorDefaults", HANDLE, _hMonitor, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Restores a monitor's settings to their factory defaults.
 * @remarks
 * This function restores all of the settings that are supported by the high-level monitor configuration functions. It might also restore settings that are available only through the low-level functions and are not supported by the high-level functions. The current value of each setting is changed to its factory default. The exact settings that change, and the default values of those settings, depend on the manufacturer. This function can also change the range of supported values for some settings.
 *       
 * 
 * If this function is supported, the <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> function returns the MC_CAPS_RESTORE_FACTORY_DEFAULTS flag.
 *       
 * 
 * This function takes about 5 seconds to return.
 *       
 * 
 * If <a href="https://docs.microsoft.com/windows/desktop/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-getmonitorcapabilities">GetMonitorCapabilities</a> returns the MC_RESTORE_FACTORY_DEFAULTS_ENABLES_MONITOR_SETTINGS flag, this function also enables all of the monitor settings that are supported by the high-level functions. It is sometimes possible for an application to disable certain settings by calling the low-level functions. It is also possible for the user to disable certain settings by adjusting settings on the monitor's physical control panel. If that happens, the setting can only be re-enabled through the control panel or by calling <b>RestoreMonitorFactoryDefaults</b>. It is not possible to disable any settings by using the high-level functions.
 * @param {HANDLE} _hMonitor Handle to a physical monitor. To get the monitor handle, call <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromhmonitor">GetPhysicalMonitorsFromHMONITOR</a> or <a href="https://docs.microsoft.com/windows/desktop/api/physicalmonitorenumerationapi/nf-physicalmonitorenumerationapi-getphysicalmonitorsfromidirect3ddevice9">GetPhysicalMonitorsFromIDirect3DDevice9</a>.
 * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
 * @see https://learn.microsoft.com/windows/win32/api/highlevelmonitorconfigurationapi/nf-highlevelmonitorconfigurationapi-restoremonitorfactorydefaults
 * @since windows6.0.6000
 */
export RestoreMonitorFactoryDefaults(_hMonitor) {
    A_LastError := 0

    result := DllCall("dxva2.dll\RestoreMonitorFactoryDefaults", HANDLE, _hMonitor, Int32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BRUSHOBJ_pvAllocRbrush function allocates memory for the driver's realization of a specified brush.
 * @remarks
 * <b>BRUSHOBJ_pvAllocRbrush</b> allocates memory for the brush realization. GDI manages the memory and discards it when the brush is no longer needed.
 * 
 * This function should be called only by an implementation of a brush realization following a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvrealizebrush">DrvRealizeBrush</a>.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure for which the realization is to be allocated.
 * @param {Integer} cj Specifies the size, in bytes, required for the realization.
 * @returns {Pointer<Void>} The return value is a pointer to the allocated memory if the function is successful. Otherwise, it is null, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-brushobj_pvallocrbrush
 * @since windows5.0
 */
export BRUSHOBJ_pvAllocRbrush(pbo, cj) {
    result := DllCall("GDI32.dll\BRUSHOBJ_pvAllocRbrush", BRUSHOBJ.Ptr, pbo, "uint", cj, IntPtr)
    return result
}

/**
 * The BRUSHOBJ_pvGetRbrush function retrieves a pointer to the driver's realization of a specified brush.
 * @remarks
 * <b>BRUSHOBJ_pvGetRbrush</b> is called when the brush is a pattern brush that has not yet been realized; that is, it is called when the <b>iSolidColor</b> member of the BRUSHOBJ structure is 0xFFFFFFFF and the <b>pvRbrush</b> member is null.
 * 
 * If the brush has not been realized when <b>BRUSHOBJ_pvGetRbrush</b> is called, GDI calls the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvrealizebrush">DrvRealizeBrush</a> function to obtain the driver's realization of the brush. As an acceleration, GDI caches this realization in the <b>pvRbrush</b> member of the BRUSHOBJ structure. Then, when an application reuses this brush for another drawing operation, the driver doesn't have to call <b>BRUSHOBJ_pvGetRbrush</b> again.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure whose realization is requested.
 * @returns {Pointer<Void>} The return value is a pointer to the realized brush if the function is successful. If the brush cannot be realized, the return value is null and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-brushobj_pvgetrbrush
 * @since windows5.0
 */
export BRUSHOBJ_pvGetRbrush(pbo) {
    result := DllCall("GDI32.dll\BRUSHOBJ_pvGetRbrush", BRUSHOBJ.Ptr, pbo, IntPtr)
    return result
}

/**
 * The BRUSHOBJ_ulGetBrushColor function returns the RGB color of the specified solid brush.
 * @remarks
 * The color stored in the <b>iSolidColor</b> member of the BRUSHOBJ structure is an index value that has been translated to the target surface's palette. <b>BRUSHOBJ_ulGetBrushColor</b> allows the driver to query the original RGB color value of <b>iSolidColor</b>.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure whose color is being queried.
 * @returns {Integer} <b>BRUSHOBJ_ulGetBrushColor</b> returns the RGB color of a solid brush. If the specified brush is not solid, this function returns -1.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-brushobj_ulgetbrushcolor
 * @since windows5.0
 */
export BRUSHOBJ_ulGetBrushColor(pbo) {
    result := DllCall("GDI32.dll\BRUSHOBJ_ulGetBrushColor", BRUSHOBJ.Ptr, pbo, UInt32)
    return result
}

/**
 * The BRUSHOBJ_hGetColorTransform function retrieves the color transform for the specified brush.
 * @remarks
 * <b>BRUSHOBJ_hGetColorTransform</b> returns <b>NULL</b> when ICM is disabled.
 * 
 * The color transform for a translation object is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_hgetcolortransform">XLATEOBJ_hGetColorTransform</a>.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure whose color transform is being queried. The color transform was created in a prior call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvicmcreatecolortransform">DrvIcmCreateColorTransform</a>.
 * @returns {HANDLE} <b>BRUSHOBJ_hGetColorTransform</b> returns a handle to the color transform for the specified BRUSHOBJ structure upon success. Otherwise, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-brushobj_hgetcolortransform
 * @since windows5.0
 */
export BRUSHOBJ_hGetColorTransform(pbo) {
    result := DllCall("GDI32.dll\BRUSHOBJ_hGetColorTransform", BRUSHOBJ.Ptr, pbo, HANDLE.Owned)
    return result
}

/**
 * The CLIPOBJ_cEnumStart function sets parameters for enumerating rectangles in a specified clip region.
 * @remarks
 * A region can be enumerated whether this function is called. By default, the driver only enumerates relevant rectangles, starting at the upper left.
 * 
 * The driver can restart enumeration by calling this function again.
 * @param {Pointer<CLIPOBJ>} pco Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that defines the clip region to be enumerated.
 * @param {BOOL} bAll Specifies whether the entire region should be enumerated. This parameter is <b>TRUE</b> if the whole region should be enumerated. It is <b>FALSE</b> if only the parts relevant to the present drawing operation should be enumerated.
 * 
 * A driver that caches clip regions must enumerate the entire region.
 * @param {Integer} iType Specifies the data structures that are to be written by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-clipobj_benum">CLIPOBJ_bEnum</a>. This parameter currently must be CT_RECTANGLES, indicating that the region is to be enumerated as a list of rectangles.
 * @param {Integer} iDirection Determines the order in which the rectangles are to be enumerated. This order can be essential if a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvbitblt">DrvBitBlt</a> operation is executing concurrently on the same surface. If the order is not relevant to the device driver, CD_ANY should be specified for complex regions, allowing GDI to optimize the enumeration. This value can be one of the following:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * CD_ANY
 * 
 * </td>
 * <td>
 * Any order convenient for GDI.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * CD_LEFTDOWN
 * 
 * </td>
 * <td>
 * Right to left, top to bottom.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * CD_LEFTUP
 * 
 * </td>
 * <td>
 * Right to left, bottom to top.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * CD_RIGHTDOWN
 * 
 * </td>
 * <td>
 * Left to right, top to bottom.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * CD_RIGHTUP
 * 
 * </td>
 * <td>
 * Left to right, bottom to top.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} cLimit Specifies the maximum number of rectangles to be enumerated. If this parameter is zero, counting is omitted.
 * @returns {Integer} The return value is the count of enumerated rectangles. If the count exceeds <b>cLimit</b>, the return value is 0xFFFFFFFF.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-clipobj_cenumstart
 * @since windows5.0
 */
export CLIPOBJ_cEnumStart(pco, bAll, iType, iDirection, cLimit) {
    result := DllCall("GDI32.dll\CLIPOBJ_cEnumStart", CLIPOBJ.Ptr, pco, BOOL, bAll, "uint", iType, "uint", iDirection, "uint", cLimit, UInt32)
    return result
}

/**
 * The CLIPOBJ_bEnum function enumerates a batch of rectangles from a specified clip region; a prior call to CLIPOBJ_cEnumStart determines the order of enumeration.
 * @remarks
 * A possible loop structure for calling this function follows:
 * 
 * 
 * ```
 * do {
 *     bMore = CLIPOBJ_bEnum(pco, sizeof(buffer), &buffer.c);
 *     for (i = 0; i < buffer.c; i++) {
 *         .
 *         .
 *         .
 *     }
 * } while (bMore);
 * ```
 * 
 * 
 * The count of objects written to the buffer is written to the buffer itself.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure describing the clip region that is to be enumerated.
 * @param {Integer} cj Specifies the size, in bytes, of the buffer pointed to by <i>pv</i>.
 * @param {Pointer<Integer>} pul Pointer to the buffer that will receive data about the clip region in an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-enumrects">ENUMRECTS</a> structure.
 * @returns {BOOL} The return value is <b>TRUE</b> if the driver must call this function again for more enumeration data, or <b>FALSE</b> if the enumeration is complete. It is possible for <b>CLIPOBJ_bEnum</b> to return <b>TRUE</b> with the number of clipping rectangles equal to zero. In such cases, the driver should call <b>CLIPOBJ_bEnum</b> again without taking any action.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-clipobj_benum
 * @since windows5.0
 */
export CLIPOBJ_bEnum(pco, cj, pul) {
    pulMarshal := pul is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\CLIPOBJ_bEnum", CLIPOBJ.Ptr, pco, "uint", cj, pulMarshal, pul, BOOL)
    return result
}

/**
 * The CLIPOBJ_ppoGetPath function creates a PATHOBJ structure that contains the outline of the specified clip region.
 * @remarks
 * The returned PATHOBJ structure should be deleted using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeletepath">EngDeletePath</a> when the driver no longer needs it.
 * 
 * A driver for a device that can download a clipping path might prefer this function for defining complex regions.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that defines the specified clip region.
 * @returns {Pointer<PATHOBJ>} The return value is a pointer to a PATHOBJ structure if the function is successful. Otherwise, it is <b>NULL</b>, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-clipobj_ppogetpath
 * @since windows5.0
 */
export CLIPOBJ_ppoGetPath(pco) {
    result := DllCall("GDI32.dll\CLIPOBJ_ppoGetPath", CLIPOBJ.Ptr, pco, PATHOBJ.Ptr)
    return result
}

/**
 * The FONTOBJ_cGetAllGlyphHandles function allows the device driver to find every glyph handle of a GDI font.
 * @remarks
 * A driver uses this function to download an entire font.
 * 
 * The driver must provide a buffer large enough to contain the output. GDI copies all glyph handles belonging to the associated font to this buffer.
 * 
 * The number of glyphs in the font can be determined by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_vgetinfo">FONTOBJ_vGetInfo</a>, or by calling <b>FONTOBJ_cGetAllGlyphHandles</b> with the <i>phg</i> parameter set to <b>NULL</b>.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure that is to be downloaded.
 * @param {Pointer<Integer>} phg Pointer to a buffer large enough to hold all the glyph handles in the font. This parameter can be <b>NULL</b>.
 * @returns {Integer} The return value is the number of glyph handles supported by the font.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_cgetallglyphhandles
 * @since windows5.0
 */
export FONTOBJ_cGetAllGlyphHandles(pfo, phg) {
    phgMarshal := phg is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\FONTOBJ_cGetAllGlyphHandles", FONTOBJ.Ptr, pfo, phgMarshal, phg, UInt32)
    return result
}

/**
 * The FONTOBJ_vGetInfo function retrieves information about an associated font.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure to be queried.
 * @param {Integer} cjSize Specifies the size in bytes of the buffer pointed to by <i>pfi</i>.
 * @param {Pointer<FONTINFO>} pfi Pointer to a buffer previously allocated by the driver. GDI writes a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontinfo">FONTINFO</a> structure to this buffer.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_vgetinfo
 * @since windows5.0
 */
export FONTOBJ_vGetInfo(pfo, cjSize, pfi) {
    DllCall("GDI32.dll\FONTOBJ_vGetInfo", FONTOBJ.Ptr, pfo, "uint", cjSize, FONTINFO.Ptr, pfi)
}

/**
 * The FONTOBJ_cGetGlyphs function is a service to the font consumer that translates glyph handles into pointers to glyph data, which are valid until the next call to FONTOBJ_cGetGlyphs.
 * @remarks
 * This function should be used if the driver is caching fonts.
 * @param {Pointer<FONTOBJ>} pfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure containing the glyph handles to be translated.
 * @param {Integer} iMode 
 * @param {Integer} cGlyph Specifies the number of glyphs to be translated. The only acceptable value is 1 (the code assumes 1, regardless of the value specified).
 * @param {Pointer<Integer>} phg Pointer to an array of <i>cGlyph</i> HGLYPH structures supplied by the driver.
 * @param {Pointer<Pointer<Void>>} ppvGlyph Pointer to a memory location that receives the address of a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdata">GLYPHDATA</a> structure. The first member of this structure is a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdef">GLYPHDEF</a> union, which contains a pointer to either a GLYPHBITS structure or a PATHOBJ structure, depending on the value of the <i>iMode</i> parameter. If the value of <i>iMode</i> is FO_GLYPHBITS, (*<i>ppvGlyph)</i>-&gt;<i>gdf</i> contains the address of a GLYPHBITS structure. If the value of <i>iMode</i> is FO_PATHOBJ, (*<i>ppvGlyph</i>)-&gt;<i>gdf</i> contains the address of a PATHOBJ structure.
 * @returns {Integer} The return value is the count of pointers passed to the driver if the function is successful. Otherwise, it is zero, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_cgetglyphs
 * @since windows5.0
 */
export FONTOBJ_cGetGlyphs(pfo, iMode, cGlyph, phg, ppvGlyph) {
    phgMarshal := phg is VarRef ? "uint*" : "ptr"
    ppvGlyphMarshal := ppvGlyph is VarRef ? "ptr*" : "ptr"

    result := DllCall("GDI32.dll\FONTOBJ_cGetGlyphs", FONTOBJ.Ptr, pfo, "uint", iMode, "uint", cGlyph, phgMarshal, phg, ppvGlyphMarshal, ppvGlyph, UInt32)
    return result
}

/**
 * The FONTOBJ_pxoGetXform function retrieves the notional-to-device transform for the specified font.
 * @remarks
 * The driver needs the notional-to-device transform to realize a driver-supplied font.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure for which the transform is to be retrieved.
 * @returns {Pointer<XFORMOBJ>} The return value is a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570618(v=vs.85)">XFORMOBJ</a> structure that describes the transform. The XFORMOBJ structure can be used by the <b>XFORMOBJ_</b><b><i>Xxx</i></b> service routines. The XFORMOBJ structure assumes that: 
 * 
 * <ul>
 * <li>The distance between the pixels is in device space units. </li>
 * <li>Both notional and device space have positive values of y in the top-to-bottom direction. </li>
 * </ul>
 * If the font is a raster font, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_pxogetxform
 * @since windows5.0
 */
export FONTOBJ_pxoGetXform(pfo) {
    result := DllCall("GDI32.dll\FONTOBJ_pxoGetXform", FONTOBJ.Ptr, pfo, XFORMOBJ.Ptr)
    return result
}

/**
 * The FONTOBJ_pifi function retrieves the pointer to the IFIMETRICS structure associated with a specified font.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure for which the associated IFIMETRICS structure is to be retrieved.
 * @returns {Pointer<IFIMETRICS>} The return value is a pointer to the IFIMETRICS structure associated with the specified font if the function is successful. Otherwise, it is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_pifi
 * @since windows5.0
 */
export FONTOBJ_pifi(pfo) {
    result := DllCall("GDI32.dll\FONTOBJ_pifi", FONTOBJ.Ptr, pfo, IFIMETRICS.Ptr)
    return result
}

/**
 * The FONTOBJ_pfdg function retrieves the pointer to the FD_GLYPHSET structure associated with the specified font.
 * @remarks
 * Printer drivers can call <b>FONTOBJ_pfdg</b> to determine which Unicode code points are supported in a GDI font. The printer driver can then determine whether it can optimize performance by instead using a similar printer-resident font to display a text string.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure for which the associated FD_GLYPHSET structure is to be returned.
 * @returns {Pointer<FD_GLYPHSET>} <b>FONTOBJ_pfdg</b> returns a pointer to the FD_GLYPHSET structure associated with the specified font.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_pfdg
 * @since windows5.0
 */
export FONTOBJ_pfdg(pfo) {
    result := DllCall("GDI32.dll\FONTOBJ_pfdg", FONTOBJ.Ptr, pfo, FD_GLYPHSET.Ptr)
    return result
}

/**
 * The FONTOBJ_pvTrueTypeFontFile function retrieves a user-mode pointer to a view of a TrueType, OpenType, or Type1 font file.
 * @remarks
 * <b>FONTOBJ_pvTrueTypeFontFile</b> should be called only for TrueType, OpenType, or Type1 fonts. The pointer returned by <b>FONTOBJ_pvTrueTypeFontFile</b> is valid only within the scope of the calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> function. That is, the driver should not assume that the pointer returned by this function is valid upon exiting <i>DrvTextOut</i> and returning control to GDI.
 * @param {Pointer<FONTOBJ>} pfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure with which the TrueType, PostScript OpenType, or PostScript Type1 font is associated.
 * @param {Pointer<Integer>} pcjFile Pointer to a location in which GDI returns the size, in bytes, of the view of the font file.
 * @returns {Pointer<Void>} <b>FONTOBJ_pvTrueTypeFontFile</b> returns a pointer to a user-mode view of a font file upon success. If the FONTOBJ structure identifies a Type1 font, the return value is a pointer to the memory-mapped image of the <i>pfb</i> file. Otherwise, this function returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_pvtruetypefontfile
 * @since windows5.0
 */
export FONTOBJ_pvTrueTypeFontFile(pfo, pcjFile) {
    pcjFileMarshal := pcjFile is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\FONTOBJ_pvTrueTypeFontFile", FONTOBJ.Ptr, pfo, pcjFileMarshal, pcjFile, IntPtr)
    return result
}

/**
 * The FONTOBJ_pQueryGlyphAttrs function returns information about a font's glyphs.
 * @remarks
 * Currently, the only attribute flag defined is FO_ATTR_MODE_ROTATE. This flag is meant for use by printer drivers that support printers with built-in font rasterizers. The driver can call the <b>FONTOBJ_pQueryGlyphAttrs</b> function, specifying the FO_ATTR_MODE_ROTATE flag, to determine which glyphs within a vertical font must be rotated.
 * 
 * Vertical fonts have a font name that starts with the "@" character. To determine if the current font is a vertical font, the driver can check for the FO_VERT_FACE flag in the <b>flFontType</b> member of the font's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure.
 * 
 * Rotation information is returned in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphattr">FD_GLYPHATTR</a> structure that is used as the function's return value.
 * 
 * The <b>FONTOBJ_pQueryGlyphAttrs</b> function is supplied by GDI. When a printer driver calls <b>FONTOBJ_pQueryGlyphAttrs</b>, GDI calls the appropriate font driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nc-winddi-pfn_drvqueryglyphattrs">DrvQueryGlyphAttrs</a> function to obtain the requested information.
 * @param {Pointer<FONTOBJ>} pfo Is a caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure identifying the font for which attributes are being requested.
 * @param {Integer} iMode Is a caller-supplied flag indicating the type of glyph attribute being requested. The following flag is defined:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Definition</th>
 * </tr>
 * <tr>
 * <td>
 * FO_ATTR_MODE_ROTATE
 * 
 * </td>
 * <td>
 * The function returns an array indicating which glyphs of a vertical font must be rotated.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Pointer<FD_GLYPHATTR>} <b>FONTOBJ_pQueryGlyphAttrs</b> returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphattr">FD_GLYPHATTR</a> structure. If an error is encountered, such as an invalid input argument, or if the font described by the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure is not a vertical font, the function returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-fontobj_pqueryglyphattrs
 * @since windows5.0
 */
export FONTOBJ_pQueryGlyphAttrs(pfo, iMode) {
    result := DllCall("GDI32.dll\FONTOBJ_pQueryGlyphAttrs", FONTOBJ.Ptr, pfo, "uint", iMode, FD_GLYPHATTR.Ptr)
    return result
}

/**
 * The PATHOBJ_vEnumStart function notifies a given PATHOBJ structure that the driver will be calling PATHOBJ_bEnum to enumerate lines and/or curves in the path.
 * @remarks
 * <b>PATHOBJ_vEnumStart</b> can be called at any time to restart an enumeration.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure whose lines and/or curves are to be enumerated.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-pathobj_venumstart
 * @since windows5.0
 */
export PATHOBJ_vEnumStart(ppo) {
    DllCall("GDI32.dll\PATHOBJ_vEnumStart", PATHOBJ.Ptr, ppo)
}

/**
 * The PATHOBJ_bEnum function retrieves the next PATHDATA record from a specified path and enumerates the curves in the path.
 * @remarks
 * <b>PATHOBJ_bEnum</b> can be called only after a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_venumstart">PATHOBJ_vEnumStart</a> has been made.
 * 
 * A PATHDATA structure describes all or part of a subpath (a connected part of a path). For example, a <b>MoveTo</b> call by the application within a path begins a new subpath.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure whose curves and/or lines are to be enumerated.
 * @param {Pointer<PATHDATA>} ppd Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathdata">PATHDATA</a> structure that is to be filled.
 * @returns {BOOL} The return value is <b>TRUE</b> if the specified path contains more PATHDATA records, indicating that this service should be called again. Otherwise, if the output is the last PATHDATA record in the path, the return value is <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-pathobj_benum
 * @since windows5.0
 */
export PATHOBJ_bEnum(ppo, ppd) {
    result := DllCall("GDI32.dll\PATHOBJ_bEnum", PATHOBJ.Ptr, ppo, PATHDATA.Ptr, ppd, BOOL)
    return result
}

/**
 * The PATHOBJ_vEnumStartClipLines function allows the driver to request lines to be clipped against a specified clip region.
 * @remarks
 * This function is useful when the clip region is more complex than a simple rectangle.
 * 
 * <b>PATHOBJ_vEnumStartClipLines</b> performs calculations for cosmetic wide lines. If the LINEATTRS structure needs a cosmetic wide line, the enumeration walks the given path as many times as needed to complete the widened figure.
 * 
 * This function should not be called for geometric wide lines or paths that contain Bezier curves.
 * 
 * Once begun, this enumeration process should not be restarted.
 * @param {Pointer<PATHOBJ>} ppo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure that describes the specified clipping object.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that describes the clip region.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that GDI queries to retrieve information about styling steps.
 * @param {Pointer<LINEATTRS>} pla Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-lineattrs">LINEATTRS</a> structure that GDI queries to retrieve line width and styling information.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-pathobj_venumstartcliplines
 * @since windows5.0
 */
export PATHOBJ_vEnumStartClipLines(ppo, pco, pso, pla) {
    DllCall("GDI32.dll\PATHOBJ_vEnumStartClipLines", PATHOBJ.Ptr, ppo, CLIPOBJ.Ptr, pco, SURFOBJ.Ptr, pso, LINEATTRS.Ptr, pla)
}

/**
 * The PATHOBJ_bEnumClipLines function enumerates clipped line segments from a given path.
 * @remarks
 * The enumeration must be started with <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-pathobj_venumstartcliplines">PATHOBJ_vEnumStartClipLines</a> before the driver makes this call.
 * @param {Pointer<PATHOBJ>} ppo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure containing the clipped line segments that are to be enumerated.
 * @param {Integer} cb Specifies the size of the output buffer, in bytes. GDI does not write beyond this point in the buffer. The value of this parameter must be large enough to hold a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipline">CLIPLINE</a> structure with at least one <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-run">RUN</a> structure. The driver should allocate space for several RUN structures.
 * @param {Pointer<CLIPLINE>} pcl Pointer to the buffer that receives a CLIPLINE structure. The structure contains the original unclipped control points for a line segment. (The correct pixels for the line cannot be computed without the original points.) RUN structures, which describe sets of pixels along the line that are not clipped away, are written to this buffer.
 * 
 * If a clip region is complex, a single line segment can be broken into many RUN structures. A segment is returned as many times as necessary to list all of its RUN structures.
 * 
 * The CLIPLINE structure contains the starting and ending points of the original unclipped line and the line segments, or RUN structures, of that line that are to appear on the display.
 * @returns {BOOL} The return value is <b>TRUE</b> if more line segments are to be enumerated, indicating that this service should be called again. Otherwise, it is <b>FALSE</b>, indicating that the returned segment is the last segment in the path.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-pathobj_benumcliplines
 * @since windows5.0
 */
export PATHOBJ_bEnumClipLines(ppo, cb, pcl) {
    result := DllCall("GDI32.dll\PATHOBJ_bEnumClipLines", PATHOBJ.Ptr, ppo, "uint", cb, CLIPLINE.Ptr, pcl, BOOL)
    return result
}

/**
 * The PATHOBJ_vGetBounds function retrieves the bounding rectangle for the specified path.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure that describes the path for which a bounding rectangle is to be calculated.
 * @param {Pointer<RECTFX>} prectfx Pointer to the address where the RECTFX structure is to be written. The returned rectangle is exclusive of the bottom and right edges. An empty rectangle is specified by setting all four RECTFX members to zero. For a description of this data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-pathobj_vgetbounds
 * @since windows5.0
 */
export PATHOBJ_vGetBounds(ppo, prectfx) {
    DllCall("GDI32.dll\PATHOBJ_vGetBounds", PATHOBJ.Ptr, ppo, RECTFX.Ptr, prectfx)
}

/**
 * The STROBJ_vEnumStart function defines the form, or type, for data that will be returned from GDI in subsequent calls to STROBJ_bEnum.
 * @remarks
 * This function also restarts the enumeration of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphpos">GLYPHPOS</a> array.
 * 
 * This function should be called by the driver prior to calling <b>STROBJ_bEnum</b>.
 * @param {Pointer<STROBJ>} pstro Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure whose data form is to be defined.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-strobj_venumstart
 * @since windows5.0
 */
export STROBJ_vEnumStart(pstro) {
    DllCall("GDI32.dll\STROBJ_vEnumStart", STROBJ.Ptr, pstro)
}

/**
 * The STROBJ_bEnum function enumerates glyph identities and positions.
 * @remarks
 * A driver should download only the glyph handles if it caches fonts itself.
 * 
 * The information returned depends on the driver's return value for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgetglyphmode">DrvGetGlyphMode</a>. 
 * 
 * Bitmaps or outlines can also be obtained from <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structures.
 * 
 * Printer drivers should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-strobj_benumpositionsonly">STROBJ_bEnumPositionsOnly</a> instead of <b>STROBJ_bEnum</b> if printer hardware provides internal rendering of TrueType fonts.
 * @param {Pointer<STROBJ>} pstro Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphpos">GLYPHPOS</a> information.
 * @param {Pointer<Integer>} pc Pointer to the count, returned by GDI, of GLYPHPOS structures.
 * @param {Pointer<Pointer<GLYPHPOS>>} ppgpos Pointer to the array in which GDI writes the GLYPHPOS structures.
 * @returns {BOOL} The return value is <b>TRUE</b> if more glyphs remain to be enumerated, or <b>FALSE</b> if the enumeration is complete. The return value is DDI_ERROR if the glyphs cannot be enumerated, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-strobj_benum
 * @since windows5.0
 */
export STROBJ_bEnum(pstro, pc, ppgpos) {
    pcMarshal := pc is VarRef ? "uint*" : "ptr"
    ppgposMarshal := ppgpos is VarRef ? "ptr*" : "ptr"

    result := DllCall("GDI32.dll\STROBJ_bEnum", STROBJ.Ptr, pstro, pcMarshal, pc, ppgposMarshal, ppgpos, BOOL)
    return result
}

/**
 * The STROBJ_bEnumPositionsOnly function enumerates glyph identities and positions for a specified text string, but does not create cached glyph bitmaps.
 * @remarks
 * The <b>STROBJ_bEnumPositionsOnly</b> function is typically called from within a driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> function. It performs the same operations as <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-strobj_benum">STROBJ_bEnum</a> with one important exception − GDI does not create cached bitmaps of the glyphs. The <b>STROBJ_bEnum</b> function assumes the driver will eventually need these bitmaps. However, many newer printers contain internal rasterizers and therefore do not need GDI to render glyphs. For such printers, eliminating the automatic rendering and caching of glyph bitmaps in server memory provides considerable savings of both processing time and memory allocation.
 * 
 * For printers that support internal glyph rasterization, the following rules should be followed:
 * 
 * <ul>
 * <li>
 * The driver should set the GCAPS_FONT_RASTERIZER flag in its <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-devinfo">DEVINFO</a> structure.
 * 
 * </li>
 * <li>
 * The driver's <i>DrvTextOut</i> function should call <b>STROBJ_bEnumPositionsOnly</b> instead of <b>STROBJ_bEnum</b>.
 * 
 * </li>
 * <li>
 * If the print job includes a font that the device cannot rasterize internally, the driver should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_cgetglyphs">FONTOBJ_cGetGlyphs</a> to obtain glyph bitmaps.
 * 
 * </li>
 * <li>
 * If a driver needs to determine the likely printer position after a text string has been printed, but does not need a font glyph, it can call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-strobj_bgetadvancewidths">STROBJ_bGetAdvanceWidths</a>.
 * 
 * </li>
 * </ul>
 * Because GDI does not create cached bitmaps of the glyphs, the contents of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdef">GLYPHDEF</a> union within each returned <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphpos">GLYPHPOS</a> structure will be <b>NULL</b>.
 * @param {Pointer<STROBJ>} pstro A caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure describing a text string. This is typically the STROBJ structure received by the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> function.
 * @param {Pointer<Integer>} pc A caller-supplied address to receive the GDI-supplied number of GLYPHPOS structures pointed to by the pointer in <i>ppgpos</i>.
 * @param {Pointer<Pointer<GLYPHPOS>>} ppgpos A caller-supplied address that receives a GDI-supplied pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphpos">GLYPHPOS</a> structures. (See the following <b>Remarks</b> section.)
 * @returns {BOOL} The return value is <b>TRUE</b> if more glyphs remain to be enumerated, or <b>FALSE</b> if the enumeration is complete. The return value is DDI_ERROR if the glyphs cannot be enumerated, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-strobj_benumpositionsonly
 * @since windows5.0
 */
export STROBJ_bEnumPositionsOnly(pstro, pc, ppgpos) {
    pcMarshal := pc is VarRef ? "uint*" : "ptr"
    ppgposMarshal := ppgpos is VarRef ? "ptr*" : "ptr"

    result := DllCall("GDI32.dll\STROBJ_bEnumPositionsOnly", STROBJ.Ptr, pstro, pcMarshal, pc, ppgposMarshal, ppgpos, BOOL)
    return result
}

/**
 * The STROBJ_dwGetCodePage function returns the code page associated with the specified STROBJ structure.
 * @param {Pointer<STROBJ>} pstro Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure with which the code page is associated.
 * @returns {Integer} <b>STROBJ_dwGetCodePage</b> returns a DWORD value that identifies the code page associated with the font used in the text output call at the Win32 API level.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-strobj_dwgetcodepage
 * @since windows5.0
 */
export STROBJ_dwGetCodePage(pstro) {
    result := DllCall("GDI32.dll\STROBJ_dwGetCodePage", STROBJ.Ptr, pstro, UInt32)
    return result
}

/**
 * The STROBJ_bGetAdvanceWidths function retrieves an array of vectors specifying the probable widths of glyphs making up a specified string.
 * @remarks
 * The <b>STROBJ_bGetAdvanceWidths</b> function is useful to printer drivers that call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-strobj_benumpositionsonly">STROBJ_bEnumPositionsOnly</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-strobj_benum">STROBJ_bEnum</a>. The function fills in the <i>pptqD</i> array with the probable widths of a string's glyphs, and can be used to calculate the printer position after a string as been rendered by the printer, if the printer's glyph rendering hardware does not return exact character widths.
 * 
 * Note that glyph positions returned by <b>STROBJ_bEnumPositionsOnly</b> do not necessarily correspond exactly to the widths returned by <b>STROBJ_bGetAdvanceWidths.</b>
 * @param {Pointer<STROBJ>} pso Is a caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure describing a text string. This is typically the STROBJ structure received by the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> function.
 * @param {Integer} iFirst Is a caller-supplied, zero-based index into the text string supplied by the STROBJ structure. This index represents the first character of the string for which a width is to be returned.
 * @param {Integer} c Is a caller-supplied count of the number of contiguous characters, starting and the character specified by <i>iFirst</i>, for which width values are to be returned.
 * @param {Pointer<POINTQF>} pptqD Is a caller-supplied pointer to a <i>c</i>-sized array of POINTQF structures to receive character widths in (28.36, 28.36) format. For a description of this data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
 * @returns {BOOL} If the operation succeeds, the function returns <b>TRUE</b>; otherwise it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-strobj_bgetadvancewidths
 * @since windows5.0
 */
export STROBJ_bGetAdvanceWidths(pso, iFirst, c, pptqD) {
    result := DllCall("GDI32.dll\STROBJ_bGetAdvanceWidths", STROBJ.Ptr, pso, "uint", iFirst, "uint", c, POINTQF.Ptr, pptqD, BOOL)
    return result
}

/**
 * The XFORMOBJ_iGetXform function downloads a transform to the driver.
 * @param {Pointer<XFORMOBJ>} pxo Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570618(v=vs.85)">XFORMOBJ</a> structure that defines the transform to be downloaded to the driver.
 * @param {Pointer<XFORML>} pxform Pointer to the buffer that is to receive the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570616(v=vs.85)">XFORML</a> structure. This parameter can be <b>NULL</b>.
 * @returns {Integer} If an error occurs, the return value is DDI_ERROR. Otherwise, the return value is a complexity hint about the transform object. The value of this transform characterization can be one of the following:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>GX_GENERAL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Arbitrary 2 x 2 matrix and offset.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>GX_IDENTITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identity matrix; no translation offset.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>GX_OFFSET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Identity matrix; there is a translation offset.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>GX_SCALE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Off-diagonal matrix elements are zero.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xformobj_igetxform
 * @since windows5.0
 */
export XFORMOBJ_iGetXform(pxo, pxform) {
    result := DllCall("GDI32.dll\XFORMOBJ_iGetXform", XFORMOBJ.Ptr, pxo, XFORML.Ptr, pxform, UInt32)
    return result
}

/**
 * The XFORMOBJ_bApplyXform function applies the given transform or its inverse to the given array of points.
 * @param {Pointer<XFORMOBJ>} pxo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570618(v=vs.85)">XFORMOBJ</a> structure that defines the transform to be applied to the <i>pvIn</i> array.
 * @param {Integer} iMode Identifies the transform and the input and output data types. This parameter can be one of the following:
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * XF_INV_FXTOL
 * 
 * </td>
 * <td>
 * Applies the inverse of the transform to POINTFIX structures to get <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structures.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XF_INV_LTOL
 * 
 * </td>
 * <td>
 * Applies the inverse of the transform to POINTL structures to get POINTL structures.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XF_LTOFX
 * 
 * </td>
 * <td>
 * Applies the transform to POINTL structures to get POINTFIX structures (see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XF_LTOL
 * 
 * </td>
 * <td>
 * Applies the transform to POINTL structures to get POINTL structures.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} cPoints Specifies the count of points in <i>pvIn</i> to be transformed.
 * @param {Pointer<Void>} pvIn Pointer to an array of input points. The format of the points is specified by the <i>iMode</i> parameter.
 * @param {Pointer<Void>} pvOut Pointer to the buffer that is to receive the transformed points. The <i>iMode</i> parameter specifies the format of the points.
 * @returns {BOOL} The return value is <b>TRUE</b> if all points were transformed without overflow. <b>FALSE</b> is returned if <i>pxo</i>, <i>pvIn</i>, or <i>pvOut</i> are <b>null</b>, or if overflow occurs during the transformation.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xformobj_bapplyxform
 * @since windows5.0
 */
export XFORMOBJ_bApplyXform(pxo, iMode, cPoints, pvIn, pvOut) {
    pvInMarshal := pvIn is VarRef ? "ptr" : "ptr"
    pvOutMarshal := pvOut is VarRef ? "ptr" : "ptr"

    result := DllCall("GDI32.dll\XFORMOBJ_bApplyXform", XFORMOBJ.Ptr, pxo, "uint", iMode, "uint", cPoints, pvInMarshal, pvIn, pvOutMarshal, pvOut, BOOL)
    return result
}

/**
 * The XLATEOBJ_iXlate function translates a color index of the source palette to the closest index in the destination palette.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that defines the source palette.
 * @param {Integer} iColor Specifies the color index to be translated.
 * @returns {Integer} The return value is an index into the destination palette if the function is successful. If the function fails, -1 is returned.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xlateobj_ixlate
 * @since windows5.0
 */
export XLATEOBJ_iXlate(pxlo, iColor) {
    result := DllCall("GDI32.dll\XLATEOBJ_iXlate", XLATEOBJ.Ptr, pxlo, "uint", iColor, UInt32)
    return result
}

/**
 * The XLATEOBJ_piVector function retrieves a translation vector that the driver can use to translate source indices to destination indices.
 * @remarks
 * This function can be used only if the source palette is an indexed palette.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that defines the indexed source object.
 * @returns {Pointer<Integer>} The return value is a pointer to a vector of translation entries if the function is successful. Otherwise, it is null, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xlateobj_pivector
 * @since windows5.0
 */
export XLATEOBJ_piVector(pxlo) {
    result := DllCall("GDI32.dll\XLATEOBJ_piVector", XLATEOBJ.Ptr, pxlo, IntPtr)
    return result
}

/**
 * The XLATEOBJ_cGetPalette function retrieves RGB colors or the bitfields format from the specified palette.
 * @remarks
 * The driver must have information about the palette to perform some methods of color blending.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure from which GDI retrieves the requested information.
 * @param {Integer} iPal 
 * @param {Integer} cPal Specifies the number of entries in the buffer pointed to by <i>pPal</i>. This can be smaller than the total size of the palette.
 * @param {Pointer<Integer>} pPal Pointer to a buffer in which GDI writes the requested palette information. If <i>iPal</i> is XO_SRCPALETTE or XO_DESTPALETTE and the respective palette type is PAL_INDEXED, each entry is a 24-bit RGB value.
 * 
 * If <i>iPal</i> is XO_SRCBITFIELDS or XO_DESTBITFIELDS and the respective palette type is PAL_BITFIELDS, PAL_RGB, or PAL_BGR, <i>pPal</i> points to three ULONG masks that represent the red, green, and blue color masks.
 * @returns {Integer} <b>XLATEOBJ_cGetPalette</b> returns the number of entries written if <i>pPal</i> is not null. A value of zero is returned if the XLATEOBJ is null or its palette is invalid. <b>XLATEOBJ_cGetPalette</b> will also return zero if the data pointed to by <i>pxlo</i> is not consistent with the value in <i>iPal</i>. For example, if the data pointed to is a bitfield, but <i>iPal</i> is set to either XO_SRCPALETTE or XO_DESTPALETTE, <b>XLATEOBJ_cGetPalette</b> will return zero. Similarly, if the data pointed to by <i>pxlo</i> is a palette, but <i>iPal</i> is set to either XO_SRCBITFIELDS or XO_DESTBITFIELDS, <b>XLATEOBJ_cGetPalette</b> also returns zero.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xlateobj_cgetpalette
 * @since windows5.0
 */
export XLATEOBJ_cGetPalette(pxlo, iPal, cPal, pPal) {
    pPalMarshal := pPal is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\XLATEOBJ_cGetPalette", XLATEOBJ.Ptr, pxlo, "uint", iPal, "uint", cPal, pPalMarshal, pPal, UInt32)
    return result
}

/**
 * The XLATEOBJ_hGetColorTransform function returns the color transform for the specified translation object.
 * @remarks
 * <b>XLATEOBJ_hGetColorTransform</b> returns <b>NULL</b> when it is called in host ICM context or when ICM is disabled.
 * 
 * The color transform for a brush is obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-brushobj_hgetcolortransform">BRUSHOBJ_hGetColorTransform</a>.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure whose color transform is being queried. The color transform was created in a prior call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvicmcreatecolortransform">DrvIcmCreateColorTransform</a>.
 * @returns {HANDLE} <b>XLATEOBJ_hGetColorTransform</b> returns a handle to the color transform for the specified XLATEOBJ upon success. Otherwise, it returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-xlateobj_hgetcolortransform
 * @since windows5.0
 */
export XLATEOBJ_hGetColorTransform(pxlo) {
    result := DllCall("GDI32.dll\XLATEOBJ_hGetColorTransform", XLATEOBJ.Ptr, pxlo, HANDLE.Owned)
    return result
}

/**
 * The EngCreateBitmap function requests that GDI create and manage a bitmap.
 * @remarks
 * Storage for the bitmap can optionally be provided by the driver.
 * 
 * The driver should associate the created bitmap as a surface by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engassociatesurface">EngAssociateSurface</a> before returning from <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablesurface">DrvEnableSurface</a>.
 * 
 * The bitmap should be deleted by using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeletesurface">EngDeleteSurface</a> when it is no longer needed.
 * 
 * Frame buffer display drivers should use the <i>pvBits</i> parameter, allowing GDI to do most drawing directly to the display.
 * @param {SIZE} sizl Specifies a SIZEL structure whose members contain the width and height, in pixels, of the bitmap to be created. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
 * 
 * If <i>pvBits</i> is not <b>NULL</b>, this value should represent all pixels visible on the device, allowing the device to keep <a href="https://docs.microsoft.com/windows-hardware/drivers/">off-screen memory</a>.
 * @param {Integer} lWidth Specifies the allocation width of the bitmap, which is the number of bytes that must be added to a pointer to move down one scan line.
 * @param {Integer} iFormat 
 * @param {Integer} fl 
 * @param {Pointer<Void>} pvBits Pointer to the first scan line of the bitmap that is to be created. If this parameter is <b>NULL</b>, GDI allocates the storage space for the pixels of the bitmap. If <i>pvBits</i> is not <b>NULL</b>, it is a pointer to the buffer for the bitmap.
 * @returns {HBITMAP} If the function completes successfully, the return value is a handle that identifies the created bitmap. Otherwise, the return value is 0. <b>EngCreateBitmap</b> does not log an error code.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreatebitmap
 * @since windows5.0
 */
export EngCreateBitmap(sizl, lWidth, iFormat, fl, pvBits) {
    pvBitsMarshal := pvBits is VarRef ? "ptr" : "ptr"

    result := DllCall("GDI32.dll\EngCreateBitmap", SIZE, sizl, "int", lWidth, "uint", iFormat, "uint", fl, pvBitsMarshal, pvBits, HBITMAP.Owned)
    return result
}

/**
 * The EngCreateDeviceSurface function creates and returns a handle for a device surface that the driver will manage.
 * @remarks
 * The storage space for the surface can optionally be provided by the driver. The surface should be associated by using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engassociatesurface">EngAssociateSurface</a>. The surface should be deleted when it is no longer needed by using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeletesurface">EngDeleteSurface</a>.
 * @param {DHSURF} _dhsurf Device handle to the surface to be managed by the device. This handle is passed to the driver when a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure is passed for input or output.
 * @param {SIZE} sizl Specifies a SIZEL structure that contains the width and height of the surface to be created. The <b>cx</b> and <b>cy</b> members of this structure contain respectively, the surface's width and height, in pixels. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
 * @param {Integer} iFormatCompat Specifies the compatible engine format of the device surface being created. This is used by GDI if a temporary buffer is needed to simulate a complicated drawing call.
 * @returns {HSURF} The return value is a handle that identifies the surface if the function is successful. Otherwise, it is zero, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreatedevicesurface
 * @since windows5.0
 */
export EngCreateDeviceSurface(_dhsurf, sizl, iFormatCompat) {
    result := DllCall("GDI32.dll\EngCreateDeviceSurface", DHSURF, _dhsurf, SIZE, sizl, "uint", iFormatCompat, HSURF)
    return result
}

/**
 * The EngCreateDeviceBitmap function requests GDI to create a handle for a device bitmap.
 * @remarks
 * The surface should be associated by using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engassociatesurface">EngAssociateSurface</a>. The bitmap should be deleted by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeletesurface">EngDeleteSurface</a> when it is no longer needed.
 * @param {DHSURF} _dhsurf Device handle to the device bitmap to be created.
 * @param {SIZE} sizl Specifies a SIZEL structure that contains the width and height of the bitmap to be created. The <b>cx</b> and <b>cy</b> members of this structure contain respectively, the bitmap's width and height, in pixels. A SIZEL structure is identical to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
 * @param {Integer} iFormatCompat Specifies the compatible engine format of the device surface being created. This is used by GDI if a temporary buffer is needed to simulate a complicated drawing call. The allowable values for <i>iFormatCompat</i> are BMF_1BPP, BMF_4BPP, BMF_8BPP, BMF_16BPP, BMF_24BPP, and BMF_32BPP.
 * @returns {HBITMAP} The return value is a handle that identifies the bitmap if the function is successful. Otherwise, it is zero, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreatedevicebitmap
 * @since windows5.0
 */
export EngCreateDeviceBitmap(_dhsurf, sizl, iFormatCompat) {
    result := DllCall("GDI32.dll\EngCreateDeviceBitmap", DHSURF, _dhsurf, SIZE, sizl, "uint", iFormatCompat, HBITMAP.Owned)
    return result
}

/**
 * The EngDeleteSurface function deletes the specified surface.
 * @param {HSURF} _hsurf Handle to the surface to delete. This handle can be an HSURF or HBM.
 * @returns {BOOL} <b>EngDeleteSurface</b> returns <b>TRUE</b> if it is successful in deleting the surface. Otherwise, it returns <b>FALSE</b> and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeletesurface
 * @since windows5.0
 */
export EngDeleteSurface(_hsurf) {
    result := DllCall("GDI32.dll\EngDeleteSurface", HSURF, _hsurf, BOOL)
    return result
}

/**
 * The EngLockSurface function creates a user object for a given surface. This function gives drivers access to surfaces they create.
 * @remarks
 * This function gives drivers access to surfaces they create.
 * 
 * The driver is responsible for unlocking the surface when it no longer needs it. Surfaces should be locked only for very short periods of time.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engunlocksurface">EngUnlockSurface</a> function to unlock the surface.
 * @param {HSURF} _hsurf Handle to the surface to be locked.
 * @returns {Pointer<SURFOBJ>} <b>EngLockSurface</b> returns a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure if the function is successful. Otherwise, this function returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-englocksurface
 * @since windows5.0
 */
export EngLockSurface(_hsurf) {
    result := DllCall("GDI32.dll\EngLockSurface", HSURF, _hsurf, SURFOBJ.Ptr)
    return result
}

/**
 * The EngUnlockSurface function causes GDI to unlock the surface.
 * @remarks
 * The specified surface must previously have been locked by a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-englocksurface">EngLockSurface</a>. The pointer to the SURFOBJ structure must not be used after this call.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface to be unlocked.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engunlocksurface
 * @since windows5.0
 */
export EngUnlockSurface(pso) {
    DllCall("GDI32.dll\EngUnlockSurface", SURFOBJ.Ptr, pso)
}

/**
 * The EngEraseSurface function calls GDI to erase the surface; a given rectangle on the surface will be filled with the given color.
 * @param {Pointer<SURFOBJ>} pso Pointer to the surface to erase.
 * @param {Pointer<RECTL>} prcl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines which pixels to erase on the surface. This rectangle is exclusive of the bottom and right edges.
 * @param {Integer} iColor Specifies a color index. This is an index to the value that will be written into each pixel.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b>, and an error code is reported.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engerasesurface
 * @since windows5.0
 */
export EngEraseSurface(pso, prcl, iColor) {
    result := DllCall("GDI32.dll\EngEraseSurface", SURFOBJ.Ptr, pso, RECTL.Ptr, prcl, "uint", iColor, BOOL)
    return result
}

/**
 * The EngAssociateSurface function marks a given surface as belonging to a specified device.
 * @remarks
 * <b>EngAssociateSurface</b> can be used by printer drivers to implement "rules" or device fonts, or by display drivers to make use of special blt hardware.
 * 
 * If the surface identified by <i>hsurf</i> is a standard format bitmap, the driver can specify which output functions to the surface it will handle by setting bits in <i>flHooks</i>. Setting bits in <i>flHooks</i> causes particular output functions to be sent to the driver instead. This is referred to as hooking. If the driver does not hook a call, GDI will automatically manage the operation when a standard format bitmap is being drawn on. 
 * 
 * When the surface is associated, it assumes the default palette and style steps of the <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a>. A surface must be associated before it is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablesurface">DrvEnableSurface</a>.
 * 
 * By default, when a driver supports device bitmaps by implementing <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcreatedevicebitmap">DrvCreateDeviceBitmap</a>/<a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvdeletedevicebitmap">DrvDeleteDeviceBitmap</a>, GDI does not automatically synchronize drawing calls to the device bitmap and to the primary surface. For example, GDI can call the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvbitblt">DrvBitBlt</a> function to draw to a device bitmap, while another thread is drawing to the primary surface by executing the driver's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a>. The driver can even be called to draw to multiple device bitmaps at the same time.
 * 
 * After <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablesurface">DrvEnableSurface</a> returns a handle to a primary surface, do not call <b>EngAssociateSurface</b> on that handle. Doing so can cause a bug check in certain circumstances. For more information, see <a href="https://support.microsoft.com/?kbid&amp;ID=330248">Microsoft Knowledge Base article 330248</a>.
 * @param {HSURF} _hsurf Handle to the surface or bitmap to be associated with <i>hdev</i>. This handle was returned by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatebitmap">EngCreateBitmap</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatedevicebitmap">EngCreateDeviceBitmap</a>.
 * @param {HDEV} _hdev Handle to the device with which the surface is to be associated. This is the GDI-created handle that was passed to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcompletepdev">DrvCompletePDEV</a> function.
 * @param {Integer} flHooks 
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, the driver should send the information to the GDI function it is implementing, and return GDI's return value.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engassociatesurface
 * @since windows5.0
 */
export EngAssociateSurface(_hsurf, _hdev, flHooks) {
    result := DllCall("GDI32.dll\EngAssociateSurface", HSURF, _hsurf, HDEV, _hdev, "uint", flHooks, BOOL)
    return result
}

/**
 * The EngMarkBandingSurface function marks the specified surface as a banding surface.
 * @remarks
 * If a <a href="https://docs.microsoft.com/windows-hardware/drivers/print/printer-graphics-dll">printer graphics DLL</a> uses GDI-managed surfaces, it must call <b>EngMarkBandingSurface</b> if it cannot create a surface (by calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatebitmap">EngCreateBitmap</a>) that is large enough to hold an entire physical page's bitmap. Both <b>EngCreateBitmap</b> and <b>EngMarkBandingSurface</b> should be called from within the printer graphics DLL's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenablesurface">DrvEnableSurface</a> function.
 * 
 * The handle supplied for <i>hsurf</i> must be a bitmap handle returned by <b>EngCreateBitmap</b>.
 * 
 * If a printer graphics DLL calls <b>EngMarkBandingSurface</b>, it must define <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvstartbanding">DrvStartBanding</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvnextband">DrvNextBand</a> functions.
 * @param {HSURF} _hsurf Caller-supplied handle to the surface to mark as a banding surface.
 * @returns {BOOL} <b>EngMarkBandingSurface</b> returns <b>TRUE</b> upon success; otherwise it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engmarkbandingsurface
 * @since windows5.0
 */
export EngMarkBandingSurface(_hsurf) {
    result := DllCall("GDI32.dll\EngMarkBandingSurface", HSURF, _hsurf, BOOL)
    return result
}

/**
 * The EngCheckAbort function enables a printer graphics DLL to determine if a print job should be terminated.
 * @remarks
 * A <a href="https://docs.microsoft.com/windows-hardware/drivers/print/printer-graphics-dll">printer graphics DLL</a> should call <b>EngCheckAbort</b> from within any graphics DDI function that takes more than five seconds to execute. If the print job should be terminated, the printer graphics DLL should stop its current operation and return to GDI, specifying a return value of <b>FALSE</b> for the graphics DDI function that called <b>EngCheckAbort</b>.
 * @param {Pointer<SURFOBJ>} pso Caller-supplied pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure, previously received from GDI.
 * @returns {BOOL} If the print job should be terminated, the function returns <b>TRUE</b>. If the print job should not be terminated, or if <i>pso</i> does not point to a valid SURFOBJ structure, the function returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcheckabort
 * @since windows5.0
 */
export EngCheckAbort(pso) {
    result := DllCall("GDI32.dll\EngCheckAbort", SURFOBJ.Ptr, pso, BOOL)
    return result
}

/**
 * The EngDeletePath function deletes a path previously allocated by EngCreatePath.
 * @param {Pointer<PATHOBJ>} ppo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure to be deleted.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeletepath
 * @since windows5.0
 */
export EngDeletePath(ppo) {
    DllCall("GDI32.dll\EngDeletePath", PATHOBJ.Ptr, ppo)
}

/**
 * The EngCreatePalette function sends a request to GDI to create an RGB palette.
 * @remarks
 * The driver can associate the new palette with a device by returning a pointer to the palette in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-devinfo">DEVINFO</a> structure.
 * 
 * A PAL_INDEXED palette associated with the device must have its first index entry set to black (red = 0, green = 0, blue = 0) and its last entry set to white (255, 255, 255). All other entries should be set so that entries whose indexes are one's complements of each other have colors that contrast greatly. For example, if entry 0x9 of a 16 entry palette is set to pure green (0,255,0), entry 0x6 (=~0x9) should be set to a color that contrasts well with green, such as dark purple (128,0,128). Setting entries in this way allows XOR raster operations to behave reasonably. You should delete the palette when you no longer need it by using <a href="https://docs.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeletepalette">EngDeletePalette</a>.
 * @param {Integer} iMode 
 * @param {Integer} cColors If the <i>iMode</i> parameter is PAL_INDEXED, <i>cColors</i> specifies the number of colors provided in the array pointed to by <i>pulColors</i>. Otherwise, this parameter should be zero.
 * @param {Pointer<Integer>} pulColors Pointer to the beginning of an array of ULONG values if <i>iMode</i> is PAL_INDEXED. The low-order 3 bytes of each ULONG define the RGB colors in the palette.
 * @param {Integer} flRed If the <i>iMode</i> parameter is PAL_BITFIELDS, the <i>flRed</i>, <i>flGreen</i> and <i>flBlue</i> parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
 * @param {Integer} flGreen If the <i>iMode</i> parameter is PAL_BITFIELDS, the <i>flRed</i>, <i>flGreen</i> and <i>flBlue</i> parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
 * @param {Integer} flBlue If the <i>iMode</i> parameter is PAL_BITFIELDS, the <i>flRed</i>, <i>flGreen</i> and <i>flBlue</i> parameters are masks that show which bits correspond to red, green, and blue. Each mask must consist of contiguous bits and should not overlap other masks. All combinations of bitfields are supported by GDI.
 * @returns {HPALETTE} The return value is a handle to the new palette if the function is successful. Otherwise, it is zero, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreatepalette
 * @since windows5.0
 */
export EngCreatePalette(iMode, cColors, pulColors, flRed, flGreen, flBlue) {
    pulColorsMarshal := pulColors is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\EngCreatePalette", "uint", iMode, "uint", cColors, pulColorsMarshal, pulColors, "uint", flRed, "uint", flGreen, "uint", flBlue, HPALETTE.Owned)
    return result
}

/**
 * The EngDeletePalette function sends a request to GDI to delete the specified palette.
 * @param {HPALETTE} hpal Handle to the palette to be deleted. This handle is supplied by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatepalette">EngCreatePalette</a>.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful; otherwise, it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeletepalette
 * @since windows5.0
 */
export EngDeletePalette(hpal) {
    result := DllCall("GDI32.dll\EngDeletePalette", HPALETTE, hpal, BOOL)
    return result
}

/**
 * The EngCreateClip function creates a CLIPOBJ structure that the driver uses in callbacks.
 * @remarks
 * The CLIPOBJ structure created by <b>EngCreateClip</b> allows GDI to directly access banked frame buffers. The structure must be initialized by the driver so that the <b>iDComplexity</b> member of the CLIPOBJ structure is set to DC_TRIVIAL or DC_RECT. If the <b>iDComplexity</b> member is set to DC_RECT, the driver can set the <b>rclBounds</b> member of CLIPOBJ to the extent of the frame buffer bank. The driver must delete this CLIPOBJ structure using <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engdeleteclip">EngDeleteClip</a>.
 * @returns {Pointer<CLIPOBJ>} The return value is a pointer to the newly-created CLIPOBJ structure if the function succeeds. Otherwise, it is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreateclip
 * @since windows5.0
 */
export EngCreateClip() {
    result := DllCall("GDI32.dll\EngCreateClip", CLIPOBJ.Ptr)
    return result
}

/**
 * The EngDeleteClip function deletes a CLIPOBJ structure allocated by EngCreateClip.
 * @param {Pointer<CLIPOBJ>} pco Pointer to the CLIPOBJ structure to delete.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeleteclip
 * @since windows5.0
 */
export EngDeleteClip(pco) {
    DllCall("GDI32.dll\EngDeleteClip", CLIPOBJ.Ptr, pco)
}

/**
 * The EngBitBlt function provides general bit-block transfer capabilities either between device-managed surfaces, or between a device-managed surface and a GDI-managed standard format bitmap.
 * @remarks
 * If a device's surface is organized as a standard-format bitmap, the driver can request that GDI perform the bit-block transfer by calling <b>EngBitBlt</b>. A driver might do this if it has special hardware to handle simple transfers quickly, but doesn't want to handle calls with complicated transfers.
 * 
 * See the Microsoft Windows SDK documentation for more information about raster operations.
 * @param {Pointer<SURFOBJ>} psoTrg Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that identifies the surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc If the <i>rop4</i> requires it, pointer to a SURFOBJ structure that defines the source for the bit-block transfer operation.
 * @param {Pointer<SURFOBJ>} psoMask Pointer to a SURFOBJ structure that defines a surface to be used as a mask. The mask is defined as a bitmap with 1 bit per pixel. Typically, a mask limits the area that is to be modified in the destination surface. Masking is selected by a <i>rop4</i> with the value 0xAACC. The destination surface is unaffected when the mask is zero.
 * 
 * The mask is large enough to cover the destination rectangle.
 * 
 * If the value of this parameter is <b>NULL</b> and a mask is required by the <i>rop4</i>, then the implicit mask in the brush is used. If a mask is required, then <i>psoMask</i> overrides the implicit mask in the brush.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles. This enumeration limits the area of the destination that will be modified. Whenever possible, GDI simplifies the clipping involved; for example, this function is never called with a single clipping rectangle. GDI clips the destination rectangle before calling this function, making additional clipping unnecessary.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that tells how color indices should be translated between the source and target surfaces.
 * @param {Pointer<RECTL>} prclTrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure in the coordinate system of the destination surface that defines the area to be modified. The rectangle is defined by two points; upper left and lower right. The lower and right edges of this rectangle are not part of the bit-block transfer, meaning the rectangle is lower right exclusive.
 * 
 * <b>EngBitBlt</b> is never called with an empty destination rectangle. The two points that define the rectangle are always well ordered.
 * @param {Pointer<POINTL>} pptlSrc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the upper left corner of the source rectangle, if a source exists. If there is no source, the driver should ignore this parameter.
 * @param {Pointer<POINTL>} pptlMask Pointer to a POINTL structure that defines which pixel in the mask corresponds to the upper left corner of the destination rectangle. If no mask is specified in <i>psoMask</i> the driver should ignore this parameter.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure to be used to define the pattern for the bit-block transfer. GDI's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-brushobj_pvgetrbrush">BRUSHOBJ_pvGetRbrush</a> service routine retrieves the device's realization of the brush. The driver can ignore this parameter if the <i>rop4</i> parameter does not require a pattern.
 * @param {Pointer<POINTL>} pptlBrush Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin of the brush in the destination surface. The upper left pixel of the brush is aligned at this point and the brush repeats according to its dimensions. Ignore this parameter if the <i>rop4</i> parameter does not require a pattern.
 * @param {Integer} rop4 Represents a raster operation that defines how the mask, pattern, source, and destination pixels are combined to write an output pixel to the destination surface.
 * 
 * This is a quaternary raster operation, which is a natural extension of the usual ternary Rop3 operation. A Rop4 has 16 relevant bits, which are similar to the 8 defining bits of a Rop3. (The other, redundant bits of the Rop3 are ignored.) The simplest way to implement a Rop4 is to consider its 2 bytes separately. The lower byte specifies a Rop3 that should be computed wherever the mask is 1. The high byte specifies a Rop3 that can be computed and applied wherever the mask is 0.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b>, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engbitblt
 * @since windows5.0
 */
export EngBitBlt(psoTrg, psoSrc, psoMask, pco, pxlo, prclTrg, pptlSrc, pptlMask, pbo, pptlBrush, rop4) {
    result := DllCall("GDI32.dll\EngBitBlt", SURFOBJ.Ptr, psoTrg, SURFOBJ.Ptr, psoSrc, SURFOBJ.Ptr, psoMask, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, RECTL.Ptr, prclTrg, POINTL.Ptr, pptlSrc, POINTL.Ptr, pptlMask, BRUSHOBJ.Ptr, pbo, POINTL.Ptr, pptlBrush, "uint", rop4, BOOL)
    return result
}

/**
 * The EngLineTo function draws a single, solid, integer-only cosmetic line.
 * @remarks
 * The driver that has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvlineto">DrvLineTo</a> can call <b>EngLineTo</b> when the rendering surface is a device-independent bitmap (DIB).
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that defines the clip region in which the rendering must be done. No pixels can be affected outside this clip region.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that specifies the brush to use when drawing the line.
 * @param {Integer} x1 Specify the integer x-coordinate of the line's beginning point.
 * @param {Integer} y1 Specify the integer y-coordinate of the line's beginning point.
 * @param {Integer} x2 Specify the integer x-coordinate of the line's end point.
 * @param {Integer} y2 Specify the integer x- and y-coordinate of the line's end point.
 * @param {Pointer<RECTL>} prclBounds Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that describes the rectangle that bounds the unclipped line. Drivers that support hardware line drawing can use this rectangle to quickly determine whether the line fits in a coordinate space small enough to be rendered by the hardware.
 * @param {Integer} mix Defines how the incoming pattern should be mixed with the data already on the device surface. The low-order byte defines the raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
 * @returns {BOOL} <b>EngLineTo</b> returns <b>TRUE</b> if it succeeds; otherwise, it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-englineto
 * @since windows5.0
 */
export EngLineTo(pso, pco, pbo, x1, y1, x2, y2, prclBounds, mix) {
    result := DllCall("GDI32.dll\EngLineTo", SURFOBJ.Ptr, pso, CLIPOBJ.Ptr, pco, BRUSHOBJ.Ptr, pbo, "int", x1, "int", y1, "int", x2, "int", y2, RECTL.Ptr, prclBounds, "uint", mix, BOOL)
    return result
}

/**
 * The EngStretchBlt function causes GDI to do a stretching bit-block transfer.
 * @remarks
 * This function allows the same halftoning algorithm to be applied to GDI bitmaps and device surfaces.
 * 
 * The driver should call <b>EngStretchBlt</b> if it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvstretchblt">DrvStretchBlt</a> and is called to do something the driver does not support.
 * @param {Pointer<SURFOBJ>} psoDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer.
 * @param {Pointer<SURFOBJ>} psoMask Pointer to a SURFOBJ structure that defines a mask for the source. The mask is defined by a logic map, which is a bitmap with one bit per pixel.
 * 
 * The mask limits the area of the source that is copied. If this parameter is specified, it has an implicit <i>rop4</i> of 0xCCAA, meaning the source should be copied wherever the mask is 1, but the destination should be left alone wherever the mask is 0.
 * 
 * If this parameter is <b>NULL</b>, the <i>rop4</i> is implicitly 0xCCCC, which means the source should be copied everywhere in the source rectangle.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that limits the area to be modified in the destination. GDI services are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * 
 * Whenever possible, GDI simplifies the clipping involved. However, unlike <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvbitblt">DrvBitBlt</a>, <b>EngStretchBlt</b> can be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that specifies how color indices are to be translated between the source and target surfaces.
 * 
 * This XLATEOBJ structure can also be queried to find the RGB color for any source index. A high quality stretching bit-block transfer will need to interpolate colors in some cases.
 * @param {Pointer<COLORADJUSTMENT>} pca Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information, see the Microsoft Windows SDK documentation.
 * @param {Pointer<POINTL>} pptlHTOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin of the halftone brush. Drivers that use halftone brushes should align the upper left pixel of the brush's pattern with this point on the device surface.
 * @param {Pointer<RECTL>} prclDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the area to be modified in the coordinate system of the destination surface. This rectangle is defined by two points that are not well ordered, meaning the coordinates of the second point are not necessarily larger than those of the first point. The rectangle described does not include the lower and right edges. This function is never called with an empty destination rectangle.
 * 
 * If the destination rectangle is not well ordered, <b>EngStretchBlt</b> makes it well ordered.
 * @param {Pointer<RECTL>} prclSrc Pointer to a RECTL structure that defines the area to be copied, in the coordinate system of the source surface. The rectangle will map to the rectangle defined by <i>prclDest</i>. This function is never given an empty source rectangle, and the points of the source rectangle are always well-ordered.
 * 
 * The mapping is defined by <i>prclSrc</i> and <i>prclDest</i>. The points specified in <i>prclDest</i> and <i>prclSrc</i> lie on integer coordinates, which correspond to pixel centers. A rectangle defined by two such points is considered to be a geometric rectangle with two vertices whose coordinates are the given points, but with 0.5 subtracted from each coordinate. (POINTL structures are shorthand notation for specifying these fractional coordinate vertices.) 
 * 
 * The edges of any rectangle never intersect a pixel, but go around a set of pixels. The pixels that are inside the rectangle are those expected for a lower-right exclusive rectangle. <b>EngStretchBlt</b> maps the geometric source rectangle exactly onto the geometric destination rectangle.
 * @param {Pointer<POINTL>} pptlMask Pointer to a POINTL structure that defines the pixel in the given mask that corresponds to the upper left pixel in the source rectangle. This parameter is ignored if no mask is specified.
 * @param {Integer} iMode Specifies how source pixels are combined to get output pixels. The HALFTONE mode is slower than the other modes, but produces higher quality images.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>
 * BLACKONWHITE
 * 
 * </td>
 * <td>
 * On a shrinking bit-block transfer, pixels should be combined with a Boolean AND operation. On a stretching bit-block transfer, pixels should be replicated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * COLORONCOLOR
 * 
 * </td>
 * <td>
 * On a shrinking bit-block transfer, enough pixels should be ignored so that pixels don't need to be combined. On a stretching bit-block transfer, pixels should be replicated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * HALFTONE
 * 
 * </td>
 * <td>
 * The driver can use groups of pixels in the output surface to best approximate the color or gray level of the input.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * WHITEONBLACK
 * 
 * </td>
 * <td>
 * On a shrinking bit-block transfer, pixels should be combined with a Boolean OR operation. On a stretching bit-block transfer, pixels should be replicated.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b> and an error code is reported.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engstretchblt
 * @since windows5.0
 */
export EngStretchBlt(psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode) {
    result := DllCall("GDI32.dll\EngStretchBlt", SURFOBJ.Ptr, psoDest, SURFOBJ.Ptr, psoSrc, SURFOBJ.Ptr, psoMask, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, COLORADJUSTMENT.Ptr, pca, POINTL.Ptr, pptlHTOrg, RECTL.Ptr, prclDest, RECTL.Ptr, prclSrc, POINTL.Ptr, pptlMask, "uint", iMode, BOOL)
    return result
}

/**
 * The EngStretchBltROP function performs a stretching bit-block transfer using a ROP.
 * @remarks
 * The driver should call <b>EngStretchBltROP</b> if it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvstretchbltrop">DrvStretchBltROP</a> but cannot support all operations.
 * 
 * The mapping is defined by <i>prclSrc</i> and <i>prclDest</i>. The points specified in <i>prclDest</i> and <i>prclSrc</i> lie on integer coordinates that correspond to pixel centers. A rectangle defined by two such points is considered to be a geometric rectangle with two vertices whose coordinates are the given points, but with 0.5 subtracted from each coordinate. (POINTL structures are shorthand notation for specifying these fractional coordinate vertices.)
 * @param {Pointer<SURFOBJ>} psoDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer.
 * @param {Pointer<SURFOBJ>} psoMask Pointer to a SURFOBJ structure that defines a mask for the source surface. The mask is defined by a logic map, which is a bitmap with 1 bit per pixel. Typically, a mask limits the area that is to be modified in the destination surface. This mask should always be the same size as the source surface.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that limits the area to be modified in the destination. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * 
 * Whenever possible, GDI simplifies the clipping involved. However, unlike <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engbitblt">EngBitBlt</a>, <b>EngStretchBltROP</b> can be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that specifies how color indices are to be translated between the source and target surfaces.
 * 
 * This XLATEOBJ structure can also be queried to find the RGB color for any source index. A high quality stretching bit-block transfer will need to interpolate colors in some cases.
 * @param {Pointer<COLORADJUSTMENT>} pca Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information see the Windows SDK documentation.
 * @param {Pointer<POINTL>} pptlHTOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin of the halftone brush on the destination surface. When using halftone brushes, GDI aligns the upper left pixel of the brush's pattern at this point and repeats the brush according to its dimensions. GDI ignores this parameter if the <i>rop4</i> parameter does not require a pattern.
 * @param {Pointer<RECTL>} prclDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The two points that define the rectangle are not always well ordered, meaning the coordinates of the second point are not necessarily larger than those of the first point. If the destination rectangle is not well ordered, GDI makes it so.
 * 
 * The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the copy.
 * 
 * <b>EngStretchBltROP</b> must never be called with an empty destination rectangle.
 * @param {Pointer<RECTL>} prclSrc Pointer to a RECTL structure that defines the area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered.
 * 
 * The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the copy.
 * 
 * This rectangle maps to the rectangle to which <i>prclDest</i> points.
 * 
 * <b>EngStretchBltROP</b> must never be called with an empty source rectangle.
 * @param {Pointer<POINTL>} pptlMask Pointer to a POINTL structure that defines the pixel in the mask to which <i>prclMask</i> points. This pixel corresponds to the upper-left pixel in the source rectangle to which <i>prclSrc</i> points. This parameter is ignored if no mask is specified; that is, GDI ignores <i>pptlMask</i> when <i>prclMask</i> is <b>NULL</b>.
 * @param {Integer} iMode 
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure to be used to define the pattern for the bit-block transfer. GDI's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-brushobj_pvgetrbrush">BRUSHOBJ_pvGetRbrush</a> service routine retrieves the device's realization of the brush. GDI ignores this parameter if the <i>rop4</i> parameter does not require a pattern.
 * @param {Integer} rop4 Represents a raster operation that defines how the mask, pattern, source, and destination pixels are combined to write an output pixel to the destination surface.
 * 
 * This is a quaternary raster operation, which is a natural extension of the usual ternary Rop3 operation. A Rop4 has 16 relevant bits, which are similar to the 8 defining bits of a Rop3. (The other redundant bits of the Rop3 are ignored.) The simplest way to implement a Rop4 is to consider its 2 bytes separately. The lower byte specifies a Rop3 that should be computed wherever the mask to which <i>psoMask</i> points is 1. The high byte specifies a Rop3 that can be computed and applied wherever the mask is zero.
 * @returns {BOOL} <b>EngStretchBltROP</b> returns <b>TRUE</b> upon success. Otherwise, it reports an error and returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engstretchbltrop
 * @since windows5.0
 */
export EngStretchBltROP(psoDest, psoSrc, psoMask, pco, pxlo, pca, pptlHTOrg, prclDest, prclSrc, pptlMask, iMode, pbo, rop4) {
    result := DllCall("GDI32.dll\EngStretchBltROP", SURFOBJ.Ptr, psoDest, SURFOBJ.Ptr, psoSrc, SURFOBJ.Ptr, psoMask, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, COLORADJUSTMENT.Ptr, pca, POINTL.Ptr, pptlHTOrg, RECTL.Ptr, prclDest, RECTL.Ptr, prclSrc, POINTL.Ptr, pptlMask, "uint", iMode, BRUSHOBJ.Ptr, pbo, "uint", rop4, BOOL)
    return result
}

/**
 * The EngAlphaBlend function provides bit-block transfer capabilities with alpha blending.
 * @remarks
 * A bit-block transfer with alpha blending is supported between the following surfaces:
 * 
 * <ul>
 * <li>
 * From one <a href="https://docs.microsoft.com/windows-hardware/drivers/">device-managed surface</a> to another device-managed surface.
 * 
 * </li>
 * <li>
 * From one GDI-managed standard format bitmap to another GDI-managed standard format bitmap.
 * 
 * </li>
 * <li>
 * From one device-managed surface to a GDI-managed surface, and vice versa.
 * 
 * </li>
 * </ul>
 * The driver should never call <b>EngAlphaBlend</b> with overlapping source and destination rectangles on the same surface.
 * 
 * The three possible cases for the AC_SRC_OVER blend function are:
 * 
 * <ul>
 * <li>The source bitmap has no per-pixel alpha (AC_SRC_ALPHA is not set), so the blend is applied to the pixel's color channels based on the constant source alpha value specified in <b>SourceConstantAlpha</b> as follows:
 * 
 * 
 * ```
 * Dst.Red = Round(((Src.Red * SourceConstantAlpha) + 
 *     ((255 − SourceConstantAlpha) * Dst.Red)) / 255);
 * Dst.Green = Round(((Src.Green * SourceConstantAlpha) + 
 *     ((255 − SourceConstantAlpha) * Dst.Green)) / 255);
 * Dst.Blue = Round(((Src.Blue * SourceConstantAlpha) + 
 *     ((255 − SourceConstantAlpha) * Dst.Blue)) / 255);
 * // Do the next computation only if the destination bitmap 
 *     has an alpha channel. 
 * Dst.Alpha = Round(((Src.Alpha * SourceConstantAlpha) + 
 *     ((255 − SourceConstantAlpha) * Dst.Alpha)) / 255);
 * ```
 * 
 * 
 * </li>
 * <li>The source bitmap has per-pixel alpha values (AC_SRC_ALPHA is set), and <b>SourceConstantAlpha</b> is not used (it is set to 255). The blend is computed as follows:
 * 
 * 
 * ```
 * Dst.Red = Src.Red + 
 *     Round(((255 − Src.Alpha) * Dst.Red) / 255);
 * Dst.Green = Src.Green + 
 *     Round(((255 − Src.Alpha) * Dst.Green) / 255);
 * Dst.Blue = Src.Blue + 
 *     Round(((255 − Src.Alpha) * Dst.Blue) / 255);
 * // Do the next computation only if the destination bitmap 
 *     has an alpha channel. 
 * Dst.Alpha = Src.Alpha + 
 *     Round(((255 − Src.Alpha) * Dst.Alpha) / 255);
 * ```
 * 
 * 
 * </li>
 * <li>The source bitmap has per-pixel alpha values (AC_SRC_ALPHA is set), and <b>SourceConstantAlpha</b> is used (it is not set to 255). The blend is computed as follows:
 * 
 * 
 * ```
 * Temp.Red = Round((Src.Red * SourceConstantAlpha) / 255);
 * Temp.Green = Round((Src.Green * SourceConstantAlpha) / 255);
 * Temp.Blue = Round((Src.Blue * SourceConstantAlpha) / 255);
 * // The next computation must be done even if the 
 *     destination bitmap does not have an alpha channel. 
 * Temp.Alpha = Round((Src.Alpha * SourceConstantAlpha) / 255);
 *  
 * // Note that the following equations use the just-computed 
 *    Temp.Alpha value: 
 * Dst.Red = Temp.Red + 
 *     Round(((255 − Temp.Alpha) * Dst.Red) / 255);
 * Dst.Green = Temp.Green + 
 *     Round(((255 − Temp.Alpha) * Dst.Green) / 255);
 * Dst.Blue = Temp.Blue + 
 *     Round(((255 − Temp.Alpha) * Dst.Blue) / 255);
 * // Do the next computation only if the destination bitmap 
 *     has an alpha channel. 
 * Dst.Alpha = Temp.Alpha + 
 *     Round(((255 − Temp.Alpha) * Dst.Alpha) / 255);
 * ```
 * 
 * 
 * </li>
 * </ul>
 * The driver should call <b>EngAlphaBlend</b> if it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvalphablend">DrvAlphaBlend</a> and it is called to do something that it does not support.
 * @param {Pointer<SURFOBJ>} psoDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that identifies the surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to a SURFOBJ structure that identifies the source surface.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><b><i>Xxx</i></b> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved. However, unlike <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engbitblt">EngBitBlt</a>, <b>EngAlphaBlend</b> might be called with a single rectangle in order to prevent round-off errors in clipping the output.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that specifies how color indices should be translated between the source and destination surfaces.
 * 
 * If the source surface is palette managed, its colors are represented by indices into a lookup table of RGB color values. In this case, GDI can query the XLATEOBJ structure for a translate vector to quickly translate any source index into a color index for the destination.
 * 
 * The situation is more complicated when, for example, the source is RGB but the destination is palette-managed. In this case, the closest match to each source RGB value must be found in the destination palette. GDI calls the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-xlateobj_ixlate">XLATEOBJ_iXlate</a> service routine to perform this matching operation.
 * @param {Pointer<RECTL>} prclDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered.
 * 
 * The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the blend.
 * 
 * The specified rectangle can overhang the destination surface; GDI performs the proper clipping when it does.
 * 
 * <b>EngAlphaBlend</b> must never be called with an empty destination rectangle.
 * @param {Pointer<RECTL>} prclSrc Pointer to a RECTL structure that defines the area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered.
 * 
 * The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the blend.
 * 
 * The source rectangle must never exceed the bounds of the source surface, and thus never overhang the source surface.
 * 
 * <b>EngAlphaBlend</b> must never be called with an empty source rectangle.
 * 
 * The mapping is defined by <i>prclSrc</i> and <i>prclDest</i>. The points specified in <i>prclDest</i> and <i>prclSrc</i> lie on integer coordinates, which correspond to pixel centers. A rectangle defined by two such points is considered to be a geometric rectangle with two vertices whose coordinates are the given points, but with 0.5 subtracted from each coordinate. (POINTL structures are shorthand notation for specifying these fractional coordinate vertices.)
 * @param {Pointer<BLENDOBJ>} pBlendObj Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-blendobj">BLENDOBJ</a> structure that describes the blending operation to perform between the source and destination surfaces. This structure is a wrapper for the BLENDFUNCTION structure, which includes necessary source and destination format information that is not available in the XLATEOBJ structure . BLENDFUNCTION is declared in the Microsoft Windows SDK documentation. Its members are defined as follows:
 * 
 * <b>BlendOp</b> defines the blend operation to be performed. Currently this value must be AC_SRC_OVER, which means that the source bitmap is placed over the destination bitmap based on the alpha values of the source pixels. There are three possible cases that this blend operation should handle. These are described in the Remarks section of this reference page.
 * 
 * <b>BlendFlags</b> is reserved and is currently set to zero.
 * 
 * <b>SourceConstantAlpha</b> defines the constant blend factor to apply to the entire source surface. This value is in the range of [0,255], where 0 is completely transparent and 255 is completely opaque.
 * 
 * <b>AlphaFormat</b> defines whether the surface is assumed to have an alpha channel. This member can optionally be set to the following value:
 * @returns {BOOL} <b>EngAlphaBlend</b> returns <b>TRUE</b> upon success. If an error occurs, it returns <b>FALSE</b> and reports an error code.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engalphablend
 * @since windows5.0
 */
export EngAlphaBlend(psoDest, psoSrc, pco, pxlo, prclDest, prclSrc, pBlendObj) {
    result := DllCall("GDI32.dll\EngAlphaBlend", SURFOBJ.Ptr, psoDest, SURFOBJ.Ptr, psoSrc, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, RECTL.Ptr, prclDest, RECTL.Ptr, prclSrc, BLENDOBJ.Ptr, pBlendObj, BOOL)
    return result
}

/**
 * The EngGradientFill function shades the specified primitives.
 * @remarks
 * The driver should call <b>EngGradientFill</b> if it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvgradientfill">DrvGradientFill</a> and it is called to do something that it does not support.
 * 
 * The formulas used to compute the color value at each pixel depend on the value of <i>ulMode</i> as follows:
 * 
 * 
 * 
 * GDI ignores the alpha value of the vertices, leaving the alpha channel unchanged for surfaces that support alpha.
 * @param {Pointer<SURFOBJ>} psoDest Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that identifies the surface on which to draw.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure. This structure indicates how color indices should be translated between 32 bpp RGB format and the destination. The driver is responsible for converting the input COLOR16 color values to RGB.
 * @param {Pointer<TRIVERTEX>} pVertex Pointer to an array of TRIVERTEX structures, with each entry containing position and color information. The TRIVERTEX structure is described in the Microsoft Windows SDK documentation.
 * @param {Integer} nVertex Specifies the number of TRIVERTEX structures in the array to which <i>pVertex</i> points.
 * @param {Pointer<Void>} pMesh Pointer to an array of structures that define the connectivity of the TRIVERTEX elements to which <i>pVertex</i> points.
 * 
 * When rectangles are being drawn, <i>pMesh</i> points to an array of GRADIENT_RECT structures, each of which specifies two TRIVERTEX elements that define a rectangle. The TRIVERTEX elements can represent any diagonally-opposed pair of rectangle vertices. Rectangle drawing is lower-right exclusive. Both TRIVERTEX and GRADIENT_RECT are defined in the Windows SDK documentation.
 * 
 * When triangles are being drawn, <i>pMesh</i> points to an array of GRADIENT_TRIANGLE structures, each of which specifies the three TRIVERTEX elements that define a triangle. Triangle drawing is lower-right exclusive. The GRADIENT_TRIANGLE structure is defined in the Windows SDK documentation.
 * @param {Integer} nMesh Specifies the number of elements in the array to which <i>pMesh</i> points.
 * @param {Pointer<RECTL>} prclExtents Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the area in which the gradient drawing is to occur. The points are specified in the coordinate system of the destination surface. This parameter is useful in estimating the size of the drawing operations.
 * @param {Pointer<POINTL>} pptlDitherOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the origin on the surface for dithering. The upper-left pixel of the dither pattern is aligned with this point.
 * @param {Integer} ulMode 
 * @returns {BOOL} <b>EngGradientFill</b> returns <b>TRUE</b> upon success. Otherwise, it reports an error and returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-enggradientfill
 * @since windows5.0
 */
export EngGradientFill(psoDest, pco, pxlo, pVertex, nVertex, pMesh, nMesh, prclExtents, pptlDitherOrg, ulMode) {
    pMeshMarshal := pMesh is VarRef ? "ptr" : "ptr"

    result := DllCall("GDI32.dll\EngGradientFill", SURFOBJ.Ptr, psoDest, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, TRIVERTEX.Ptr, pVertex, "uint", nVertex, pMeshMarshal, pMesh, "uint", nMesh, RECTL.Ptr, prclExtents, POINTL.Ptr, pptlDitherOrg, "uint", ulMode, BOOL)
    return result
}

/**
 * The EngTransparentBlt function provides bit-block transfer capabilities with transparency.
 * @remarks
 * The driver should call <b>EngTransparentBlt</b> if it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtransparentblt">DrvTransparentBlt</a> and it is called to do something that it does not support.
 * 
 * Bit-block transfer with transparency is supported between two <a href="https://docs.microsoft.com/windows-hardware/drivers/">device-managed surfaces</a> or between a device-managed surface and a GDI-managed standard format bitmap. Currently, GDI supports only BMF_4BPP and BMF_8BPP source surfaces.
 * 
 * The pixels on the source surface that match the transparent color specified by <i>iTransparentColor</i> are not copied. For a detailed explanation of transparent blts, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/copying-bitmaps">Copying Bitmaps</a>.
 * @param {Pointer<SURFOBJ>} psoDst Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that identifies the target surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to the SURFOBJ structure that identifies the source surface of the bit-block transfer.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles. This enumeration limits the area of the destination that is modified. Whenever possible, GDI simplifies the clipping involved.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that tells how the source color indices should be translated for writing to the target surface.
 * @param {Pointer<RECTL>} prclDst Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the rectangular area to be modified. This rectangle is specified in the coordinate system of the destination surface and is defined by two points: upper left and lower right. The rectangle is lower-right exclusive; that is, its lower and right edges are not a part of the bit-block transfer. The two points that define the rectangle are always well ordered.
 * 
 * The driver must never call <b>EngTransparentBlt</b> with an empty destination rectangle.
 * @param {Pointer<RECTL>} prclSrc Pointer to a RECTL structure that defines the rectangular area to be copied. This rectangle is specified in the coordinate system of the source surface and is defined by two points: upper left and lower right. The two points that define the rectangle are always well ordered.
 * 
 * The source rectangle will never exceed the bounds of the source surface, and so will never overhang the source surface.
 * 
 * This rectangle is mapped to the destination rectangle defined by <i>prclDst</i>. The driver must never call <b>EngTransparentBlt</b> with an empty source rectangle.
 * @param {Integer} TransColor Specifies the physical transparent color, in the source surface's format. This is a color index value that has been translated to the source surface's palette. For more information, see the <b>Remarks</b> section.
 * @param {Integer} bCalledFromBitBlt Reserved. This parameter must be set to zero.
 * @returns {BOOL} <b>EngTransparentBlt</b> returns <b>TRUE</b> upon success. Otherwise, it returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engtransparentblt
 * @since windows5.0
 */
export EngTransparentBlt(psoDst, psoSrc, pco, pxlo, prclDst, prclSrc, TransColor, bCalledFromBitBlt) {
    result := DllCall("GDI32.dll\EngTransparentBlt", SURFOBJ.Ptr, psoDst, SURFOBJ.Ptr, psoSrc, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, RECTL.Ptr, prclDst, RECTL.Ptr, prclSrc, "uint", TransColor, "uint", bCalledFromBitBlt, BOOL)
    return result
}

/**
 * The EngTextOut function causes GDI to render a set of glyphs at specified positions.
 * @remarks
 * The driver should call <b>EngTextOut</b> when it has hooked <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvtextout">DrvTextOut</a> and cannot render the glyphs.
 * 
 * <div class="alert"><b>Note</b>    The driver cannot punt to <b>EngTextOut</b> if it has hooked <i>DrvTextOut</i> for a device managed surface.</div>
 * <div> </div>
 * The input parameters to <b>EngTextOut</b> define two sets of pixels: foreground and opaque. The driver must render the surface so the result is identical to a process where the opaque pixels are rendered first with the opaque brush, and then the foreground pixels are rendered with the foreground brush. Each of these operations is limited by clipping.
 * 
 * When the <i>pptlOrg</i> parameter of this function is set to 0, some printer drivers print color images incorrectly in Microsoft Windows Server 2003 (Japanese version). Setting <i>pptlOrg</i> to 0, a <b>NULL</b> pointer value, is interpreted to mean that no brush origin is defined. To prevent this problem, initialize <i>pptlOrg</i> with the address of a POINTL structure whose members are set to (0,0), prior to the call to <b>EngTextOut</b>.
 * 
 * The foreground and opaque pixels are regarded as a screen through which color is brushed onto the surface. The glyphs of the font do not have color in themselves.
 * 
 * The input parameters to <b>EngTextOut</b> define the set of glyph pixels, the set of extra rectangles, the opaque rectangle, and the clip region. The driver must calculate and then render the set of foreground and opaque pixels.
 * 
 * The mix mode defines how the incoming pattern should be mixed with the data already on the device surface. The MIX data type consists of two ROP2 values packed into a single ULONG. The low-order byte defines the foreground raster operation; the next byte defines the background raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to write.
 * @param {Pointer<STROBJ>} pstro Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-strobj">STROBJ</a> structure that defines the glyphs to be rendered and the positions where they are to be placed.
 * @param {Pointer<FONTOBJ>} pfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontobj">FONTOBJ</a> structure that is used to retrieve information about the font and its glyphs.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that defines the clip region through which rendering must be done. No pixels can be affected outside this clip region.
 * @param {Pointer<RECTL>} prclExtra Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure. This parameter should always be <b>NULL</b>.
 * @param {Pointer<RECTL>} prclOpaque Pointer to a RECTL structure that identifies a single opaque rectangle that is lower-right exclusive. Pixels within this rectangle (those that are not foreground and not clipped) are to be rendered with the opaque brush. This rectangle always bounds the text to be drawn. If this parameter is <b>NULL</b>, no opaque pixels are to be rendered.
 * @param {Pointer<BRUSHOBJ>} pboFore Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that represents the brush object to be used for the foreground pixels. This brush will always be a solid color brush.
 * @param {Pointer<BRUSHOBJ>} pboOpaque Pointer to a BRUSHOBJ structure that represents the brush object for the opaque pixels. Both the foreground and background mix modes for this brush are assumed to be R2_COPYPEN. Unless the driver sets the GCAPS_ARBRUSHOPAQUE capabilities bit in the <b>flGraphicsCaps</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-devinfo">DEVINFO</a> structure, it will always be called with a solid color brush.
 * @param {Pointer<POINTL>} pptlOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the brush origin for both brushes. If this parameter is set to 0 when <b>EngTextOut</b> is called, some printer drivers may print color images incorrectly. For more information, see <b>Remarks</b>.
 * @param {Integer} mix Specifies foreground and background raster operations (mix modes) for <i>pboFore</i>.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b>, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engtextout
 * @since windows5.0
 */
export EngTextOut(pso, pstro, pfo, pco, prclExtra, prclOpaque, pboFore, pboOpaque, pptlOrg, mix) {
    result := DllCall("GDI32.dll\EngTextOut", SURFOBJ.Ptr, pso, STROBJ.Ptr, pstro, FONTOBJ.Ptr, pfo, CLIPOBJ.Ptr, pco, RECTL.Ptr, prclExtra, RECTL.Ptr, prclOpaque, BRUSHOBJ.Ptr, pboFore, BRUSHOBJ.Ptr, pboOpaque, POINTL.Ptr, pptlOrg, "uint", mix, BOOL)
    return result
}

/**
 * The EngStrokePath function requests that GDI stroke a specified path.
 * @remarks
 * The mix mode defines how the incoming pattern should be mixed with the data already on the device surface. The MIX data type consists of two ROP2 values packed into a single ULONG. The low-order byte defines the foreground raster operation; the next byte defines the background raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure. The <b>PATHOBJ_</b><i>Xxx</i> service routines are provided to enumerate the lines, Bezier curves, and other data that make up the path. This indicates what is to be drawn.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles. Optionally, all the lines in the path can be enumerated preclipped by this CLIPOBJ. This means that drivers can have all their line clipping calculations done for them.
 * @param {Pointer<XFORMOBJ>} pxo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570618(v=vs.85)">XFORMOBJ</a> structure. This is needed only when a geometric wide line is to be drawn. It specifies the transform that converts world coordinates to device coordinates. This is needed because the path is provided in device coordinates but a geometric wide line is actually widened in world coordinates.
 * 
 * The driver can use the <b>XFORMOBJ_</b><i>Xxx</i> service routines to determine the transform.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that specifies the brush to be used when drawing the path.
 * @param {Pointer<POINTL>} pptlBrushOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the brush origin used to align the brush pattern on the device.
 * @param {Pointer<LINEATTRS>} plineattrs Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-lineattrs">LINEATTRS</a> structure. Note that the <b>elStyleState</b> member of this structure must be updated as part of this function if the line is styled. Also note the <b>ptlLastPel</b> member of the same structure must be updated if a single-pixel-width cosmetic line is being drawn.
 * @param {Integer} mix Specifies how to combine the brush with the destination.
 * @returns {BOOL} The return value is <b>TRUE</b> if GDI strokes the path. If the driver should stroke the path, the return value is <b>FALSE</b>, and no error is logged. If GDI encounters an error, the return value is DDI_ERROR, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engstrokepath
 * @since windows5.0
 */
export EngStrokePath(pso, ppo, pco, pxo, pbo, pptlBrushOrg, plineattrs, mix) {
    result := DllCall("GDI32.dll\EngStrokePath", SURFOBJ.Ptr, pso, PATHOBJ.Ptr, ppo, CLIPOBJ.Ptr, pco, XFORMOBJ.Ptr, pxo, BRUSHOBJ.Ptr, pbo, POINTL.Ptr, pptlBrushOrg, LINEATTRS.Ptr, plineattrs, "uint", mix, BOOL)
    return result
}

/**
 * The EngFillPath function fills a path.
 * @remarks
 * Whenever GDI fills a path on a <a href="https://docs.microsoft.com/windows-hardware/drivers/">device-managed surface</a>, it can call this entry point depending on a comparison of the fill requirements and the following GCAPS bits: GCAPS_BEZIERS, GCAPS_ALTERNATEFILL, and GCAPS_WINDINGFILL.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure that defines the path to be filled. Use the <b>PATHOBJ_</b><i>Xxx</i> service routines to enumerate the lines, Bezier curves, and other data that make up the path.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. Use the <b>CLIPOBJ_</b><i>Xxx</i> service routines to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that defines the pattern and colors with which to fill.
 * @param {Pointer<POINTL>} pptlBrushOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure defining the brush origin to use to align the brush pattern on the device.
 * @param {Integer} mix Defines the foreground and background raster operations to use for the brush.
 * @param {Integer} flOptions Specifies the mode to use when filling the path. This value should be FP_WINDINGMODE or FP_ALTERNATEMODE. All other flags should be ignored. For more information about these modes, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/path-fill-modes">Path Fill Modes</a>.
 * @returns {BOOL} The return value is <b>TRUE</b> if GDI is able to fill the path. Otherwise, it is <b>FALSE</b>, and an error code is not logged. If an error is encountered, the return value is <b>FALSE</b>, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engfillpath
 * @since windows5.0
 */
export EngFillPath(pso, ppo, pco, pbo, pptlBrushOrg, mix, flOptions) {
    result := DllCall("GDI32.dll\EngFillPath", SURFOBJ.Ptr, pso, PATHOBJ.Ptr, ppo, CLIPOBJ.Ptr, pco, BRUSHOBJ.Ptr, pbo, POINTL.Ptr, pptlBrushOrg, "uint", mix, "uint", flOptions, BOOL)
    return result
}

/**
 * The EngStrokeAndFillPath function causes GDI to fill a path and stroke it at the same time.
 * @remarks
 * The mix mode defines how the incoming pattern should be mixed with the data already on the device surface. The MIX data type consists of two ROP2 values packed into a single ULONG. The low-order byte defines the foreground raster operation; the next byte defines the background raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that defines the drawing surface.
 * @param {Pointer<PATHOBJ>} ppo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure that defines the path to be filled. The <b>PATHOBJ_</b><i>Xxx</i> service routines are provided to enumerate the lines, Bezier curves, and other data that make up the path.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * @param {Pointer<XFORMOBJ>} pxo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff570618(v=vs.85)">XFORMOBJ</a> structure that is only needed when a geometric wide line is to be drawn and specifies the transform that converts world coordinates to device coordinates. The path is provided in device coordinates but a geometric wide line is actually widened in world coordinates.
 * 
 * The driver can use the <b>XFORMOBJ_</b><i>Xxx</i> service routines to determine the transform.
 * @param {Pointer<BRUSHOBJ>} pboStroke Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that describes the brush to use when stroking the path.
 * @param {Pointer<LINEATTRS>} plineattrs Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-lineattrs">LINEATTRS</a> structure.
 * @param {Pointer<BRUSHOBJ>} pboFill Pointer to a BRUSHOBJ structure that describes the brush to use when filling the path.
 * @param {Pointer<POINTL>} pptlBrushOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the brush origin for both brushes.
 * @param {Integer} mixFill Defines the foreground and background raster operations to use for the fill brush.
 * @param {Integer} flOptions Specifies which fill mode to use. This parameter can be FP_WINDINGMODE or FP_ALTERNATEMODE; all other bits should be ignored. For more information about these modes, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/path-fill-modes">Path Fill Modes</a>.
 * @returns {BOOL} The return value is <b>TRUE</b> if GDI fills the path. If the driver should fill the path, the return value is <b>FALSE</b>, and an error code is not logged. If GDI encounters an unexpected error, such as not being able to realize the brush, the return value is DDI_ERROR, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engstrokeandfillpath
 * @since windows5.0
 */
export EngStrokeAndFillPath(pso, ppo, pco, pxo, pboStroke, plineattrs, pboFill, pptlBrushOrg, mixFill, flOptions) {
    result := DllCall("GDI32.dll\EngStrokeAndFillPath", SURFOBJ.Ptr, pso, PATHOBJ.Ptr, ppo, CLIPOBJ.Ptr, pco, XFORMOBJ.Ptr, pxo, BRUSHOBJ.Ptr, pboStroke, LINEATTRS.Ptr, plineattrs, BRUSHOBJ.Ptr, pboFill, POINTL.Ptr, pptlBrushOrg, "uint", mixFill, "uint", flOptions, BOOL)
    return result
}

/**
 * The EngPaint function causes GDI to paint a specified region.
 * @remarks
 * Vector device drivers can implement this function with the help of <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatepath">EngCreatePath</a> and <b>PATHOBJ_</b><i>Xxx</i> service routines.
 * 
 * The mix mode defines how the incoming pattern should be mixed with the data already on the device surface. The MIX data type consists of two ROP2 values packed into a single ULONG. The low-order byte defines the foreground raster operation; the next byte defines the background raster operation. For more information about raster operation codes, see the Microsoft Windows SDK documentation.
 * @param {Pointer<SURFOBJ>} pso Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that defines the area to be painted. The <b>CLIPOBJ_</b><i>Xxx</i> service routines are provided to enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * @param {Pointer<BRUSHOBJ>} pbo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-brushobj">BRUSHOBJ</a> structure that defines the pattern and colors with which to fill.
 * @param {Pointer<POINTL>} pptlBrushOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the brush origin used to align the brush pattern on the device.
 * @param {Integer} mix Defines the foreground and background raster operations to use for the brush.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b>, and an error code is logged.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engpaint
 * @since windows5.0
 */
export EngPaint(pso, pco, pbo, pptlBrushOrg, mix) {
    result := DllCall("GDI32.dll\EngPaint", SURFOBJ.Ptr, pso, CLIPOBJ.Ptr, pco, BRUSHOBJ.Ptr, pbo, POINTL.Ptr, pptlBrushOrg, "uint", mix, BOOL)
    return result
}

/**
 * The EngCopyBits function translates between device-managed raster surfaces and GDI standard-format bitmaps.
 * @remarks
 * Standard-format bitmaps are single-plane, packed-pixel format. Each scan line is aligned on a 4-byte boundary. These bitmaps have 1, 4, 8, 16, 24, or 32 bits per pixel. See the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatebitmap">EngCreateBitmap</a> function for a list of standard format types.
 * 
 * GDI calls this function from its simulations.
 * 
 * <b>EngCopyBits</b> should not be called with an empty destination rectangle, and the two points of the destination rectangle must be well-ordered; that is, the first point should represent the upper-left vertex of the rectangle, and the second should represent the lower-right vertex.
 * @param {Pointer<SURFOBJ>} psoDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the destination surface for the copy operation.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to a SURFOBJ structure that describes the source surface for the copy operation.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that restricts the area of the destination surface that will be affected. This parameter can be <b>NULL</b>.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that defines the translation of color indices between the source and target surfaces.
 * @param {Pointer<RECTL>} prclDest Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the area in the coordinate system of the destination surface that will be modified. The rectangle is lower-right exclusive, meaning the lower and right edges of this rectangle are not part of the copy.
 * @param {Pointer<POINTL>} pptlSrc Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that defines the upper left corner of the source rectangle.
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. If it is unsuccessful, it logs an error and returns <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcopybits
 * @since windows5.0
 */
export EngCopyBits(psoDest, psoSrc, pco, pxlo, prclDest, pptlSrc) {
    result := DllCall("GDI32.dll\EngCopyBits", SURFOBJ.Ptr, psoDest, SURFOBJ.Ptr, psoSrc, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, RECTL.Ptr, prclDest, POINTL.Ptr, pptlSrc, BOOL)
    return result
}

/**
 * The EngPlgBlt function causes GDI to perform a rotate bit-block transfer.
 * @remarks
 * <b>EngPlgBlt</b> performs only certain types of rotations.
 * 
 * This function performs bit-block transfers from a rectangle defined by <i>prcl</i> to any parallelogram. The parallelogram is defined by <i>pptfx</i>, which points to an array of three points.
 * 
 * The source rectangle at <i>prcl</i> is considered to be a geometric rectangle whose corners are displaced by (-0.5,-0.5) from the given integer coordinates. This exactly matches the source rectangle for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engstretchblt">EngStretchBlt</a>. The source rectangle is always well ordered.
 * 
 * The upper-left corner of the source rectangle is mapped to the first point, A. The upper-right corner of the source rectangle is mapped to the second point, B. The lower-left corner of the source rectangle is mapped to the third point, C. The lower-right corner of the source rectangle is mapped to the implicit point in the parallelogram defined by treating the three given points as vectors and computing:
 * 
 * 
 * ```
 * D = B + C - A
 * ```
 * 
 * 
 * Note that a stretch blit can be expressed exactly as a parallelogram blit, but the coordinates given for the destination will be divisible by five.
 * @param {Pointer<SURFOBJ>} psoTrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-surfobj">SURFOBJ</a> structure that describes the surface on which to draw.
 * @param {Pointer<SURFOBJ>} psoSrc Pointer to a SURFOBJ structure that describes the source surface for the bit-block transfer operation.
 * @param {Pointer<SURFOBJ>} psoMsk Pointer to an optional SURFOBJ structure that represents a mask for the source. It is defined by a logic map, which is a bitmap with one bit per pixel.
 * 
 * This mask limits the area of the source that is copied. A mask has an implicit <i>rop4</i> of 0xCCAA, which means the source should be copied wherever the mask is 1, but the destination should be left alone wherever the mask is zero.
 * 
 * If this parameter is <b>NULL</b>, there is an implicit <i>rop4</i> of 0xCCCC, which means the source should be copied everywhere in the source rectangle.
 * 
 * The mask will always be large enough to contain the relevant source; tiling is unnecessary.
 * @param {Pointer<CLIPOBJ>} pco Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-clipobj">CLIPOBJ</a> structure that limits the area of the destination to be modified. GDI functions enumerate the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> as a set of rectangles.
 * 
 * Whenever possible, GDI simplifies the clipping involved. Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvbitblt">DrvBitBlt</a> function, <b>EngPlgBlt</b> may be called with a single clipping rectangle. This prevents rounding errors in clipping the output.
 * @param {Pointer<XLATEOBJ>} pxlo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-xlateobj">XLATEOBJ</a> structure that defines how color indices are translated between the source and target surfaces. This XLATEOBJ structure can be queried to find the RGB color for any source index.
 * 
 * A high quality rotate bit-block transfer is needed to interpolate colors.
 * @param {Pointer<COLORADJUSTMENT>} pca Pointer to a COLORADJUSTMENT structure that defines the color adjustment values to be applied to the source bitmap before stretching the bits. For more information, see the Microsoft Windows SDK documentation.
 * @param {Pointer<POINTL>} pptlBrushOrg Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that specifies the origin of the halftone brush. Drivers that use halftone brushes should align the upper left pixel of the brush's pattern with this point on the device surface.
 * @param {Pointer<POINTFIX>} pptfx Pointer to three POINTFIX structures that define a parallelogram in the destination surface. A fourth, implicit, vertex is given as: D = B + C − A. For a description of this data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
 * 
 * <b>EngPlgBlt</b> is never called with A, B, and C collinear.
 * @param {Pointer<RECTL>} prcl Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines, in the coordinate system of the source surface, the area to be copied. The points of the source rectangle are well ordered. <b>EngPlgBlt</b> will never be given an empty source rectangle.
 * @param {Pointer<POINTL>} pptl Pointer to a POINTL structure that specifies which pixel in the given mask corresponds to the upper-left pixel in the source rectangle. Ignore this parameter if <i>psoMsk</i> is <b>NULL</b>.
 * @param {Integer} iMode 
 * @returns {BOOL} The return value is <b>TRUE</b> if the function is successful. Otherwise, it is <b>FALSE</b> and an error code is reported.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engplgblt
 * @since windows5.0
 */
export EngPlgBlt(psoTrg, psoSrc, psoMsk, pco, pxlo, pca, pptlBrushOrg, pptfx, prcl, pptl, iMode) {
    result := DllCall("GDI32.dll\EngPlgBlt", SURFOBJ.Ptr, psoTrg, SURFOBJ.Ptr, psoSrc, SURFOBJ.Ptr, psoMsk, CLIPOBJ.Ptr, pco, XLATEOBJ.Ptr, pxlo, COLORADJUSTMENT.Ptr, pca, POINTL.Ptr, pptlBrushOrg, POINTFIX.Ptr, pptfx, RECTL.Ptr, prcl, POINTL.Ptr, pptl, "uint", iMode, BOOL)
    return result
}

/**
 * The HT_Get8BPPFormatPalette function returns a halftone palette for use on standard 8-bits per pixel device types.
 * @remarks
 * <b>HT_Get8BPPFormatPalette</b> is a halftone-related GDI service that drivers can use to acquire the system's standard 8-bits per pixel halftone palette.
 * @param {Pointer<PALETTEENTRY>} pPaletteEntry Pointer to an array of PALETTEENTRY structures (described in the Microsoft Windows SDK documentation). When this pointer is not <b>NULL</b>, GDI assumes that it points to valid memory space in which GDI can place the entire 8-bits per pixel halftone palette.
 * @param {Integer} RedGamma Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @param {Integer} GreenGamma Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @param {Integer} BlueGamma Specifies the red, green, and blue gamma value. This USHORT value is interpreted as a real number whose four least-significant digits are to the right of the (implied) decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @returns {Integer} If <i>pPaletteEntry</i> is not <b>NULL</b>, the return value is the number of PALETTEENTRY structures that GDI filled in starting at the memory location pointed to by <i>pPaletteEntry</i>. If <i>pPaletteEntry</i> is <b>NULL</b>, the return value is the total count of PALETTEENTRY structures required to store the 8-bits per pixel halftone palette.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-ht_get8bppformatpalette
 * @since windows5.0
 */
export HT_Get8BPPFormatPalette(pPaletteEntry, RedGamma, GreenGamma, BlueGamma) {
    result := DllCall("GDI32.dll\HT_Get8BPPFormatPalette", PALETTEENTRY.Ptr, pPaletteEntry, "ushort", RedGamma, "ushort", GreenGamma, "ushort", BlueGamma, Int32)
    return result
}

/**
 * The HT_Get8BPPMaskPalette function returns a mask palette for an 8-bits-per-pixel device type.
 * @remarks
 * The PALETTEENTRY structure is documented in the Windows SDK documentation.
 * 
 * Calling <b>HT_Get8BPPMaskPalette</b> with <i>Use8BPPMaskPal</i> set <b>FALSE</b> is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-ht_get8bppformatpalette">HT_Get8BPPFormatPalette</a>.
 * 
 * See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/using-gdi-8-bit-per-pixel-cmy-mask-modes">Using GDI 8-Bit-Per-Pixel CMY Mask Modes</a> for more information about this function and how its parameters are used.
 * @param {Pointer<PALETTEENTRY>} pPaletteEntry Pointer to the array of PALETTEENTRY structures (described in the Windows SDK documentation) to be filled in. GDI assumes that it points to valid memory space in which GDI can place the entire 8-bit-per-pixel halftone palette. 
 * 
 * For a driver that runs on Windows XP and later operating system versions, GDI checks <i>pPaletteEntry</i>[0] to determine how to return the composed CMY palette. If <i>pPaletteEntry</i>[0] is set to 'RGB0', the palette will be in one of the CMY_INVERTED modes and will have its indexes inverted. That is, index 0 in the palette is black, and index 255 is white. If <i>pPaletteEntry</i>[0] is not set to 'RGB0', the palette is a normal CMY palette, with index 0 being white and index 255 being black. See <a href="https://docs.microsoft.com/windows-hardware/drivers/display/using-gdi-8-bit-per-pixel-cmy-mask-modes">Using GDI 8-Bit-Per-Pixel CMY Mask Modes</a> for new requirements and details on how to use this parameter.
 * 
 * Windows 2000 ignores any value the driver places in <i>pPaletteEntry</i>[0]. For this reason, if your driver is intended to run on Windows 2000 <i>and</i> on Windows XP or later versions, and your driver sets <i>pPaletteEntry</i>[0] to 'RGB0', the bitmaps your driver receives from Windows XP and later might have their colors inverted, relative to those received from Windows 2000. Therefore, such a driver must examine the palette before downloading a bitmap.
 * @param {BOOL} Use8BPPMaskPal Indicates which type of palette should be returned. When <i>Use8BPPMaskPal</i> is <b>TRUE</b>, <b>HT_Get8BPPMaskPalette</b> sets the <i>pPaletteEntry</i> parameter with the address of a CMY palette (an array of PALETTEENTRY structures) that is described by the bitmask specified in <i>CMYMask</i>. When <i>Use8BPPMaskPal</i> is <b>FALSE</b>, the function sets <i>pPaletteEntry</i> with the address of a standard RGB 8-bit-per-pixel halftone palette.
 * @param {Integer} CMYMask 
 * @param {Integer} RedGamma If <i>Use8BPPMaskPal</i> is <b>TRUE</b>, the value of this parameter is  not used. In that case, gamma values will be specified in the <b>ciDevice</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure. 
 * 
 * If <i>Use8BPPMaskPal</i> is <b>FALSE</b>, the value of this parameter specifies the red gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @param {Integer} GreenGamma If <i>Use8BPPMaskPal</i> is <b>TRUE</b>, the value of this parameter is  not used. In that case, gamma values will be specified in the <b>ciDevice</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure. 
 * 
 * If <i>Use8BPPMaskPal</i> is <b>FALSE</b>, the value of this parameter specifies the green gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @param {Integer} BlueGamma If <i>Use8BPPMaskPal</i> is <b>TRUE</b>, the value of this parameter is  not used. In that case, gamma values will be specified in the <b>ciDevice</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-gdiinfo">GDIINFO</a> structure. 
 * 
 * If <i>Use8BPPMaskPal</i> is <b>FALSE</b>, the value of this parameter specifies the blue gamma value, out of the red, green and blue gamma values that GDI is to use to gamma-correct the palette. The USHORT value is interpreted as a real number whose four least-significant digits are to the right of the decimal point. For example, a gamma value of 10000 represents the real number 1.0000, and 12345 represents 1.2345. The minimum gamma value allowed is 0.0000, and the maximum allowable value is 6.5535.
 * @returns {Integer} If <i>pPaletteEntry</i> is not <b>NULL</b>, <b>HT_Get8BPPMaskPalette</b> returns the number of PALETTEENTRY structures that GDI filled out in the array to which <i>pPaletteEntry</i> points. If <i>pPaletteEntry</i> is <b>NULL</b>, the value returned is the total count of PALETTEENTRY structures required to store the halftone palette.
 * 
 * If an illegal value of the <i>CMYMask</i> parameter is used in the call to this function, <b>HT_Get8BPPMaskPalette</b> returns a value of zero.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-ht_get8bppmaskpalette
 * @since windows5.0
 */
export HT_Get8BPPMaskPalette(pPaletteEntry, Use8BPPMaskPal, CMYMask, RedGamma, GreenGamma, BlueGamma) {
    result := DllCall("GDI32.dll\HT_Get8BPPMaskPalette", PALETTEENTRY.Ptr, pPaletteEntry, BOOL, Use8BPPMaskPal, "char", CMYMask, "ushort", RedGamma, "ushort", GreenGamma, "ushort", BlueGamma, Int32)
    return result
}

/**
 * The EngGetPrinterDataFileName function retrieves the string name of the printer's data file.
 * @param {HDEV} _hdev Handle to the device. This is the GDI handle received by the driver as the <i>hdev</i> parameter for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcompletepdev">DrvCompletePDEV</a>.
 * @returns {PWSTR} <b>EngGetPrinterDataFileName</b> returns a pointer to the null-terminated string buffer in which the name of the printer's data file is specified. The system obtains and stores the printer's data file name from the DRIVER_INFO_2 structure (described in the Microsoft Windows SDK documentation) when the driver is first installed through the Microsoft Win32 <b>AddPrinterDriver</b> routine.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-enggetprinterdatafilename
 * @since windows5.0
 */
export EngGetPrinterDataFileName(_hdev) {
    result := DllCall("GDI32.dll\EngGetPrinterDataFileName", HDEV, _hdev, PWSTR)
    return result
}

/**
 * The EngGetDriverName function returns the name of the driver's DLL.
 * @param {HDEV} _hdev Handle to the device. This is the GDI handle received by the driver as the <i>hdev</i> parameter for <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvcompletepdev">DrvCompletePDEV</a>.
 * @returns {PWSTR} <b>EngGetDriverName</b> returns a pointer to the null-terminated string buffer in which the name of the driver's DLL is specified. The system obtains and stores the driver's name from the DRIVER_INFO_2 structure when the driver is first installed through the Win32 <b>AddPrinterDriver</b> routine.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-enggetdrivername
 * @since windows5.0
 */
export EngGetDriverName(_hdev) {
    result := DllCall("GDI32.dll\EngGetDriverName", HDEV, _hdev, PWSTR)
    return result
}

/**
 * The EngLoadModule function loads the specified data module into system memory for reading.
 * @remarks
 * <b>EngLoadModule</b> loads a data file into system memory with read-only permission. To access the loaded module, the driver should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engmapmodule">EngMapModule</a> with the handle returned by this function.
 * 
 * The file identified by <i>pwsz</i> must be located in the <i>%SystemRoot%\System32</i> directory or within a directory found in the directory hierarchy under <i>%SystemRoot%\System32</i>.
 * 
 * To load a writable module, the driver should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engloadmoduleforwrite">EngLoadModuleForWrite</a>. Drivers that need to load an image as executable code should call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engloadimage">EngLoadImage</a> instead of this function.
 * @param {PWSTR} pwsz Pointer to a null-terminated string that contains the name of the data file to be loaded.
 * @returns {HANDLE} If <b>EngLoadModule</b> succeeds, the return value is a handle to the module that was loaded. Otherwise, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engloadmodule
 * @since windows5.0
 */
export EngLoadModule(pwsz) {
    pwsz := pwsz is String ? StrPtr(pwsz) : pwsz

    result := DllCall("GDI32.dll\EngLoadModule", "ptr", pwsz, HANDLE.Owned)
    return result
}

/**
 * The EngFindResource function determines the location of a resource in a module.
 * @remarks
 * The size of a successfully located resource is returned in <i>pulSize</i>.
 * @param {HANDLE} h Handle to the module that contains the resource. This handle is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engloadmodule">EngLoadModule</a>.
 * @param {Integer} iName Is an integer identifier representing the name of the resource being looked up.
 * @param {Integer} iType Is an integer identifier representing the type of the resource being looked up.
 * @param {Pointer<Integer>} pulSize Pointer to a ULONG in which the resource's size, in bytes, is returned.
 * @returns {Pointer<Void>} The return value is a pointer to the address of the specified resource. The function returns <b>NULL</b> if an error occurs.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engfindresource
 * @since windows5.0
 */
export EngFindResource(h, iName, iType, pulSize) {
    pulSizeMarshal := pulSize is VarRef ? "uint*" : "ptr"

    result := DllCall("GDI32.dll\EngFindResource", HANDLE, h, "int", iName, "int", iType, pulSizeMarshal, pulSize, IntPtr)
    return result
}

/**
 * The EngFreeModule function unmaps a file from system memory.
 * @param {HANDLE} h Handle to the memory-mapped file to be freed. This handle was obtained from <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engloadmodule">EngLoadModule</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engloadmoduleforwrite">EngLoadModuleForWrite</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engfreemodule
 * @since windows5.0
 */
export EngFreeModule(h) {
    DllCall("GDI32.dll\EngFreeModule", HANDLE, h)
}

/**
 * The EngCreateSemaphore function creates a semaphore object.
 * @remarks
 * Graphics drivers can create and use a semaphore object for resource synchronization. For example:
 * 
 * <ul>
 * <li>
 * The <i>Permedia</i> display driver uses a semaphore when an asynchronous pointer requires access to the CRTC registers, because these registers are shared by both the asynchronous hardware pointers and the synchronous activities of the device.
 * 
 * </li>
 * <li>
 * Multiple printer drivers sharing global data, such as font data on a print server, need to synchronize access to this data.
 * 
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  The Microsoft Windows Driver Kit (WDK) does not contain the 3Dlabs Permedia2 (<i>3dlabs.htm</i> ) and 3Dlabs Permedia3 (<i>Perm3.htm</i>) sample display drivers. You can get these sample drivers from the Windows Server 2003 SP1 Driver Development Kit (DDK), which you can download from the <a href="https://docs.microsoft.com/windows-hardware/drivers/devtest/">DDK - Windows Driver Development Kit</a> page of the WDHC website.</div>
 * <div> </div>
 * @returns {HSEMAPHORE} If the function succeeds, the return value is a handle to the semaphore object. A null pointer is returned if the function fails.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcreatesemaphore
 * @since windows5.0
 */
export EngCreateSemaphore() {
    result := DllCall("GDI32.dll\EngCreateSemaphore", HSEMAPHORE.Owned)
    return result
}

/**
 * The EngAcquireSemaphore function acquires the resource associated with the semaphore for exclusive access by the calling thread.
 * @remarks
 * <b>EngAcquireSemaphore</b> allows exclusive access to the driver resource associated with the semaphore by locking out all other threads from accessing the semaphore's resource.
 * 
 * A call to this routine should be followed with a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engreleasesemaphore">EngReleaseSemaphore</a> as quickly as possible.
 * @param {HSEMAPHORE} hsem Handle to the semaphore associated with the resource to be acquired.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engacquiresemaphore
 * @since windows5.0
 */
export EngAcquireSemaphore(hsem) {
    DllCall("GDI32.dll\EngAcquireSemaphore", HSEMAPHORE, hsem)
}

/**
 * The EngReleaseSemaphore function releases the specified semaphore.
 * @remarks
 * <b>EngReleaseSemaphore</b> releases the semaphore's exclusive lock on a driver's resource and reenables the delivery of special kernel asynchronous procedure calls.
 * 
 * The lock and asynchronous procedure call suspension were acquired in a call to <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engacquiresemaphore">EngAcquireSemaphore</a>.
 * @param {HSEMAPHORE} hsem Handle to the semaphore to be released.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engreleasesemaphore
 * @since windows5.0
 */
export EngReleaseSemaphore(hsem) {
    DllCall("GDI32.dll\EngReleaseSemaphore", HSEMAPHORE, hsem)
}

/**
 * The EngDeleteSemaphore function deletes a semaphore object from the system's resource list.
 * @param {HSEMAPHORE} hsem Handle to the semaphore to be deleted. The semaphore was created in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engcreatesemaphore">EngCreateSemaphore</a>.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engdeletesemaphore
 * @since windows5.0
 */
export EngDeleteSemaphore(hsem) {
    DllCall("GDI32.dll\EngDeleteSemaphore", HSEMAPHORE, hsem)
}

/**
 * The EngMultiByteToUnicodeN function converts the specified ANSI source string into a Unicode string using the current ANSI code page.
 * @param {Integer} UnicodeString Pointer to the buffer that receives the resultant Unicode string.
 * @param {Integer} MaxBytesInUnicodeString Supplies the maximum number of bytes to be written to <i>UnicodeString. </i>If this value is too small, causing <i>UnicodeString</i> to be a truncated equivalent of <i>MultiByteString</i>, no error condition results.
 * @param {Pointer<Integer>} BytesInUnicodeString Pointer to a ULONG that receives the number of bytes written to <i>UnicodeString</i>.
 * @param {Integer} MultiByteString Pointer to the ANSI source string that is to be converted to Unicode.
 * @param {Integer} BytesInMultiByteString Specifies the number of bytes in <i>MultiByteString.</i>
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engmultibytetounicoden
 * @since windows5.0
 */
export EngMultiByteToUnicodeN(UnicodeString, MaxBytesInUnicodeString, BytesInUnicodeString, MultiByteString, BytesInMultiByteString) {
    BytesInUnicodeStringMarshal := BytesInUnicodeString is VarRef ? "uint*" : "ptr"

    DllCall("GDI32.dll\EngMultiByteToUnicodeN", "ptr", UnicodeString, "uint", MaxBytesInUnicodeString, BytesInUnicodeStringMarshal, BytesInUnicodeString, "ptr", MultiByteString, "uint", BytesInMultiByteString)
}

/**
 * The EngUnicodeToMultiByteN function converts the specified Unicode string into an ANSI string using the current ANSI code page.
 * @param {Integer} MultiByteString Pointer to the buffer that receives the resultant ANSI string.
 * @param {Integer} MaxBytesInMultiByteString Specifies the maximum number of bytes to be written to <i>MultiByteString. </i>If this value is too small, causing <i>MultiByteString</i> to be a truncated equivalent of <i>UnicodeString</i>, then no error condition results.
 * @param {Pointer<Integer>} BytesInMultiByteString Pointer to a ULONG that receives the number of bytes written to <i>MultiByteString</i>.
 * @param {Integer} UnicodeString Pointer to the Unicode source string that is to be converted to ANSI.
 * @param {Integer} BytesInUnicodeString Specifies the number of bytes in <i>UnicodeString.</i>
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engunicodetomultibyten
 * @since windows5.0
 */
export EngUnicodeToMultiByteN(MultiByteString, MaxBytesInMultiByteString, BytesInMultiByteString, UnicodeString, BytesInUnicodeString) {
    BytesInMultiByteStringMarshal := BytesInMultiByteString is VarRef ? "uint*" : "ptr"

    DllCall("GDI32.dll\EngUnicodeToMultiByteN", "ptr", MultiByteString, "uint", MaxBytesInMultiByteString, BytesInMultiByteStringMarshal, BytesInMultiByteString, "ptr", UnicodeString, "uint", BytesInUnicodeString)
}

/**
 * The EngQueryLocalTime function queries the local time.
 * @remarks
 * <b>EngQueryLocalTime</b> returns the time at the current locale in the ENG_TIME_FIELDS structure.
 * @param {Pointer<ENG_TIME_FIELDS>} param0 
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engquerylocaltime
 * @since windows5.0
 */
export EngQueryLocalTime(param0) {
    DllCall("GDI32.dll\EngQueryLocalTime", ENG_TIME_FIELDS.Ptr, param0)
}

/**
 * The EngComputeGlyphSet function computes the glyph set supported on a device.
 * @remarks
 * A driver can use <b>EngComputeGlyphSet</b> to compute the glyph set for a font that contains only glyphs in the code page described by <i>nCodePage</i>.
 * 
 * The driver must call <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engfreemem">EngFreeMem</a> to free memory when it is done using the FD_GLYPHSET structure returned by <b>EngComputeGlyphSet</b>.
 * @param {Integer} nCodePage Specifies the code page supported.
 * @param {Integer} nFirstChar Specifies the character code of the first supported ANSI character.
 * @param {Integer} cChars Specifies the number of ANSI characters supported.
 * @returns {Pointer<FD_GLYPHSET>} If the glyph set is computed successfully, the function returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_glyphset">FD_GLYPHSET</a> structure. If an error occurs, the function returns <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engcomputeglyphset
 * @since windows5.0
 */
export EngComputeGlyphSet(nCodePage, nFirstChar, cChars) {
    result := DllCall("GDI32.dll\EngComputeGlyphSet", "int", nCodePage, "int", nFirstChar, "int", cChars, FD_GLYPHSET.Ptr)
    return result
}

/**
 * The EngMultiByteToWideChar function converts an ANSI source string into a wide character string using the specified code page.
 * @param {Integer} CodePage Specifies the code page to use to perform the translation.
 * @param {Integer} WideCharString Pointer to the buffer into which the translated character string is copied.
 * @param {Integer} BytesInWideCharString Specifies the size, in bytes, of <i>WideCharString</i>. If <i>WideCharString</i> is not large enough to contain the translation, <b>EngMultiByteToWideChar</b> truncates the string, and does not report an error.
 * @param {Integer} MultiByteString Pointer to the buffer containing the multibyte string to be translated.
 * @param {Integer} BytesInMultiByteString Specifies the number of bytes in <i>MultiByteString.</i>
 * @returns {Integer} The <b>EngMultiByteToWideChar</b> function returns the number of bytes it converted to wide character form, if successful. Otherwise, the function returns -1.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engmultibytetowidechar
 * @since windows5.0
 */
export EngMultiByteToWideChar(CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString) {
    result := DllCall("GDI32.dll\EngMultiByteToWideChar", "uint", CodePage, "ptr", WideCharString, "int", BytesInWideCharString, "ptr", MultiByteString, "int", BytesInMultiByteString, Int32)
    return result
}

/**
 * The EngWideCharToMultiByte function converts a wide character string into an ANSI source string using the specified code page.
 * @param {Integer} CodePage Specifies the code page to use to perform the translation.
 * @param {Integer} WideCharString Pointer to a buffer containing the wide character string to be translated.
 * @param {Integer} BytesInWideCharString Specifies the size, in bytes, of <i>WideCharString</i>.
 * @param {Integer} MultiByteString Pointer to a buffer into which the translated character string is to be copied
 * @param {Integer} BytesInMultiByteString Specifies the number of bytes in <i>MultiByteString</i>. If <i>MultiByteString</i> is not large enough to contain the translation, <b>EngWideCharToMultiByte</b> truncates the string, and does not report an error.
 * @returns {Integer} <b>EngWideCharToMultiByte</b> returns the number of bytes converted into multibyte form, if successful. Otherwise, it returns -1.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-engwidechartomultibyte
 * @since windows5.0
 */
export EngWideCharToMultiByte(CodePage, WideCharString, BytesInWideCharString, MultiByteString, BytesInMultiByteString) {
    result := DllCall("GDI32.dll\EngWideCharToMultiByte", "uint", CodePage, "ptr", WideCharString, "int", BytesInWideCharString, "ptr", MultiByteString, "int", BytesInMultiByteString, Int32)
    return result
}

/**
 * The EngGetCurrentCodePage function returns the system's default OEM and ANSI code pages.
 * @remarks
 * <b>EngGetCurrentCodePage</b> returns the default code pages that are used by the system to translate from ANSI to Unicode. These values are set at boot time according to locale settings.
 * @param {Pointer<Integer>} OemCodePage Pointer to a USHORT that receives the system's default OEM code page.
 * @param {Pointer<Integer>} AnsiCodePage Pointer to a USHORT that receives the system's default ANSI code page.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winddi/nf-winddi-enggetcurrentcodepage
 * @since windows5.0
 */
export EngGetCurrentCodePage(OemCodePage, AnsiCodePage) {
    OemCodePageMarshal := OemCodePage is VarRef ? "ushort*" : "ptr"
    AnsiCodePageMarshal := AnsiCodePage is VarRef ? "ushort*" : "ptr"

    DllCall("GDI32.dll\EngGetCurrentCodePage", OemCodePageMarshal, OemCodePage, AnsiCodePageMarshal, AnsiCodePage)
}

/**
 * 
 * @param {HDEV} _hdev 
 * @param {Pointer<EMFINFO>} pEMFInfo 
 * @returns {BOOL} 
 */
export EngQueryEMFInfo(_hdev, pEMFInfo) {
    result := DllCall("GDI32.dll\EngQueryEMFInfo", HDEV, _hdev, EMFINFO.Ptr, pEMFInfo, BOOL)
    return result
}

/**
 * The GetDisplayConfigBufferSizes function retrieves the size of the buffers that are required to call the QueryDisplayConfig function.
 * @remarks
 * Given the current display path configuration and the requested flags, <b>GetDisplayConfigBufferSizes</b> returns the size of the path and mode tables that are required to store the information. <b>GetDisplayConfigBufferSizes</b> can return values that are slightly larger than are actually required because it determines that all source and target paths are valid; whereas, the driver might place some restrictions on the possible combinations.
 * 
 * As <b>GetDisplayConfigBufferSizes</b> can only determine the required array size of that moment in time, it is possible that between calls to <b>GetDisplayConfigBufferSizes</b> and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> the system configuration has changed and the provided array sizes are no longer sufficient to store the new path data. 
 * 
 * If a caller is aware that it must enable additional sources and targets, the caller can allocate a larger mode information array than is returned from <b>GetDisplayConfigBufferSizes</b> so that it has the space to add the additional source and target modes after calling <b>QueryDisplayConfig</b> and before calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setdisplayconfig">SetDisplayConfig</a>.
 * @param {QUERY_DISPLAY_CONFIG_FLAGS} flags 
 * @param {Pointer<Integer>} numPathArrayElements Pointer to a variable that receives the number of elements in the path information table. The <i>pNumPathArrayElements</i> parameter value is then used by a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> function. This parameter cannot be <b>NULL</b>.
 * @param {Pointer<Integer>} numModeInfoArrayElements Pointer to a variable that receives the number of elements in the mode information table. The <i>pNumModeInfoArrayElements</i> parameter value is then used by a subsequent call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> function. This parameter cannot be <b>NULL</b>.
 * @returns {WIN32_ERROR} The function returns one of the following return codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The combination of parameters and flags that are specified is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is not running a graphics driver that was written according to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">Windows Display Driver Model (WDDM)</a>. The function is only supported on a system with a WDDM driver running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have access to the console session. This error occurs if the calling process does not have access to the current desktop or is running on a remote session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdisplayconfigbuffersizes
 * @since windows6.0.6000
 */
export GetDisplayConfigBufferSizes(flags, numPathArrayElements, numModeInfoArrayElements) {
    numPathArrayElementsMarshal := numPathArrayElements is VarRef ? "uint*" : "ptr"
    numModeInfoArrayElementsMarshal := numModeInfoArrayElements is VarRef ? "uint*" : "ptr"

    result := DllCall("USER32.dll\GetDisplayConfigBufferSizes", QUERY_DISPLAY_CONFIG_FLAGS, flags, numPathArrayElementsMarshal, numPathArrayElements, numModeInfoArrayElementsMarshal, numModeInfoArrayElements, WIN32_ERROR)
    return result
}

/**
 * The SetDisplayConfig function modifies the display topology, source, and target modes by exclusively enabling the specified paths in the current session.
 * @remarks
 * The <b>SetDisplayConfig</b> function takes the active display paths with any specified source and target mode information and uses best mode logic to generate any missing source and target mode information. This function then sets the complete display path.
 * 
 * The <b>ModeInfoIdx</b> members in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_source_info">DISPLAYCONFIG_PATH_SOURCE_INFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structures are used to indicate whether source and target mode are supplied for a given active path. If the index value is DISPLAYCONFIG_PATH_MODE_IDX_INVALID for either, this indicates the mode information is not being specified. It is valid for the path plus source mode or the path plus source and target mode information to be specified for a given path. However, it is not valid for the path plus target mode to be specified without the source mode.
 * 
 * The source and target modes for each source and target identifiers can only appear in the <i>modeInfoArray</i> array once. For example, a source mode for source identifier S1 can only appear in the table once; if multiple paths reference the same source, they have to use the same <b>ModeInfoIdx</b>.
 * 
 * The expectation is that most callers use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-querydisplayconfig">QueryDisplayConfig</a> to get the current configuration along with other valid possibilities and then use <b>SetDisplayConfig</b> to test and set the configuration.
 * 
 * The order in which the active paths appear in the <i>PathArray</i> array determines the path priority.
 * 
 * By default, <b>SetDisplayConfig</b> never changes any supplied path, source mode, or target mode information. If best mode logic cannot find a solution without changing the specified display path information, <b>SetDisplayConfig</b> fails with ERROR_BAD_CONFIGURATION. In this case, the caller should specify the SDC_ALLOW_CHANGES flag to allow the function to tweak some of the specified source and mode details to allow the display path change to be successful.
 * 
 * If the specified or calculated source and target modes have the same dimensions, <b>SetDisplayConfig</b> automatically sets the path scaling to DISPLAYCONFIG_PPR_IDENTITY before setting the display path and saving it in the database. For information about how <b>SetDisplayConfig</b> handles scaling, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/scaling-the-desktop-image">Scaling the Desktop Image</a>.
 * 
 * When the caller specifies the SDC_USE_SUPPLIED_DISPLAY_CONFIG flag to set a clone path and if any source mode indexes are invalid in the path array, <b>SetDisplayConfig</b> determines that all of the source mode indexes from that source are invalid. <b>SetDisplayConfig</b> uses the best mode logic to determine the source mode information. 
 * 
 * Except for the SDC_TOPOLOGY_SUPPLIED flag (for more information about SDC_TOPOLOGY_SUPPLIED, see the following paragraph), the SDC_TOPOLOGY_XXX flags set last display path settings, including the source and target mode information for that topology type. For information about valid SDC_TOPOLOGY_XXX flag combinations, see the <i>Flags</i> parameter description. The <i>pathArray</i> and <i>modeInfoArray</i> parameters must be <b>NULL</b>, and their associated sizes must be zero. For example, if SDC_TOPOLOGY_CLONE and SDC_TOPOLOGY_EXTEND are set, this function uses the most recent clone or extend display path configuration. If a single topology type is requested, the last configuration of that type is used. If that topology had never been set before, <b>SetDisplayConfig</b> uses the best topology logic to find the best topology, and then best mode logic to find the best source and target mode to use. If a combination of the topology flags had been set and none of them had database entries, the following priority is used. For laptops: clone, extend, internal, and then external; for desktops the priority is extend and then clone.
 * 
 * The caller can specify the SDC_TOPOLOGY_SUPPLIED flag to indicate that it sets just the path information (topology) and requests that <b>SetDisplayConfig</b> obtains and then uses the source and target mode information from the persistence database. If the active paths that the caller supplies do not have an entry in the persistence database, <b>SetDisplayConfig</b> fails. In this case, if the caller calls <b>SetDisplayConfig</b> again with the same path data but with the SDC_USE_SUPPLIED_DISPLAY_CONFIG flag set, <b>SetDisplayConfig</b> uses best mode logic to create the source and target mode information. When the caller specifies SDC_TOPOLOGY_SUPPLIED, the caller must set the <i>numModeInfoArrayElements</i> parameter to zero and the <i>modeInfoArray</i> parameter to <b>NULL</b>; however, the caller must set the <i>pathArray</i> and <i>numPathArrayElements</i> parameters for the path information that the caller requires. The caller must mark all the source and target mode indexes as invalid (DISPLAYCONFIG_PATH_MODE_IDX_INVALID) in this path data. 
 * 
 * The following table provides some common scenarios where <b>SetDisplayConfig</b> is called along with the flag combinations that the caller passes to the <i>Flags</i> parameter to achieve the scenarios.
 * 
 * <table>
 * <tr>
 * <th>Scenario</th>
 * <th>Flag combination</th>
 * </tr>
 * <tr>
 * <td>
 * Test whether a specified display configuration is supported on the computer
 * 
 * </td>
 * <td>
 * SDC_VALIDATE | SDC_USE_SUPPLIED_DISPLAY_CONFIG
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Set a specified display configuration and save to the database
 * 
 * </td>
 * <td>
 * SDC_APPLY | SDC_USE_SUPPLIED_DISPLAY_CONFIG | SDC_SAVE_TO_DATABASE
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Set a temporary display configuration (that is, the display configuration will not be saved)
 * 
 * </td>
 * <td>
 * SDC_APPLY | SDC_USE_SUPPLIED_DISPLAY_CONFIG
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Test whether clone is supported on the computer
 * 
 * </td>
 * <td>
 * SDC_VALIDATE | SDC_TOPOLOGY_CLONE
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Set clone topology
 * 
 * </td>
 * <td>
 * SDC_APPLY | SDC_TOPOLOGY_CLONE
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Set clone topology and allow path persistence to be enabled if required to satisfy the request
 * 
 * </td>
 * <td>
 * SDC_APPLY | SDC_TOPOLOGY_CLONE | SDC_PATH_PERSIST_IF_REQUIRED
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Return from a temporary mode to the last saved display configuration
 * 
 * </td>
 * <td>
 * SDC_APPLY| SDC_USE_DATABASE_CURRENT
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * Given only the path information, set the display configuration with the source and target information from the database for the paths and ignore the path order
 * 
 * </td>
 * <td>
 * SDC_APPLY | SDC_TOPOLOGY_SUPPLIED | SDC_ALLOW_PATH_ORDER_CHANGES
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="DPI_Virtualization"></a><a id="dpi_virtualization"></a><a id="DPI_VIRTUALIZATION"></a>DPI Virtualization</h3>
 * This API does not participate in DPI virtualization. All sizes in the DEVMODE structure are in terms of physical pixels, and are not related to the calling context.
 * @param {Integer} numPathArrayElements Number of elements in <i>pathArray</i>.
 * @param {Pointer<DISPLAYCONFIG_PATH_INFO>} pathArray Array of all display paths that are to be set. Only the paths within this array that have the DISPLAYCONFIG_PATH_ACTIVE flag set in the <b>flags</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_info">DISPLAYCONFIG_PATH_INFO</a> are set. This parameter can be <b>NULL</b>. The order in which active paths appear in this array determines the path priority. For more information about path priority order, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/path-priority-order">Path Priority Order</a>.
 * @param {Integer} numModeInfoArrayElements Number of elements in <i>modeInfoArray</i>.
 * @param {Pointer<DISPLAYCONFIG_MODE_INFO>} modeInfoArray Array of display source and target mode information (<a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_mode_info">DISPLAYCONFIG_MODE_INFO</a>) that is referenced by the <b>modeInfoIdx</b> member of DISPLAYCONFIG_PATH_SOURCE_INFO and DISPLAYCONFIG_PATH_TARGET_INFO element of path information from <i>pathArray</i>. This parameter can be <b>NULL</b>.
 * @param {SET_DISPLAY_CONFIG_FLAGS} flags 
 * @returns {Integer} The function returns one of the following return codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The combination of parameters and flags specified is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is not running a graphics driver that was written according to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">Windows Display Driver Model (WDDM)</a>. The function is only supported on a system with a WDDM driver running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have access to the console session. This error occurs if the calling process does not have access to the current desktop or is running on a remote session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_CONFIGURATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function could not find a workable solution for the source and target modes that the caller did not specify.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setdisplayconfig
 * @since windows6.1
 */
export SetDisplayConfig(numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, flags) {
    result := DllCall("USER32.dll\SetDisplayConfig", "uint", numPathArrayElements, DISPLAYCONFIG_PATH_INFO.Ptr, pathArray, "uint", numModeInfoArrayElements, DISPLAYCONFIG_MODE_INFO.Ptr, modeInfoArray, SET_DISPLAY_CONFIG_FLAGS, flags, Int32)
    return result
}

/**
 * The QueryDisplayConfig function retrieves information about all possible display paths for all display devices, or views, in the current setting.
 * @remarks
 * As the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdisplayconfigbuffersizes">GetDisplayConfigBufferSizes</a> function can only determine the required array size at a particular moment in time, it is possible that between calls to <b>GetDisplayConfigBufferSizes</b> and <b>QueryDisplayConfig</b> the system configuration will change and the provided array sizes will no longer be sufficient to store the new path data. In this situation, <b>QueryDisplayConfig</b> fails with ERROR_INSUFFICIENT_BUFFER, and the caller should call <b>GetDisplayConfigBufferSizes</b> again to get the new array sizes. The caller should then allocate the correct amount of memory. 
 * 
 * <b>QueryDisplayConfig</b> returns paths in the path array that the <i>pPathInfoArray</i> parameter specifies and the source and target modes in the mode array that the <i>pModeInfoArray</i> parameter specifies. <b>QueryDisplayConfig</b> always returns paths in path priority order. If QDC_ALL_PATHS is set in the <i>Flags</i> parameter, <b>QueryDisplayConfig</b> returns all the inactive paths after the active paths. 
 * 
 * Full path, source mode, and target mode information is available for all active paths. The <b>ModeInfoIdx</b> members in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_source_info">DISPLAYCONFIG_PATH_SOURCE_INFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structures for the source and target are set up for these active paths. For inactive paths, returned source and target mode information is not available; therefore, the target information in the path structure is set to default values, and the source and target mode indexes are marked as invalid. For database queries, if the current connect monitors have an entry, <b>QueryDisplayConfig</b> returns full path, source mode, and target mode information (same as for active paths). However, if the database does not have a entry, <b>QueryDisplayConfig</b> returns just the path information with the default target details (same as for inactive paths). 
 * 
 * For an example of how source and target mode information relates to path information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/relationship-of-mode-information-to-path-information">Relationship of Mode Information to Path Information</a>.
 * 
 * The caller can use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-displayconfiggetdeviceinfo">DisplayConfigGetDeviceInfo</a> to obtain additional information about the source or target device, for example, the monitor names and monitor preferred mode and source device name.
 * 
 * If a target is currently being force projected, the <b>statusFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_target_info">DISPLAYCONFIG_PATH_TARGET_INFO</a> structure has one of the DISPLAYCONFIG_TARGET_FORCED_XXX flags set. 
 * 
 * If the QDC_DATABASE_CURRENT flag is set in the <i>Flags</i> parameter, <b>QueryDisplayConfig</b> returns the topology identifier of the active database topology in the variable that the <i>pCurrentTopologyId</i> parameter points to. If the QDC_ALL_PATHS or QDC_ONLY_ACTIVE_PATHS flag is set in the <i>Flags</i> parameter, the <i>pCurrentTopologyId</i> parameter must be set to <b>NULL</b>; otherwise, <b>QueryDisplayConfig</b> returns ERROR_INVALID_PARAMETER.
 * 
 * If a caller calls <b>QueryDisplayConfig</b> with the QDC_DATABASE_CURRENT flag set in the <i>Flags</i> parameter, <b>QueryDisplayConfig</b> initializes the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_2dregion">DISPLAYCONFIG_2DREGION</a> structure that is specified in the <b>totalSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_video_signal_info">DISPLAYCONFIG_VIDEO_SIGNAL_INFO</a> structure to zeros and does not complete DISPLAYCONFIG_2DREGION.
 * 
 * The DEVMODE structure that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaysettingsa">EnumDisplaySettings</a> Win32 function (described in the Windows SDK documentation) contains information that relates to both the source and target modes. However, the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/ccd-apis">CCD APIs</a> explicitly separate the source and target mode components.
 * @param {QUERY_DISPLAY_CONFIG_FLAGS} flags 
 * @param {Pointer<Integer>} numPathArrayElements Pointer to a variable that contains the number of elements in <i>pPathInfoArray</i>. This parameter cannot be <b>NULL</b>. If <b>QueryDisplayConfig</b> returns ERROR_SUCCESS, <i>pNumPathInfoElements</i> is updated with the number of valid entries in <i>pPathInfoArray</i>.
 * @param {Pointer<DISPLAYCONFIG_PATH_INFO>} pathArray Pointer to a variable that contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_path_info">DISPLAYCONFIG_PATH_INFO</a> elements. Each element in <i>pPathInfoArray</i> describes a single path from a source to a target. The source and target mode information indexes are only valid in combination with the <i>pmodeInfoArray</i> tables that are returned for the API at the same time. This parameter cannot be <b>NULL</b>. The <i>pPathInfoArray</i> is always returned in path priority order. For more information about path priority order, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/path-priority-order">Path Priority Order</a>.
 * @param {Pointer<Integer>} numModeInfoArrayElements Pointer to a variable that specifies the number in element of the mode information table. This parameter cannot be <b>NULL</b>. If <b>QueryDisplayConfig</b> returns ERROR_SUCCESS, <i>pNumModeInfoArrayElements</i> is updated with the number of valid entries in <i>pModeInfoArray</i>.
 * @param {Pointer<DISPLAYCONFIG_MODE_INFO>} modeInfoArray Pointer to a variable that contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_mode_info">DISPLAYCONFIG_MODE_INFO</a> elements. This parameter cannot be <b>NULL</b>.
 * @param {Pointer<DISPLAYCONFIG_TOPOLOGY_ID>} currentTopologyId Pointer to a variable that receives the identifier of the currently active topology in the CCD database. For a list of possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ne-wingdi-displayconfig_topology_id">DISPLAYCONFIG_TOPOLOGY_ID</a> enumerated type.
 * 
 * The <i>pCurrentTopologyId</i> parameter is only set when the <i>Flags</i> parameter value is QDC_DATABASE_CURRENT.
 * 
 * If the <i>Flags</i> parameter value is set to QDC_DATABASE_CURRENT, the <i>pCurrentTopologyId</i> parameter must not be <b>NULL</b>. If the <i>Flags</i> parameter value is not set to QDC_DATABASE_CURRENT, the <i>pCurrentTopologyId</i> parameter value must be <b>NULL</b>.
 * @returns {WIN32_ERROR} The function returns one of the following return codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The combination of parameters and flags that are specified is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is not running a graphics driver that was written according to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">Windows Display Driver Model (WDDM)</a>. The function is only supported on a system with a WDDM driver running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have access to the console session. This error occurs if the calling process does not have access to the current desktop or is running on a remote session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The supplied path and mode buffer are too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-querydisplayconfig
 * @since windows6.1
 */
export QueryDisplayConfig(flags, numPathArrayElements, pathArray, numModeInfoArrayElements, modeInfoArray, currentTopologyId) {
    numPathArrayElementsMarshal := numPathArrayElements is VarRef ? "uint*" : "ptr"
    numModeInfoArrayElementsMarshal := numModeInfoArrayElements is VarRef ? "uint*" : "ptr"
    currentTopologyIdMarshal := currentTopologyId is VarRef ? "int*" : "ptr"

    result := DllCall("USER32.dll\QueryDisplayConfig", QUERY_DISPLAY_CONFIG_FLAGS, flags, numPathArrayElementsMarshal, numPathArrayElements, DISPLAYCONFIG_PATH_INFO.Ptr, pathArray, numModeInfoArrayElementsMarshal, numModeInfoArrayElements, DISPLAYCONFIG_MODE_INFO.Ptr, modeInfoArray, currentTopologyIdMarshal, currentTopologyId, WIN32_ERROR)
    return result
}

/**
 * The DisplayConfigGetDeviceInfo function retrieves display configuration information about the device.
 * @remarks
 * Use the <b>DisplayConfigGetDeviceInfo</b> function to obtain additional information about a source or target for an adapter, such as the display name, the preferred display mode, and source device name.
 * 
 * The caller can call <b>DisplayConfigGetDeviceInfo</b> to obtain more friendly names to display in the user interface. The caller can obtain names for the adapter, the source, and the target. The caller can also call <b>DisplayConfigGetDeviceInfo</b> to obtain the best resolution of the connected display device.
 * @param {Pointer<DISPLAYCONFIG_DEVICE_INFO_HEADER>} requestPacket A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure. This structure contains information about the request, which includes the packet type in the <b>type</b> member. The type and size of additional data that <b>DisplayConfigGetDeviceInfo</b> returns after the header structure depend on the packet type.
 * @returns {Integer} The function returns one of the following return codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The combination of parameters and flags specified are invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is not running a graphics driver that was written according to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">Windows Display Driver Model (WDDM)</a>. The function is only supported on a system with a WDDM driver running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have access to the console session. This error occurs if the calling process does not have access to the current desktop or is running on a remote session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of the packet that the caller passes is not big enough for the information that the caller requests.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-displayconfiggetdeviceinfo
 * @since windows6.0.6000
 */
export DisplayConfigGetDeviceInfo(requestPacket) {
    result := DllCall("USER32.dll\DisplayConfigGetDeviceInfo", DISPLAYCONFIG_DEVICE_INFO_HEADER.Ptr, requestPacket, Int32)
    return result
}

/**
 * The DisplayConfigSetDeviceInfo function sets the properties of a target.
 * @remarks
 * <b>DisplayConfigSetDeviceInfo</b> can currently only be used to start and stop boot persisted force projection on an analog target. For more information about boot persistence, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/forced-versus-connected-targets">Forced Versus Connected Targets</a>.
 * 
 * <b>DisplayConfigSetDeviceInfo</b> can only be used to set DISPLAYCONFIG_DEVICE_INFO_SET_XXX type of information. <b>DisplayConfigSetDeviceInfo</b> fails if the <b>type</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> is set to one of the DISPLAYCONFIG_DEVICE_INFO_GET_XXX values.
 * @param {Pointer<DISPLAYCONFIG_DEVICE_INFO_HEADER>} setPacket A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information to set for the device. The type and size of additional data that <b>DisplayConfigSetDeviceInfo</b> uses for the configuration comes after the header structure. This additional data depends on the packet type, as specified by the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER. For example, if the caller wants to change the boot persistence, that caller allocates and fills a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_set_target_persistence">DISPLAYCONFIG_SET_TARGET_PERSISTENCE</a> structure and passes a pointer to this structure in <i>setPacket</i>. Note that the first member of the DISPLAYCONFIG_SET_TARGET_PERSISTENCE structure is the DISPLAYCONFIG_DEVICE_INFO_HEADER.
 * @returns {Integer} The function returns one of the following return codes.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function succeeded.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The combination of parameters and flags specified are invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is not running a graphics driver that was written according to the <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">Windows Display Driver Model (WDDM)</a>. The function is only supported on a system with a WDDM driver running.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have access to the console session. This error occurs if the calling process does not have access to the current desktop or is running on a remote session.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of the packet that the caller passes is not big enough.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-displayconfigsetdeviceinfo
 * @since windows6.0.6000
 */
export DisplayConfigSetDeviceInfo(setPacket) {
    result := DllCall("USER32.dll\DisplayConfigSetDeviceInfo", DISPLAYCONFIG_DEVICE_INFO_HEADER.Ptr, setPacket, Int32)
    return result
}

/**
 * Retrieves an AR_STATE value containing the state of screen auto-rotation for the system, for example whether auto-rotation is supported, and whether it is enabled by the user.
 * @param {Pointer<AR_STATE>} pState Pointer to a location in memory that will receive the current state of auto-rotation for the system.
 * @returns {BOOL} TRUE if the method succeeds, otherwise FALSE.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdisplayautorotationpreferences">GetDisplayAutoRotationPreferences</a> for an example of using this function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getautorotationstate
 */
export GetAutoRotationState(pState) {
    pStateMarshal := pState is VarRef ? "int*" : "ptr"

    result := DllCall("USER32.dll\GetAutoRotationState", pStateMarshal, pState, BOOL)
    return result
}

/**
 * Retrieves the screen auto-rotation preferences for the current process.
 * @param {Pointer<ORIENTATION_PREFERENCE>} pOrientation Pointer to a location in memory that will receive the current orientation preference setting for the calling process.
 * @returns {BOOL} TRUE if the method succeeds, otherwise FALSE.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdisplayautorotationpreferences
 */
export GetDisplayAutoRotationPreferences(pOrientation) {
    pOrientationMarshal := pOrientation is VarRef ? "int*" : "ptr"

    result := DllCall("USER32.dll\GetDisplayAutoRotationPreferences", pOrientationMarshal, pOrientation, BOOL)
    return result
}

/**
 * Sets the screen auto-rotation preferences for the current process.
 * @param {ORIENTATION_PREFERENCE} orientation Pointer to a location in memory with the screen orientation preferences to set for the calling process.
 * @returns {BOOL} TRUE if the method succeeds, otherwise FALSE.
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdisplayautorotationpreferences">GetDisplayAutoRotationPreferences</a> for an example of using this function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setdisplayautorotationpreferences
 */
export SetDisplayAutoRotationPreferences(orientation) {
    result := DllCall("USER32.dll\SetDisplayAutoRotationPreferences", ORIENTATION_PREFERENCE, orientation, BOOL)
    return result
}

;@endregion Functions
