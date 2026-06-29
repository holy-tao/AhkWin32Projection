#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISBE2EnumStream.ahk" { ISBE2EnumStream }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IPin.ahk" { IPin }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISBE2MediaTypeProfile.ahk" { ISBE2MediaTypeProfile }

/**
 * Defines crossbar functionality for a Stream Buffer Engine (SBE) version 2 (SBE2) Stream Buffer Source filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2Crossbar)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-isbe2crossbar
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISBE2Crossbar extends IUnknown {
    /**
     * The interface identifier for ISBE2Crossbar
     * @type {Guid}
     */
    static IID := Guid("{547b6d26-3226-487e-8253-8aa168749434}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISBE2Crossbar interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnableDefaultMode : IntPtr
        GetInitialProfile : IntPtr
        SetOutputProfile  : IntPtr
        EnumStreams       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISBE2Crossbar.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables or disables the profile default mode and stream default mode for a crossbar in a Stream Buffer Source filter.
     * @remarks
     * In stream default mode, SBE first checks the Windows Media Center TV settings to determine if a preferred language is set. If a preferred language is set:
     * 
     * <ul>
     * <li>If an audio stream in the preferred language exists, SBE outputs that audio stream.</li>
     * <li>If an audio stream in the preferred language does not exist, SBE outputs the default audio stream, which is set when the stream is captured.</li>
     * </ul>
     * If no preferred language is set, Windows Media Center is either not present or not configured. In this case:
     * 
     * <ul>
     * <li>If an audio stream in the language the operating system locale exists, SBE outputs that audio stream.</li>
     * <li>Otherwise, SBE outputs the default audio stream.</li>
     * </ul>
     * @param {Integer} DefaultFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-enabledefaultmode
     */
    EnableDefaultMode(DefaultFlags) {
        result := ComCall(3, this, "uint", DefaultFlags, "HRESULT")
        return result
    }

    /**
     * Gets the initial profile that lists the media types that are present in the currently loaded WTV file.
     * @returns {ISBE2MediaTypeProfile} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2mediatypeprofile">ISBE2MediaTypeProfile</a> interface that implements the profile.
     *           
     *           The caller is responsible for releasing this interface. You can use this pointer to create a custom profile that you pass to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-isbe2crossbar-setoutputprofile">SetOutputProfile</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-getinitialprofile
     */
    GetInitialProfile() {
        result := ComCall(4, this, "ptr*", &ppProfile := 0, "HRESULT")
        return ISBE2MediaTypeProfile(ppProfile)
    }

    /**
     * Replaces the default or current input profile with the profile specified in this method.
     * @param {ISBE2MediaTypeProfile} pProfile Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2mediatypeprofile">ISBE2MediaTypeProfile</a> interface for the profile that replaces the crossbar default profile.
     * @param {Pointer<Integer>} pcOutputPins On input, specifies the size of an array allocated to receive <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers for the output pins that correspond to the streams in the new profile. The <i>ppOutputPins</i> parameter points to this array. On output, if the call succeeds, gets the actual number of <b>IPin</b> pointers returned in the <i>ppOutputPins</i> output parameter.
     * @param {Pointer<IPin>} ppOutputPins On input, specifies a pointer to an array of uninitialized <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> pointers. On output, if the call succeeds, the <b>IPin</b> pointers in the array are initialized to point to the filter output pins that have the media types listed in the new profile. The <i>pcOutputPins</i> parameter gives the number of elements in the array. The caller is responsible for freeing the <b>IPin</b> interface pointers returned in the array.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>S_OK</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_INVALIDARG</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pProfile</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_POINTER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pcOutputPins</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>E_UNEXPECTED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot set output profile because profile default mode is enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-setoutputprofile
     */
    SetOutputProfile(pProfile, pcOutputPins, ppOutputPins) {
        pcOutputPinsMarshal := pcOutputPins is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pProfile, pcOutputPinsMarshal, pcOutputPins, IPin.Ptr, ppOutputPins, "HRESULT")
        return result
    }

    /**
     * Gets an enumeration object for all streams that are discovered in a WTV file. The filter crossbar, which exposes the ISBE2Crossbar interface, manages the mappings between the streams in the WTV file and the filter output pins.
     * @returns {ISBE2EnumStream} Receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-isbe2enumstream">ISBE2EnumStream</a> interface that the crossbar implements.
     *           You can use the methods that are defined by the <b>ISBE2EnumStream</b>  interface to enumerate the streams that can be mapped to output pins in the current profile. The caller is responsible for releasing the interface.
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-enumstreams
     */
    EnumStreams() {
        result := ComCall(6, this, "ptr*", &ppStreams := 0, "HRESULT")
        return ISBE2EnumStream(ppStreams)
    }

    Query(iid) {
        if (ISBE2Crossbar.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnableDefaultMode := CallbackCreate(GetMethod(implObj, "EnableDefaultMode"), flags, 2)
        this.vtbl.GetInitialProfile := CallbackCreate(GetMethod(implObj, "GetInitialProfile"), flags, 2)
        this.vtbl.SetOutputProfile := CallbackCreate(GetMethod(implObj, "SetOutputProfile"), flags, 4)
        this.vtbl.EnumStreams := CallbackCreate(GetMethod(implObj, "EnumStreams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnableDefaultMode)
        CallbackFree(this.vtbl.GetInitialProfile)
        CallbackFree(this.vtbl.SetOutputProfile)
        CallbackFree(this.vtbl.EnumStreams)
    }
}
