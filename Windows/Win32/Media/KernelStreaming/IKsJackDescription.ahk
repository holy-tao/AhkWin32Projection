#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\KSJACK_DESCRIPTION.ahk" { KSJACK_DESCRIPTION }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IKsJackDescription interface provides information about the jacks or internal connectors that provide a physical connection between a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
 * @remarks
 * If an audio endpoint device supports the <b>IKsJackDescription</b> interface, the Windows multimedia control panel, Mmsys.cpl, displays the jack information. To view the jack information, follow these steps:
 * 
 * <ol>
 * <li>
 * To run Mmsys.cpl, open a Command Prompt window and enter the following command:
 * 
 * <b>control mmsys.cpl</b>
 * 
 * Alternatively, you can run Mmsys.cpl by right-clicking the speaker icon in the notification area, which is located on the right side of the taskbar, and selecting either <b>Playback Devices</b> or <b>Recording Devices</b>.
 * 
 * </li>
 * <li>
 * After the Mmsys.cpl window opens, select a device from either the list of playback devices or the list of recording devices, and click <b>Properties</b>.
 * 
 * </li>
 * <li>
 * When the properties window opens, click <b>General</b>. If the selected property page displays the jack information for the device, the device supports the <b>IKsJackDescription</b> interface. If the property page displays the text "No jack information is available", the device does not support the interface.
 * 
 * </li>
 * </ol>
 * The following code example shows how to obtain the <b>IKsJackDescription</b> interface for an audio endpoint device:
 * 
 * 
 * ```cpp
 * //-----------------------------------------------------------
 * // Get the IKsJackDescription interface that describes the
 * // audio jack or jacks that the endpoint device plugs into.
 * //-----------------------------------------------------------
 * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nn-devicetopology-iksjackdescription
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsJackDescription extends IUnknown {
    /**
     * The interface identifier for IKsJackDescription
     * @type {Guid}
     */
    static IID := Guid("{4509f757-2d46-4637-8e62-ce7db944f57b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsJackDescription interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetJackCount       : IntPtr
        GetJackDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsJackDescription.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetJackCount method gets the number of jacks required to connect to an audio endpoint device.
     * @remarks
     * An audio endpoint device that plays or records a stream that contains multiple channels might require a connection with more than one jack (physical connector).
     * 
     * For example, a set of surround speakers that plays a 6-channel audio stream might require three stereo jacks. In this example, the first jack transmits the channels for the front-left and front-right speakers, the second jack transmits the channels for the front-center and low-frequency-effects (subwoofer) speakers, and the third jack transmits the channels for the side-left and side-right speakers.
     * 
     * After calling this method to retrieve the jack count, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription-getjackdescription">IKsJackDescription::GetJackDescription</a> method once for each jack to obtain a description of the jack.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of jacks associated with the connector.
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription-getjackcount
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * The GetJackDescription method gets a description of an audio jack.
     * @remarks
     * When a user needs to plug an audio endpoint device into a jack or unplug it from a jack, an audio application can use the descriptive information that it retrieves from this method to help the user to find the jack. This information includes:
     * 
     * <ul>
     * <li>The physical location of the jack on the computer chassis or external box.</li>
     * <li>The color of the jack.</li>
     * <li>The type of physical connector used for the jack.</li>
     * <li>The mapping of channels to the jack.</li>
     * </ul>
     * For more information, see <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description">KSJACK_DESCRIPTION</a>.
     * @param {Integer} nJack The jack index. If the connection consists of <i>n</i> jacks, the jacks are numbered from 0 to <i>n</i>– 1. To get the number of jacks, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription-getjackcount">IKsJackDescription::GetJackCount</a> method.
     * @returns {KSJACK_DESCRIPTION} Pointer to a caller-allocated buffer into which the method writes a structure of type <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description">KSJACK_DESCRIPTION</a> that contains information about the jack. The buffer size must be at least sizeof(KSJACK_DESCRIPTION).
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iksjackdescription-getjackdescription
     */
    GetJackDescription(nJack) {
        pDescription := KSJACK_DESCRIPTION()
        result := ComCall(4, this, "uint", nJack, KSJACK_DESCRIPTION.Ptr, pDescription, "HRESULT")
        return pDescription
    }

    Query(iid) {
        if (IKsJackDescription.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetJackCount := CallbackCreate(GetMethod(implObj, "GetJackCount"), flags, 2)
        this.vtbl.GetJackDescription := CallbackCreate(GetMethod(implObj, "GetJackDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetJackCount)
        CallbackFree(this.vtbl.GetJackDescription)
    }
}
