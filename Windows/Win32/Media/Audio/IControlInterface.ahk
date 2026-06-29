#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IControlInterface interface represents a control interface on a part (connector or subunit) in a device topology. The client obtains a reference to a part's IControlInterface interface by calling the IPart::GetControlInterface method.
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-icontrolinterface
 * @namespace Windows.Win32.Media.Audio
 */
export default struct IControlInterface extends IUnknown {
    /**
     * The interface identifier for IControlInterface
     * @type {Guid}
     */
    static IID := Guid("{45d37c3f-5140-444a-ae24-400789f3cbf3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IControlInterface interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetName : IntPtr
        GetIID  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IControlInterface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetName method gets the friendly name for the audio function that the control interface encapsulates.
     * @remarks
     * As an example of a friendly name, a subunit with an <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiopeakmeter">IAudioPeakMeter</a> interface might have the friendly name "peak meter".
     * @returns {PWSTR} Pointer to a string pointer into which the method writes the address of a null-terminated, wide-character string that contains the friendly name. The method allocates the storage for the string. The caller is responsible for freeing the storage, when it is no longer needed, by calling the <b>CoTaskMemFree</b> function. If the <b>GetName</b> call fails,  <i>*ppwstrName</i> is <b>NULL</b>. For information about <b>CoTaskMemFree</b>, see the Windows SDK documentation.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-icontrolinterface-getname
     */
    GetName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppwstrName := 0, "HRESULT")
        return ppwstrName
    }

    /**
     * The GetIID method gets the interface ID of the function-specific control interface of the part.
     * @remarks
     * An object that represents a part (connector or subunit) has two control interfaces. The first is a generic control interface, <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-icontrolinterface">IControlInterface</a>, which has methods that are common to all types of controls. The second is a function-specific control interface that has methods that apply to a particular type of control. The <b>GetIID</b> method gets the interface ID of the second control interface. The client can supply this interface ID to the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipart-activate">IPart::Activate</a> method to create an instance of the part's function-specific interface.
     * 
     * The method gets one of the function-specific interface IDs shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Interface ID
     *             </th>
     * <th>Interface name
     *             </th>
     * </tr>
     * <tr>
     * <td>IID_IAudioAutoGainControl</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioautogaincontrol">IAudioAutoGainControl</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioBass</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiobass">IAudioBass</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioChannelConfig</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiochannelconfig">IAudioChannelConfig</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioInputSelector</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioinputselector">IAudioInputSelector</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioLoudness</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudioloudness">IAudioLoudness</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioMidrange</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomidrange">IAudioMidrange</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioMute</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiomute">IAudioMute</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioOutputSelector</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiooutputselector">IAudioOutputSelector</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioPeakMeter</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiopeakmeter">IAudioPeakMeter</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioTreble</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiotreble">IAudioTreble</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IAudioVolumeLevel</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iaudiovolumelevel">IAudioVolumeLevel</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IDeviceSpecificProperty</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-idevicespecificproperty">IDeviceSpecificProperty</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IKsFormatSupport</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iksformatsupport">IKsFormatSupport</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IID_IKsJackDescription</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-iksjackdescription">IKsJackDescription</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * To obtain the interface ID of an interface, use the <b>__uuidof</b> operator. For example, the interface ID of the <b>IAudioAutoGainControl</b> interface is defined as follows:
     * 
     * 
     * ``` syntax
     * 
     * const IID IID_IAudioAutoGainControl  __uuidof(IAudioAutoGainControl)
     * 
     * ```
     * 
     * For more information about the <b>__uuidof</b> operator, see the Windows SDK documentation.
     * @returns {Guid} Pointer to a GUID variable into which the method writes the interface ID of the function-specific control interface of the part. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-icontrolinterface-getiid
     */
    GetIID() {
        pIID := Guid()
        result := ComCall(4, this, Guid.Ptr, pIID, "HRESULT")
        return pIID
    }

    Query(iid) {
        if (IControlInterface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetIID := CallbackCreate(GetMethod(implObj, "GetIID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetIID)
    }
}
