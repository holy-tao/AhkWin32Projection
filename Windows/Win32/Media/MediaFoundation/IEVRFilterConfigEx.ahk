#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEVRFilterConfig.ahk" { IEVRFilterConfig }

/**
 * Configures the DirectShow Enhanced Video Renderer (EVR) filter.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-ievrfilterconfigex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IEVRFilterConfigEx extends IEVRFilterConfig {
    /**
     * The interface identifier for IEVRFilterConfigEx
     * @type {Guid}
     */
    static IID := Guid("{aea36028-796d-454f-beee-b48071e24304}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEVRFilterConfigEx interfaces
    */
    struct Vtbl extends IEVRFilterConfig.Vtbl {
        SetConfigPrefs : IntPtr
        GetConfigPrefs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEVRFilterConfigEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the configuration parameters for the Microsoft DirectShow Enhanced Video Renderer Filter (EVR).
     * @param {Integer} dwConfigFlags Bitwise <b>OR</b> of  zero or more flags from the <a href="https://docs.microsoft.com/windows/win32/api/evr/ne-evr-evrfilterconfigprefs">EVRFilterConfigPrefs</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfigex-setconfigprefs
     */
    SetConfigPrefs(dwConfigFlags) {
        result := ComCall(5, this, "uint", dwConfigFlags, "HRESULT")
        return result
    }

    /**
     * Gets the configuration parameters for the Microsoft DirectShow Enhanced Video Renderer Filter filter.
     * @returns {Integer} Receives a  bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/win32/api/evr/ne-evr-evrfilterconfigprefs">EVRFilterConfigPrefs</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfigex-getconfigprefs
     */
    GetConfigPrefs() {
        result := ComCall(6, this, "uint*", &pdwConfigFlags := 0, "HRESULT")
        return pdwConfigFlags
    }

    Query(iid) {
        if (IEVRFilterConfigEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConfigPrefs := CallbackCreate(GetMethod(implObj, "SetConfigPrefs"), flags, 2)
        this.vtbl.GetConfigPrefs := CallbackCreate(GetMethod(implObj, "GetConfigPrefs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConfigPrefs)
        CallbackFree(this.vtbl.GetConfigPrefs)
    }
}
