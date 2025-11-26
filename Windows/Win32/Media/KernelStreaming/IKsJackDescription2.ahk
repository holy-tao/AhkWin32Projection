#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSJACK_DESCRIPTION2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsJackDescription2 interface provides information about the jacks or internal connectors that provide a physical connection between a device on an audio adapter and an external or internal endpoint device (for example, a microphone or CD player).
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksjackdescription2
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackDescription2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsJackDescription2
     * @type {Guid}
     */
    static IID => Guid("{478f3a9b-e0c9-4827-9228-6f5505ffe76a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJackCount", "GetJackDescription2"]

    /**
     * The GetJackCount method gets the number of jacks on the connector, which are required to connect to an endpoint device.
     * @returns {Integer} Receives the number of audio jacks associated with the connector.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iksjackdescription2-getjackcount
     */
    GetJackCount() {
        result := ComCall(3, this, "uint*", &pcJacks := 0, "HRESULT")
        return pcJacks
    }

    /**
     * The GetJackDescription2 method gets the description of a specified audio jack.
     * @param {Integer} nJack The index of the jack to get a description for. If the connection consists of <i>n</i> jacks, the jacks are numbered from 0 to <i>n</i>– 1. To get the number of jacks, call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-iksjackdescription2-getjackcount">IKsJackDescription::GetJackCount</a> method.
     * @returns {KSJACK_DESCRIPTION2} Pointer to a caller-allocated buffer into which the method writes a structure of type <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_description2">KSJACK_DESCRIPTION2</a> that contains information about the jack. The buffer size must be at least <c>sizeof(KSJACK_DESCRIPTION2)</c>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iksjackdescription2-getjackdescription2
     */
    GetJackDescription2(nJack) {
        pDescription2 := KSJACK_DESCRIPTION2()
        result := ComCall(4, this, "uint", nJack, "ptr", pDescription2, "HRESULT")
        return pDescription2
    }
}
