#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDrawSurface3.ahk
#Include .\IDirectDrawClipper.ahk
#Include .\IDirectDrawPalette.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawSurface3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawSurface3
     * @type {Guid}
     */
    static IID => Guid("{da044e00-69b2-11d0-a1d5-00aa00b8dfbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAttachedSurface", "AddOverlayDirtyRect", "Blt", "BltBatch", "BltFast", "DeleteAttachedSurface", "EnumAttachedSurfaces", "EnumOverlayZOrders", "Flip", "GetAttachedSurface", "GetBltStatus", "GetCaps", "GetClipper", "GetColorKey", "GetDC", "GetFlipStatus", "GetOverlayPosition", "GetPalette", "GetPixelFormat", "GetSurfaceDesc", "Initialize", "IsLost", "Lock", "ReleaseDC", "Restore", "SetClipper", "SetColorKey", "SetOverlayPosition", "SetPalette", "Unlock", "UpdateOverlay", "UpdateOverlayDisplay", "UpdateOverlayZOrder", "GetDDInterface", "PageLock", "PageUnlock", "SetSurfaceDesc"]

    /**
     * 
     * @param {IDirectDrawSurface3} param0 
     * @returns {HRESULT} 
     */
    AddAttachedSurface(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} 
     */
    AddOverlayDirtyRect(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface3} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDBLTFX>} param4 
     * @returns {HRESULT} 
     */
    Blt(param0, param1, param2, param3, param4) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDBLTBATCH>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    BltBatch(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {IDirectDrawSurface3} param2 
     * @param {Pointer<RECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface3} param1 
     * @returns {HRESULT} 
     */
    DeleteAttachedSurface(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK>} param1 
     * @returns {HRESULT} 
     */
    EnumAttachedSurfaces(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK>} param2 
     * @returns {HRESULT} 
     */
    EnumOverlayZOrders(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", param0, param1Marshal, param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface3} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Flip(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS>} param0 
     * @returns {IDirectDrawSurface3} 
     */
    GetAttachedSurface(param0) {
        result := ComCall(12, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface3(param1)
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    GetBltStatus(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS>} param0 
     * @returns {HRESULT} 
     */
    GetCaps(param0) {
        result := ComCall(14, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawClipper} 
     */
    GetClipper() {
        result := ComCall(15, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawClipper(param0)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} 
     */
    GetColorKey(param0, param1) {
        result := ComCall(16, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @remarks
     * The <b>GetDC</b> function retrieves a common, class, or private DC depending on the class style of the specified window. For class and private DCs, <b>GetDC</b> leaves the previously assigned attributes unchanged. However, for common DCs, <b>GetDC</b> assigns default attributes to the DC each time it is retrieved. For example, the default font is System, which is a bitmap font. Because of this, the handle to a common DC returned by <b>GetDC</b> does not tell you what font, color, or brush was used when the window was drawn. To determine the font, call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextfacea">GetTextFace</a>.
     * 
     * Note that the handle to the DC can only be used by a single thread at any one time.
     * 
     * After painting with a common DC, the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-releasedc">ReleaseDC</a> function must be called to release the DC. Class and private DCs do not have to be released. <b>ReleaseDC</b> must be called from the same thread that called <b>GetDC</b>. The number of DCs is limited only by available memory.
     * @param {Pointer<HDC>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the DC for the specified window's client area.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdc
     */
    GetDC(param0) {
        result := ComCall(17, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    GetFlipStatus(param0) {
        result := ComCall(18, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} 
     */
    GetOverlayPosition(param0, param1) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * The GetPaletteEntries function retrieves a specified range of palette entries from the given logical palette.
     * @remarks
     * An application can determine whether a device supports palette operations by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a> function and specifying the RASTERCAPS constant.
     * 
     * If the <i>nEntries</i> parameter specifies more entries than exist in the palette, the remaining members of the <a href="https://docs.microsoft.com/previous-versions/dd162769(v=vs.85)">PALETTEENTRY</a> structure are not altered.
     * @returns {IDirectDrawPalette} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpaletteentries
     */
    GetPalette() {
        result := ComCall(20, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawPalette(param0)
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(param0) {
        result := ComCall(21, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @returns {HRESULT} 
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {IDirectDraw} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(23, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsLost() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Dismounts the volume and removes the volume's encryption key from system memory.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @param {Integer} param2 
     * @param {HANDLE} param3 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                           | Description                                                                                                                                                               |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                           | The method was successful.<br/>                                                                                                                                     |
     * | <dl> <dt>**E\_ACCESS\_DENIED**</dt> <dt>2147942405 (0x80070005)</dt> </dl>               | Applications are accessing this volume. If all access is nonexclusive, specifying the *ForceDismount* parameter as true allows the method to run successfully.<br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ENCRYPTED**</dt> <dt>2150694913 (0x80310001)</dt> </dl>          | The volume is fully decrypted and cannot be locked.<br/>                                                                                                            |
     * | <dl> <dt>**FVE\_E\_PROTECTION\_DISABLED**</dt> <dt>2150694945 (0x80310021)</dt> </dl>    | The volume's encryption key is available in the clear on the disk, preventing the volume from being locked.<br/>                                                    |
     * | <dl> <dt>**FVE\_E\_RECOVERY\_KEY\_REQUIRED**</dt> <dt>2150694946 (0x80310022)</dt> </dl> | The volume does not have key protectors of the type "Numerical Password" or "External Key" that are necessary to unlock the volume.<br/>                            |
     * @see https://learn.microsoft.com/windows/win32/SecProv/lock-win32-encryptablevolume
     */
    Lock(param0, param1, param2, param3) {
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(25, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @remarks
     * The application must call the <b>ReleaseDC</b> function for each call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowdc">GetWindowDC</a> function and for each call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a> function that retrieves a common DC.
     * 
     * An application cannot use the <b>ReleaseDC</b> function to release a DC that was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> function; instead, it must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletedc">DeleteDC</a> function. <b>ReleaseDC</b> must be called from the same thread that called <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a>.
     * @param {HDC} param0 
     * @returns {HRESULT} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-releasedc
     */
    ReleaseDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(26, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initiates a system restore.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/restore-systemrestore
     */
    Restore() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawClipper} param0 
     * @returns {HRESULT} 
     */
    SetClipper(param0) {
        result := ComCall(28, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} 
     */
    SetColorKey(param0, param1) {
        result := ComCall(29, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetOverlayPosition(param0, param1) {
        result := ComCall(30, this, "int", param0, "int", param1, "HRESULT")
        return result
    }

    /**
     * The SetPaletteEntries function sets RGB (red, green, blue) color values and flags in a range of entries in a logical palette.
     * @remarks
     * An application can determine whether a device supports palette operations by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a> function and specifying the RASTERCAPS constant.
     * 
     * Even if a logical palette has been selected and realized, changes to the palette do not affect the physical palette in the surface. <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-realizepalette">RealizePalette</a> must be called again to set the new logical palette into the surface.
     * @param {IDirectDrawPalette} param0 
     * @returns {HRESULT} If the function succeeds, the return value is the number of entries that were set in the logical palette.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setpaletteentries
     */
    SetPalette(param0) {
        result := ComCall(31, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Unlocks a region in an open file.
     * @remarks
     * This function always operates synchronously, but may not queue a completion entry when a completion port is associated with the file handle.
     * 
     * Unlocking a region of a file releases a previously acquired lock on the file. The region to unlock must correspond exactly to an existing locked region. Two adjacent regions of a file cannot be locked separately and then unlocked using a single region that spans both locked regions.
     * 
     * If a process terminates with a portion of a file locked or closes a file that has outstanding locks, the locks are unlocked by the operating system. However, the time it takes for the operating system to unlock these locks depends upon available system resources. Therefore, it is recommended that your process explicitly unlock all files it has locked when it terminates. If this is not done, access to these files may be denied if the operating system has not yet unlocked them.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-unlockfile
     */
    Unlock(param0) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(32, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface3} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDOVERLAYFX>} param4 
     * @returns {HRESULT} 
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    UpdateOverlayDisplay(param0) {
        result := ComCall(34, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface3} param1 
     * @returns {HRESULT} 
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} param0 
     * @returns {HRESULT} 
     */
    GetDDInterface(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    PageLock(param0) {
        result := ComCall(37, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    PageUnlock(param0) {
        result := ComCall(38, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetSurfaceDesc(param0, param1) {
        result := ComCall(39, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }
}
