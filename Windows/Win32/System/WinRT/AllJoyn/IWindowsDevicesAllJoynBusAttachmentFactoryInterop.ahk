#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.devices.alljoyn.interop/nn-windows-devices-alljoyn-interop-iwindowsdevicesalljoynbusattachmentfactoryinterop
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 * @version v4.0.30319
 */
class IWindowsDevicesAllJoynBusAttachmentFactoryInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusAttachmentFactoryInterop
     * @type {Guid}
     */
    static IID => Guid("{4b8f7505-b239-4e7b-88af-f6682575d861}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromWin32Handle"]

    /**
     * 
     * @param {Integer} win32handle 
     * @param {Integer} enableAboutData 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromWin32Handle(win32handle, enableAboutData, riid, ppv) {
        result := ComCall(6, this, "uint", win32handle, "char", enableAboutData, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }
}
