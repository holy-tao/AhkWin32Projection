#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsJackSinkInformation interface provides access to jack sink information if the jack is supported by the hardware.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iksjacksinkinformation
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackSinkInformation extends IUnknown{
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
     * 
     * @param {Pointer<KSJACK_SINK_INFORMATION>} pJackSinkInformation 
     * @returns {HRESULT} 
     */
    GetJackSinkInformation(pJackSinkInformation) {
        result := ComCall(3, this, "ptr", pJackSinkInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
