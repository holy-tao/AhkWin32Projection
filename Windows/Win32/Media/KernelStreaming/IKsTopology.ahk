#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class IKsTopology extends IUnknown{
    /**
     * The interface identifier for IKsTopology
     * @type {Guid}
     */
    static IID => Guid("{28f54683-06fd-11d2-b27a-00a0c9223196}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} NodeId 
     * @param {Integer} Flags 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<IUnknown>} UnkOuter 
     * @param {Pointer<Guid>} InterfaceId 
     * @param {Pointer<Void>} Interface 
     * @returns {HRESULT} 
     */
    CreateNodeInstance(NodeId, Flags, DesiredAccess, UnkOuter, InterfaceId, Interface) {
        result := ComCall(3, this, "uint", NodeId, "uint", Flags, "uint", DesiredAccess, "ptr", UnkOuter, "ptr", InterfaceId, "ptr", Interface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
