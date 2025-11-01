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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_NodeId", "put_KsControl"]

    /**
     * 
     * @param {Integer} dwNodeId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iksnodecontrol-put_nodeid
     */
    put_NodeId(dwNodeId) {
        result := ComCall(3, this, "uint", dwNodeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pKsControl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-iksnodecontrol-put_kscontrol
     */
    put_KsControl(pKsControl) {
        pKsControlMarshal := pKsControl is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pKsControlMarshal, pKsControl, "HRESULT")
        return result
    }
}
