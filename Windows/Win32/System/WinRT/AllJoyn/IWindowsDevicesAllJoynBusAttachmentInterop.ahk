#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.devices.alljoyn.interop/nn-windows-devices-alljoyn-interop-iwindowsdevicesalljoynbusattachmentinterop
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 * @version v4.0.30319
 */
class IWindowsDevicesAllJoynBusAttachmentInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusAttachmentInterop
     * @type {Guid}
     */
    static IID => Guid("{fd89c65b-b50e-4a19-9d0c-b42b783281cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Win32Handle"]

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    get_Win32Handle(value) {
        result := ComCall(6, this, "uint*", value, "HRESULT")
        return result
    }
}
