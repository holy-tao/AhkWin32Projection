#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NORMALIZEDRECT.ahk" { NORMALIZEDRECT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVMRMixerControl interface is enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrmixercontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVMRMixerControl extends IUnknown {
    /**
     * The interface identifier for IVMRMixerControl
     * @type {Guid}
     */
    static IID := Guid("{1c1a17b0-bed0-415d-974b-dc6696131599}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVMRMixerControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAlpha         : IntPtr
        GetAlpha         : IntPtr
        SetZOrder        : IntPtr
        GetZOrder        : IntPtr
        SetOutputRect    : IntPtr
        GetOutputRect    : IntPtr
        SetBackgroundClr : IntPtr
        GetBackgroundClr : IntPtr
        SetMixingPrefs   : IntPtr
        GetMixingPrefs   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVMRMixerControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetAlpha method sets a constant alpha value that is applied to this video stream.
     * @remarks
     * The alpha value specified can be between 0.0 (fully transparent) and 1.0 (full opaque).
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Float} Alpha Specifies the alpha blending value to be applied to all the pixels in this stream.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setalpha
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "HRESULT")
        return result
    }

    /**
     * The GetAlpha method retrieves the constant alpha value that is applied to this video stream.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {Float} Pointer to a variable of type float that receives the current alpha value.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getalpha
     */
    GetAlpha(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", &pAlpha := 0, "HRESULT")
        return pAlpha
    }

    /**
     * The SetZOrder method sets this video stream's position in the Z-order; larger values are further away.
     * @remarks
     * The default Z-order is the order in which the pins were created. You only need to use this method if you wish to modify the default Z-order.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Integer} dwZ Double word containing the stream's position within the Z-order.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setzorder
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * The GetZOrder method retrieves this video stream's position in the Z order.
     * @remarks
     * The default Z-order is the order in which the pins were created.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {Integer} Pointer to a DWORD that receives the current position in the Z-order.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getzorder
     */
    GetZOrder(dwStreamID) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", &pZ := 0, "HRESULT")
        return pZ
    }

    /**
     * The SetOutputRect method sets the position of this stream within the composition rectangle.
     * @remarks
     * Because this rectangle exists in compositional space, there is no such thing as an "invalid" rectangle. For example, set left greater than right to mirror the video in the x direction. Specifying an empty rectangle turns off this stream.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Pointer<NORMALIZEDRECT>} pRect Pointer to a [NORMALIZEDRECT](/windows/win32/api/strmif/ns-strmif-normalizedrect) structure that specifies the position of the rectangle with composition space.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRect</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, NORMALIZEDRECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * The GetOutputRect method retrieves the position of this stream's video rectangle within the composition rectangle.
     * @remarks
     * Because this rectangle exists in compositional space, there is no such thing as an "invalid" rectangle. For example, if left is greater than right, it means the video is mirrored in the x direction. An empty rectangle turns off this stream.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {NORMALIZEDRECT} Pointer to a [NORMALIZEDRECT](/windows/win32/api/strmif/ns-strmif-normalizedrect) structure that receives the destination rectangle in composition space.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getoutputrect
     */
    GetOutputRect(dwStreamID) {
        pRect := NORMALIZEDRECT()
        result := ComCall(8, this, "uint", dwStreamID, NORMALIZEDRECT.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * Sets the background color on the output rectangle.
     * @param {COLORREF} ClrBkg Specifies the background color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, COLORREF, ClrBkg, "HRESULT")
        return result
    }

    /**
     * Gets the current background color on the output rectangle.
     * @param {Pointer<COLORREF>} lpClrBkg Address of a variable that receives the background color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        lpClrBkgMarshal := lpClrBkg is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, lpClrBkgMarshal, lpClrBkg, "HRESULT")
        return result
    }

    /**
     * Sets the mixing preferences for the stream.
     * @remarks
     * The flags for the mixing preferences are divided into three groups: decimation, filtering, and render target. The VMRMixerPrefs enumeration defines bitmasks to isolate these flags:
     * 
     * <ul>
     * <li>MixerPref_DecimateMask</li>
     * <li>MixerPref_FilteringMask</li>
     * <li>MixerPref_RenderTargetMask</li>
     * </ul>
     * You must specify a valid flag for each group. If you want to change a single flag, you can get the current preferences, remove the flag you don't want, and add the flag you want. For example:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * // Get the current mixing preferences.
     * DWORD dwPrefs;
     * pMixControl-&gt;GetMixingPrefs(&amp;dwPrefs);  
     * 
     * // Remove the current render target flag.
     * dwPrefs &amp;= ~MixerPref_RenderTargetMask; 
     * 
     * // Add the render target flag that we want.
     * dwPrefs |= MixerPref_RenderTargetYUV;
     * 
     * // Set the new flags.
     * pMixControl-&gt;SetMixingPrefs(dwPrefs);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * If the VMR is in renderless mode, you must set the allocator-presenter before calling <c>SetMixingPrefs</c>. Otherwise, the VMR cannot determine the capabilities of the Direct3D device.
     * @param {Integer} dwMixerPrefs Bitwise <b>OR</b> combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmixerprefs">VMRMixerPrefs</a> flags.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * Retrieves the mixing preferences for the stream.
     * @returns {Integer} Address of a variable that receives a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmixerprefs">VMRMixerPrefs</a> flags.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmixercontrol-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(12, this, "uint*", &pdwMixerPrefs := 0, "HRESULT")
        return pdwMixerPrefs
    }

    Query(iid) {
        if (IVMRMixerControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAlpha := CallbackCreate(GetMethod(implObj, "SetAlpha"), flags, 3)
        this.vtbl.GetAlpha := CallbackCreate(GetMethod(implObj, "GetAlpha"), flags, 3)
        this.vtbl.SetZOrder := CallbackCreate(GetMethod(implObj, "SetZOrder"), flags, 3)
        this.vtbl.GetZOrder := CallbackCreate(GetMethod(implObj, "GetZOrder"), flags, 3)
        this.vtbl.SetOutputRect := CallbackCreate(GetMethod(implObj, "SetOutputRect"), flags, 3)
        this.vtbl.GetOutputRect := CallbackCreate(GetMethod(implObj, "GetOutputRect"), flags, 3)
        this.vtbl.SetBackgroundClr := CallbackCreate(GetMethod(implObj, "SetBackgroundClr"), flags, 2)
        this.vtbl.GetBackgroundClr := CallbackCreate(GetMethod(implObj, "GetBackgroundClr"), flags, 2)
        this.vtbl.SetMixingPrefs := CallbackCreate(GetMethod(implObj, "SetMixingPrefs"), flags, 2)
        this.vtbl.GetMixingPrefs := CallbackCreate(GetMethod(implObj, "GetMixingPrefs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAlpha)
        CallbackFree(this.vtbl.GetAlpha)
        CallbackFree(this.vtbl.SetZOrder)
        CallbackFree(this.vtbl.GetZOrder)
        CallbackFree(this.vtbl.SetOutputRect)
        CallbackFree(this.vtbl.GetOutputRect)
        CallbackFree(this.vtbl.SetBackgroundClr)
        CallbackFree(this.vtbl.GetBackgroundClr)
        CallbackFree(this.vtbl.SetMixingPrefs)
        CallbackFree(this.vtbl.GetMixingPrefs)
    }
}
