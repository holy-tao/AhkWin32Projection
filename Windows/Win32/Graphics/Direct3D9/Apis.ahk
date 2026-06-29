#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDirect3D9Ex.ahk" { IDirect3D9Ex }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirect3D9.ahk" { IDirect3D9 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */

;@region Functions
/**
 * The Direct3DCreate9Ex function (d3d9.h) creates an IDirect3D9 object and return an interface to it.
 * @remarks
 * The Direct3D object is the first Direct3D COM object that your graphical application needs to create and the last object that your application needs to release. Functions for enumerating and retrieving capabilities of a device are accessible through the Direct3D object. This enables applications to select devices without creating them.
 * 
 * Create an IDirect3D9 object as shown here:
 * 
 * 
 * ```
 * 
 * LPDIRECT3D9 g_pD3D = NULL;
 *     
 * if( NULL == (g_pD3D = Direct3DCreate9(D3D_SDK_VERSION)))
 *     return E_FAIL;
 * 
 * ```
 * 
 * 
 * The IDirect3D9 interface supports enumeration of active display adapters and allows the creation of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a> objects. If the user dynamically adds adapters (either by adding devices to the desktop, or by hot-docking a laptop), those devices will not be included in the enumeration. Creating a new IDirect3D9 interface will expose the new devices.
 * 
 * D3D_SDK_VERSION is passed to this function to ensure that the header files against which an application is compiled match the version of the runtime DLL's that are installed on the machine. D3D_SDK_VERSION is only changed in the runtime when a header change (or other code change) would require an application to be rebuilt. If this function fails, it indicates that the header file version does not match the runtime DLL version.
 * 
 * For an example, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/creating-a-device">Creating a Device (Direct3D 9)</a>.
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The value of this parameter should be D3D_SDK_VERSION. See Remarks.
 * @returns {IDirect3D9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a>*</b>
 * 
 * If successful, this function returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface; otherwise, a <b>NULL</b> pointer is returned.
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-direct3dcreate9
 */
export Direct3DCreate9(SDKVersion) {
    result := DllCall("d3d9.dll\Direct3DCreate9", "uint", SDKVersion, IDirect3D9)
    return result
}

/**
 * Marks the beginning of a user-defined event. PIX can use this event to trigger an action.
 * @remarks
 * User-defined events group together other events in a way that is meaningful to the target program so that they can be better represented in performance profiling tools. For example, a *Draw Spaceship* event might bracket a number of Direct3D calls that handle drawing a spaceship in a game. Events can be nested.
 * 
 * Each **D3DPERF_BeginEvent** call should have a matching **D3DPERF_EndEvent** call. Instantaneous events (which do not bracket other events) should be labeled by using **D3DPERF_SetMarker** rather than by **D3DPERF_BeginEvent** and **D3DPERF_EndEvent**.
 * @param {Integer} col Event color. This is the color to display the event in the event view.
 * @param {PWSTR} wszName Event name.
 * @returns {Integer} The zero-based level of the hierarchy that this event is starting in. If an error occurs, the return value will be negative.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_beginevent
 */
export D3DPERF_BeginEvent(col, wszName) {
    wszName := wszName is String ? StrPtr(wszName) : wszName

    result := DllCall("d3d9.dll\D3DPERF_BeginEvent", "uint", col, "ptr", wszName, Int32)
    return result
}

/**
 * Marks the end of a user-defined event. PIX can use this event to trigger an action.
 * @returns {Integer} The level of the hierarchy in which the event is ending. If an error occurs, this value is negative.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_endevent
 */
export D3DPERF_EndEvent() {
    result := DllCall("d3d9.dll\D3DPERF_EndEvent", Int32)
    return result
}

/**
 * Mark an instantaneous event. PIX can use this event to trigger an action.
 * @remarks
 * Instantaneous user events do not bracket or group other events. For example, when the user fires a weapon in a game, a *Shot Fired* event could be created by a **D3DPERF_SetMarker** call. To group together multiple events under a single, user-defined name, use **D3DPERF_BeginEvent** and **D3DPERF_EndEvent** rather than **D3DPERF_SetMarker**.
 * @param {Integer} col Event color. This is the color to display the event in the event view.
 * @param {PWSTR} wszName Event name.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_setmarker
 */
