#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that receives a data packet from the text input system on the local (client) computer.
 * @remarks
 * When this method is invoked, the Remote Desktop client application should forward the data packet to the appropriate remote computer over the `TextInput_ClientToServerDVC` [Dynamic Virtual Channel (DVC)](/windows/win32/termserv/dynamic-virtual-channels).
 * 
 * The Remote Desktop client application should create an instance of this delegate for each remote session it connects to. Each delegate instance should be passed to the [constructor](remotetextconnection_remotetextconnection_1474280690.md) of the [RemoteTextConnection](remotetextconnection.md) object that represents the corresponding remote connection.
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.input.remotetextconnectiondatahandler
 * @namespace Windows.System.RemoteDesktop.Input
 * @version WindowsRuntime 1.4
 */
class RemoteTextConnectionDataHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for RemoteTextConnectionDataHandler
     * @type {Guid}
     */
    static IID => Guid("{099ffbc8-8bcb-41b5-b056-57e77021bf1b}")

    /**
     * The class identifier for RemoteTextConnectionDataHandler
     * @type {Guid}
     */
    static CLSID => Guid("{099ffbc8-8bcb-41b5-b056-57e77021bf1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} pduData_length 
     * @param {Pointer<Integer>} pduData 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pduData_length, pduData) {
        pduDataMarshal := pduData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", pduData_length, pduDataMarshal, pduData, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
