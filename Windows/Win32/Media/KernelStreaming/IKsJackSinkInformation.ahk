#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSJACK_SINK_INFORMATION.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsJackSinkInformation interface provides access to jack sink information if the jack is supported by the hardware.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksjacksinkinformation
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackSinkInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKsJackSinkInformation
     * @type {Guid}
     */
    static IID => Guid("{d9bd72ed-290f-4581-9ff3-61027a8fe532}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetJackSinkInformation"]

    /**
     * The GetJackSinkInformation method retrieves the sink information for the specified jack.
     * @returns {KSJACK_SINK_INFORMATION} Pointer to a caller-allocated buffer that receives the sink information of the jack in a <a href="https://docs.microsoft.com/windows/win32/api/devicetopology/ns-devicetopology-ksjack_sink_information">KSJACK_SINK_INFORMATION</a> structure. The buffer size must be at least <c>sizeof(KSJACK_SINK_INFORMATION)</c>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-iksjacksinkinformation-getjacksinkinformation
     */
    GetJackSinkInformation() {
        pJackSinkInformation := KSJACK_SINK_INFORMATION()
        result := ComCall(3, this, "ptr", pJackSinkInformation, "HRESULT")
        return pJackSinkInformation
    }
}