export D3DPERF_SetMarker(col, wszName) {
    wszName := wszName is String ? StrPtr(wszName) : wszName

    DllCall("d3d9.dll\D3DPERF_SetMarker", "uint", col, "ptr", wszName)
}

/**
 * Mark a series of frames with the specified color and name in the PIXRun file. This function is not currently supported by PIX.
 * @remarks
 * To make analysis easier, the target program can use color to mark each level of a target program.
 * @param {Integer} col Event color. This is the color to display the event in the event view.
 * @param {PWSTR} wszName Event name.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_setregion
 */
export D3DPERF_SetRegion(col, wszName) {
    wszName := wszName is String ? StrPtr(wszName) : wszName

    DllCall("d3d9.dll\D3DPERF_SetRegion", "uint", col, "ptr", wszName)
}

/**
 * Determine whether a performance profiler is requesting that the current frame be resubmitted to Direct3D for performance analysis. This function is not currently supported by PIX.
 * @remarks
 * The function should be called immediately after **IDirect3DDevice9::Present** is called.
 * @returns {BOOL} If the return value is TRUE, the caller should repeat the same sequence of calls. If FALSE, the caller should continue.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_queryrepeatframe
 */
export D3DPERF_QueryRepeatFrame() {
    result := DllCall("d3d9.dll\D3DPERF_QueryRepeatFrame", BOOL)
    return result
}

/**
 * Set profiler options specified by the target program.
 * @param {Integer} dwOptions User options recognizable by PIX. Set this to 1 to notify PIX that the target program does not give permission to be profiled.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_setoptions
 */
export D3DPERF_SetOptions(dwOptions) {
    DllCall("d3d9.dll\D3DPERF_SetOptions", "uint", dwOptions)
}

/**
 * Determine the current state of the profiler from the target program.
 * @returns {Integer} A non-zero value when PIX is profiling the target program; otherwise, zero.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3d9/nf-d3d9-d3dperf_getstatus
 */
export D3DPERF_GetStatus() {
    result := DllCall("d3d9.dll\D3DPERF_GetStatus", UInt32)
    return result
}

/**
 * Creates an IDirect3D9Ex object and returns an interface to it.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3d9ex">IDirect3D9Ex</a> object is the first object that the application creates and the
 *         last object that the application releases. Functions for enumerating and retrieving
 *         capabilities of a device are accessible through the <b>IDirect3D9Ex</b> object.
 *         This enables applications to select devices without creating them.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3d9ex">IDirect3D9Ex</a> interface supports enumeration of active display adapters
 *         and allows the creation of <b>IDirect3D9Ex</b> objects. If the user dynamically adds
 *         adapters (either by adding devices to the desktop, or by hot-docking a laptop), these
 *         devices are not included in the enumeration. Creating a new <b>IDirect3D9Ex</b> interface will expose the new devices.
 * 
 * Pass the <b>D3D_SDK_VERSION</b> flag to this function to ensure that header files used in the
 *         compiled application match the version of the installed runtime DLLs. <b>D3D_SDK_VERSION
 *         </b> is changed in the runtime only when a header or another code change would require
 *         rebuilding the application. If this function fails, it indicates that the versions of the
 *         header file and the runtime DLL do not match.
 * 
 * <div class="alert"><b>Note</b>  <b>Direct3DCreate9Ex</b> is supported only in Windows Vista, Windows Server 2008, and Windows 7.  
 *         Earlier versions of the D3D9.dll library do not include <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3d9ex">Direct3D9Ex</a> and <b>Direct3DCreate9Ex</b>.</div>
 * <div> </div>
 * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
 * 
 * The value of this parameter should be <b>D3D_SDK_VERSION</b>. See Remarks.
 * @returns {IDirect3D9Ex} 
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-direct3dcreate9ex
 */
export Direct3DCreate9Ex(SDKVersion) {
    result := DllCall("d3d9.dll\Direct3DCreate9Ex", "uint", SDKVersion, "ptr*", &param1 := 0, "HRESULT")
    return IDirect3D9Ex(param1)
}

;@endregion Functions
