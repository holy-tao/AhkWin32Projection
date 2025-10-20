#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IControlChangeNotify interface provides notifications when the status of a part (connector or subunit) changes.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-icontrolchangenotify
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IControlChangeNotify extends IUnknown{
    /**
     * The interface identifier for IControlChangeNotify
     * @type {Guid}
     */
    static IID => Guid("{a09513ed-c709-4d21-bd7b-5f34c47f3947}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwSenderProcessId 
     * @param {Pointer<Guid>} pguidEventContext 
     * @returns {HRESULT} 
     */
    OnNotify(dwSenderProcessId, pguidEventContext) {
        result := ComCall(3, this, "uint", dwSenderProcessId, "ptr", pguidEventContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
