#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsJackContainerId extends IUnknown{
    /**
     * The interface identifier for IKsJackContainerId
     * @type {Guid}
     */
    static IID => Guid("{c99af463-d629-4ec4-8c00-e54d68154248}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pJackContainerId 
     * @returns {HRESULT} 
     */
    GetJackContainerId(pJackContainerId) {
        result := ComCall(3, this, "ptr", pJackContainerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
