#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IKsNodeControl interface must be implemented by USB Video Class (UVC) extension units.
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/nn-vidcap-iksnodecontrol
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsNodeControl extends IUnknown{
    /**
     * The interface identifier for IKsNodeControl
     * @type {Guid}
     */
    static IID => Guid("{11737c14-24a7-4bb5-81a0-0d003813b0c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwNodeId 
     * @returns {HRESULT} 
     */
    put_NodeId(dwNodeId) {
        result := ComCall(3, this, "uint", dwNodeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKsControl 
     * @returns {HRESULT} 
     */
    put_KsControl(pKsControl) {
        result := ComCall(4, this, "ptr", pKsControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
