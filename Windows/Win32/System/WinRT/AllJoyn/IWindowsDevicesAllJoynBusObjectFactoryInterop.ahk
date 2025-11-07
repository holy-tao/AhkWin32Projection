#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 * @version v4.0.30319
 */
class IWindowsDevicesAllJoynBusObjectFactoryInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusObjectFactoryInterop
     * @type {Guid}
     */
    static IID => Guid("{6174e506-8b95-4e36-95c0-b88fed34938c}")

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
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromWin32Handle(win32handle, riid) {
        result := ComCall(6, this, "uint", win32handle, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
