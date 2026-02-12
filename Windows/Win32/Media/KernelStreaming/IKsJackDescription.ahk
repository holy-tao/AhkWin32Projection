#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSJACK_DESCRIPTION.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nn-devicetopology-iksjackdescription
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackDescription extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsJackDescription
     * @type {Guid}
     */
    static IID => Guid("{4509f757-2d46-4637-8e62-ce7db944f57b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJackCount", "GetJackDescription"]

    /**
     * The GetJackCount method gets the number of jacks required to connect to an audio endpoint device.
     * @remarks
     * An audio endpoint device that plays or records a stream that contains multiple channels might require a connection with more than one jack (physical connector).
     * 
     * For example, a set of surround speakers that plays a 6-channel audio stream might require three stereo jacks. In this example, the first jack transmits the channels for the front-left and front-right speakers, the second jack transmits the channels for the front-center and low-frequency-effects (subwoofer) speakers, and the third jack transmits the channels for the side-left and side-right speakers.
     * 
     * After calling this method to retrieve the jack count, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription-getjackdescription">IKsJackDescription::GetJackDescription</a> method once for each jack to obtain a description of the jack.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of jacks associated with the connector.
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iksjackdescription-getjackcount
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/devicetopology/nf-devicetopology-iksjackdescription-getjackdescription
     */
    GetJackDescription(nJack) {
        pDescription := KSJACK_DESCRIPTION()
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDescription
    }
}
