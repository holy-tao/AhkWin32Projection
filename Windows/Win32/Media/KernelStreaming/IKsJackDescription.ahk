#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSJACK_DESCRIPTION.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsJackDescription interface provides information about the jacks or internal connectors that provide a physical connection between a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
 * @remarks
 * 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksjackdescription
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
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the number of jacks associated with the connector.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iksjackdescription-getjackcount
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * The GetJackDescription method gets a description of an audio jack.
     * @param {Integer} nJack The jack index. If the connection consists of <i>n</i> jacks, the jacks are numbered from 0 to <i>n</i>– 1. To get the number of jacks, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription-getjackcount">IKsJackDescription::GetJackCount</a> method.
     * @returns {KSJACK_DESCRIPTION} Pointer to a caller-allocated buffer into which the method writes a structure of type <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description">KSJACK_DESCRIPTION</a> that contains information about the jack. The buffer size must be at least sizeof(KSJACK_DESCRIPTION).
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iksjackdescription-getjackdescription
     */
    GetJackDescription(nJack) {
        pDescription := KSJACK_DESCRIPTION()
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription, "HRESULT")
        return pDescription
    }
}
