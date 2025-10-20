#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMMEndpoint interface represents an audio endpoint device.
 * @see https://docs.microsoft.com/windows/win32/api//mmdeviceapi/nn-mmdeviceapi-immendpoint
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IMMEndpoint extends IUnknown{
    /**
     * The interface identifier for IMMEndpoint
     * @type {Guid}
     */
    static IID => Guid("{1be09788-6894-4089-8586-9a2a6c265ac5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pDataFlow 
     * @returns {HRESULT} 
     */
    GetDataFlow(pDataFlow) {
        result := ComCall(3, this, "int*", pDataFlow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
